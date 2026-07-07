#!/usr/bin/env bash
# Test de integración e2e contra el EMULADOR (PGlite, local — nunca toca Cloud
# SQL ni producción). Requiere el emulador corriendo:  make emulator
# Si no está disponible, se OMITE (no falla).
#
# Los claims se prueban con el endpoint admin del emulador (:executeGraphql +
# extensions.impersonate.authClaims), igual que garageapp_sql_connect.
#
# Cubre: (1) ssids (staff-only + unicidad), (2) colación (settings fila única +
# tickets append-only), (3) incidencias (insert level USER, lectura staff).
set -uo pipefail

PROJECT="${DC_PROJECT:-vendeme-app}"
LOCATION="${DC_LOCATION:-us-central1}"
SERVICE="${DC_SERVICE:-vendeme-sqlconnect}"
PORT="${DC_EMULATOR_PORT:-9399}"
BASE="http://127.0.0.1:${PORT}/v1/projects/${PROJECT}/locations/${LOCATION}/services/${SERVICE}:executeGraphql"

pass=0; fail=0
ok()  { echo "  ✓ $1"; pass=$((pass+1)); }
bad() { echo "  ✗ $1"; fail=$((fail+1)); }

# gql <query> <variables-json> <claims-json|"">   ("" => modo admin, sin auth)
gql() {
  local q="$1" vars="${2:-}" claims="${3:-}" body
  [ -n "$vars" ] || vars='{}'
  if [ -n "$claims" ]; then
    body=$(jq -n --arg q "$q" --argjson v "$vars" --argjson c "$claims" \
      '{query:$q, variables:$v, extensions:{impersonate:{authClaims:$c}}}')
  else
    body=$(jq -n --arg q "$q" --argjson v "$vars" '{query:$q, variables:$v}')
  fi
  curl -s --max-time 10 -X POST "$BASE" -H "Content-Type: application/json" -d "$body"
}

echo "▶ e2e contra el emulador ($BASE)"

probe=$(gql 'query { ssids { id } }' '{}' '' || true)
if ! jq -e '.data.ssids' >/dev/null 2>&1 <<<"$probe"; then
  echo "⊘ Emulador no disponible en :$PORT — e2e OMITIDO. Levántalo con 'make emulator'."
  exit 0
fi

# Identidades: staff por claim (bazo/employee, los que estampa
# vendeme-service-permissions) y usuario de local (roles.client).
EMP='{"sub":"__e2e_emp__","roles":{"employee":true},"firebase":{"sign_in_provider":"password"}}'
BAZO='{"sub":"__e2e_bazo__","roles":{"bazo":true},"firebase":{"sign_in_provider":"password"}}'
CLI='{"sub":"__e2e_cli__","roles":{"client":true},"firebase":{"sign_in_provider":"password"}}'

STAFF_EXPR='auth.token.roles.bazo == true || auth.token.roles.employee == true'

# =========================== 1) Redes WiFi (Ssid) ===========================
gql 'mutation($ids:[String!]!){ ssid_deleteMany(where:{id:{in:$ids}}) }' '{"ids":["__e2e_ssid1__","__e2e_ssid2__"]}' '' >/dev/null

r=$(gql "mutation(\$id:String!,\$s:String!,\$p:String!) @auth(expr:\"$STAFF_EXPR\"){ ssid_upsert(data:{id:\$id, ssid:\$s, password:\$p, updatedAt_expr:\"request.time\"}) }" \
  '{"id":"__e2e_ssid1__","s":"__E2E_Oficina__","p":"secreta123"}' "$EMP")
[ "$(jq -r '.data.ssid_upsert.id // empty' <<<"$r")" = "__e2e_ssid1__" ] && ok "Employee crea SSID (UpsertSsid)" || bad "UpsertSsid → $r"

r=$(gql "query @auth(expr:\"$STAFF_EXPR\"){ ssids(where:{id:{eq:\"__e2e_ssid1__\"}}){ ssid password } }" '{}' "$BAZO")
[ "$(jq -r '.data.ssids[0].password // empty' <<<"$r")" = "secreta123" ] && ok "Bazo lee SSIDs (claim bazo pasa el mismo expr)" || bad "ListSsids bazo → $r"

r=$(gql "query @auth(expr:\"$STAFF_EXPR\"){ ssids { id } }" '{}' "$CLI")
grep -qiE '@auth rejected|PERMISSION_DENIED' <<<"$r" && ok "Usuario de cliente NO lee SSIDs (contraseñas protegidas)" || bad "FUGA ssids → $r"

r=$(gql "mutation(\$id:String!,\$s:String!,\$p:String!) @auth(expr:\"$STAFF_EXPR\"){ ssid_upsert(data:{id:\$id, ssid:\$s, password:\$p}) }" \
  '{"id":"__e2e_ssid2__","s":"__E2E_Oficina__","p":"x"}' "$EMP")
grep -qiE 'unique|duplicate|constraint' <<<"$r" && ok "SSID duplicado rechazado por índice único" || bad "unicidad ssid → $r"

gql 'mutation($ids:[String!]!){ ssid_deleteMany(where:{id:{in:$ids}}) }' '{"ids":["__e2e_ssid1__","__e2e_ssid2__"]}' '' >/dev/null

# =========================== 2) Colación ===========================
gql 'mutation{ colacionTicket_deleteMany(where:{id:{eq:"__e2e_tk1__"}}) }' '{}' '' >/dev/null

