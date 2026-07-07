#!/usr/bin/env python3
"""Import one-shot Firestore → SQL Connect (ssids, colación, incidencias).

Lee las colecciones vía Firestore REST y escribe vía el endpoint admin
executeGraphql de Data Connect (valida contra el schema; bypassa @auth como
servicio). Idempotente: todo son _upsert con los doc ids de Firestore como PK.

Uso:
  python3 scripts/import-firestore.py            # dry-run (solo cuenta)
  python3 scripts/import-firestore.py --apply    # importa de verdad

Requiere: gcloud auth con acceso al proyecto vendeme-app, y el servicio
Data Connect ya desplegado (make deploy / make migrate).
"""
import json
import subprocess
import sys
import urllib.error
import urllib.request

PROJECT = "vendeme-app"
LOCATION = "us-central1"
SERVICE = "vendeme-sqlconnect"
FS_BASE = f"https://firestore.googleapis.com/v1/projects/{PROJECT}/databases/(default)/documents"
DC_URL = (f"https://firebasedataconnect.googleapis.com/v1/projects/{PROJECT}"
          f"/locations/{LOCATION}/services/{SERVICE}:executeGraphql")

APPLY = "--apply" in sys.argv


def token():
    return subprocess.check_output(
        ["gcloud", "auth", "print-access-token"], text=True).strip()


TOKEN = token()


def http(url, body=None):
    req = urllib.request.Request(url, method="POST" if body else "GET")
    req.add_header("Authorization", f"Bearer {TOKEN}")
    req.add_header("x-goog-user-project", PROJECT)
    if body is not None:
        req.add_header("Content-Type", "application/json")
        req.data = json.dumps(body).encode()
    with urllib.request.urlopen(req) as r:
        return json.loads(r.read())


def fs_list(collection):
    """Todos los docs de una colección (paginado)."""
    docs, page = [], None
    while True:
        url = f"{FS_BASE}/{collection}?pageSize=300"
        if page:
            url += f"&pageToken={page}"
        resp = http(url)
        docs += resp.get("documents", [])
        page = resp.get("nextPageToken")
        if not page:
            return docs


def fv(doc, field, default=None):
    """Valor plano de un campo Firestore REST."""
    v = doc.get("fields", {}).get(field)
    if v is None:
        return default
    for k, val in v.items():
        if k == "integerValue":
            return int(val)
        if k == "doubleValue":
            return float(val)
        if k == "arrayValue":
            return [list(x.values())[0] for x in val.get("values", [])]
        if k == "nullValue":
            return default
        return val  # stringValue, timestampValue, booleanValue
    return default


def doc_id(doc):
    return doc["name"].rsplit("/", 1)[1]


def gql(query, variables):
    resp = http(DC_URL, {"query": query, "variables": variables})
    if resp.get("errors"):
        raise RuntimeError(json.dumps(resp["errors"])[:500])
    return resp


def main():
    stats = {}

    # --- ssids ---
    ssids = fs_list("ssids")
    stats["ssids"] = len(ssids)
    if APPLY:
        for d in ssids:
            gql("""mutation($id:String!,$s:String!,$p:String!){
                     ssid_upsert(data:{id:$id, ssid:$s, password:$p}) }""",
                {"id": doc_id(d), "s": fv(d, "ssid", ""), "p": fv(d, "password", "")})

    # --- settings/colacion (doc único) ---
    try:
        s = http(f"{FS_BASE}/settings/colacion")
        stats["colacionSettings"] = 1
        if APPLY:
            gql("""mutation($tp:Int!,$cn:String!,$cr:String,$cp:String,$ce:String){
                     colacionSetting_upsert(data:{id:"colacion", ticketPrice:$tp,
                       companyName:$cn, companyRut:$cr, companyPhone:$cp, companyEmail:$ce}) }""",
                {"tp": int(fv(s, "ticketPrice", 0)), "cn": fv(s, "companyName", "Vendeme"),
                 "cr": fv(s, "companyRut", ""), "cp": fv(s, "companyPhone", ""),
                 "ce": fv(s, "companyEmail", "")})
    except urllib.error.HTTPError:
        stats["colacionSettings"] = 0  # aún no existe

    # --- colacionTickets ---
    tickets = fs_list("colacionTickets")
    stats["colacionTickets"] = len(tickets)
    if APPLY:
        for d in tickets:
            gql("""mutation($id:String!,$t:String!,$d:Timestamp!,$m:String!,
                            $eid:String!,$en:String!,$er:String,$tp:Int!){
                     colacionTicket_upsert(data:{id:$id, type:$t, date:$d, month:$m,
                       employeeId:$eid, employeeName:$en, employeeRut:$er, ticketPrice:$tp}) }""",
                {"id": doc_id(d), "t": fv(d, "type", "colacion"),
                 "d": fv(d, "date"), "m": fv(d, "month", ""),
                 "eid": fv(d, "employeeID", ""), "en": fv(d, "employeeName", ""),
                 "er": fv(d, "employeeRut", ""), "tp": int(fv(d, "ticketPrice", 0))})

    # --- incidents (Firestore guarda date como STRING ISO y severity minúscula) ---
    incidents = fs_list("incidents")
    stats["incidents"] = len(incidents)
    if APPLY:
        for d in incidents:
            images = fv(d, "images")
            gql("""mutation($id:String!,$e:String,$te:String,$det:String,
                            $sev:IncidenceSeverity!,$dt:Timestamp!,$img:String){
                     incidence_upsert(data:{id:$id, eventId:$e, terminalEventId:$te,
                       detail:$det, severity:$sev, date:$dt, images:$img}) }""",
                {"id": doc_id(d), "e": fv(d, "eventID"), "te": fv(d, "terminalEventID"),
                 "det": fv(d, "detail"),
                 "sev": (fv(d, "severity", "info") or "info").upper(),
                 "dt": fv(d, "date"),
                 "img": json.dumps(images) if images else None})

    mode = "APLICADO" if APPLY else "dry-run (usa --apply para importar)"
    print(f"[{mode}] " + ", ".join(f"{k}: {v}" for k, v in stats.items()))


if __name__ == "__main__":
    main()