r=$(gql "mutation(\$tp:Int!,\$cn:String!,\$cr:String) @auth(expr:\"$STAFF_EXPR\"){ colacionSetting_upsert(data:{id:\"colacion\", ticketPrice:\$tp, companyName:\$cn, companyRut:\$cr, updatedAt_expr:\"request.time\"}) }" \
  '{"tp":4500,"cn":"Vendeme","cr":"77.111.222-3"}' "$EMP")
[ "$(jq -r '.data.colacionSetting_upsert.id // empty' <<<"$r")" = "colacion" ] && ok "SaveColacionSettings (fila única)" || bad "SaveColacionSettings → $r"

r=$(gql "query @auth(expr:\"$STAFF_EXPR\"){ colacionSetting(key:{id:\"colacion\"}){ ticketPrice companyRut } }" '{}' "$EMP")
[ "$(jq -r '.data.colacionSetting.ticketPrice' <<<"$r")" = "4500" ] && ok "GetColacionSettings lee la config" || bad "GetColacionSettings → $r"

T_INSERT="mutation(\$id:String!,\$d:Timestamp!,\$m:String!,\$eid:String!,\$en:String!,\$tp:Int!) @auth(expr:\"$STAFF_EXPR\"){ colacionTicket_insert(data:{id:\$id, date:\$d, month:\$m, employeeId:\$eid, employeeName:\$en, ticketPrice:\$tp}) }"
r=$(gql "$T_INSERT" '{"id":"__e2e_tk1__","d":"2026-07-07T13:00:00Z","m":"07-2026","eid":"emp1","en":"Juan Pérez","tp":4500}' "$EMP")
[ "$(jq -r '.data.colacionTicket_insert.id // empty' <<<"$r")" = "__e2e_tk1__" ] && ok "AddColacionTicket persiste el ticket" || bad "AddColacionTicket → $r"

r=$(gql "$T_INSERT" '{"id":"__e2e_tk1__","d":"2026-07-07T13:00:00Z","m":"07-2026","eid":"emp1","en":"Juan Pérez","tp":4500}' "$EMP")
grep -qiE 'unique|duplicate|constraint' <<<"$r" && ok "Doble-click rechazado (insert estricto, mismo id)" || bad "doble insert → $r"

r=$(gql "query(\$m:String!) @auth(expr:\"$STAFF_EXPR\"){ colacionTickets(where:{month:{eq:\$m}}){ id employeeName ticketPrice type } }" '{"m":"07-2026"}' "$EMP")
[ "$(jq -r '.data.colacionTickets[0].type' <<<"$r")" = "colacion" ] && ok "ListColacionTicketsByMonth (default type=colacion)" || bad "ListByMonth → $r"

r=$(gql "query(\$m:String!) @auth(expr:\"$STAFF_EXPR\"){ colacionTickets(where:{month:{eq:\$m}}){ id } }" '{"m":"07-2026"}' "$CLI")
grep -qiE '@auth rejected|PERMISSION_DENIED' <<<"$r" && ok "Usuario de cliente NO ve colación" || bad "FUGA colación → $r"

gql 'mutation{ colacionTicket_deleteMany(where:{id:{eq:"__e2e_tk1__"}}) }' '{}' '' >/dev/null

# =========================== 3) Incidencias ===========================
gql 'mutation{ incidence_deleteMany(where:{id:{eq:"__e2e_inc1__"}}) }' '{}' '' >/dev/null

r=$(gql 'mutation($id:String!,$e:String,$d:String,$sev:IncidenceSeverity!,$dt:Timestamp!) @auth(level:USER){ incidence_insert(data:{id:$id, eventId:$e, detail:$d, severity:$sev, date:$dt}) }' \
  '{"id":"__e2e_inc1__","e":"ev123","d":"Se cayó la impresora","sev":"WARNING","dt":"2026-07-07T03:00:00Z"}' "$CLI")
[ "$(jq -r '.data.incidence_insert.id // empty' <<<"$r")" = "__e2e_inc1__" ] && ok "Usuario del local crea incidencia (level USER)" || bad "AddIncidence → $r"

r=$(gql "query @auth(expr:\"$STAFF_EXPR\"){ incidences(where:{eventId:{eq:\"ev123\"}}){ id severity detail } }" '{}' "$EMP")
[ "$(jq -r '.data.incidences[0].severity // empty' <<<"$r")" = "WARNING" ] && ok "Staff lista incidencias por evento" || bad "ListIncidencesByEvent → $r"

r=$(gql "query @auth(expr:\"$STAFF_EXPR\"){ incidences { id } }" '{}' "$CLI")
grep -qiE '@auth rejected|PERMISSION_DENIED' <<<"$r" && ok "Usuario de cliente NO lista incidencias" || bad "FUGA incidencias → $r"

r=$(gql "mutation(\$id:String!) @auth(expr:\"$STAFF_EXPR\"){ incidence_delete(key:{id:\$id}) }" '{"id":"__e2e_inc1__"}' "$EMP")
[ "$(jq -r '.data.incidence_delete.id // empty' <<<"$r")" = "__e2e_inc1__" ] && ok "Staff borra incidencia errónea" || bad "DeleteIncidence → $r"

echo
echo "Resultado: ${pass} passed, ${fail} failed"
[ "$fail" -eq 0 ]
