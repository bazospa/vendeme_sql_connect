# vendeme_sql_connect

Backend Firebase SQL Connect (ex Data Connect) de Vendeme: schema PostgreSQL +
conectores GraphQL + SDK Flutter generado.

## Qué vive aquí

Dominios **internos del equipo** que no son camino crítico de venta (el POS,
ventas, tickets y terminales siguen en Go + espejo Firestore→PG):

| Dominio | Tablas | Estado |
|---|---|---|
| Redes WiFi (`/ssids`) | `Ssid` | piloto |
| Colación | `ColacionSetting`, `ColacionTicket` | piloto |
| Incidencias | `Incidence` | schema listo; cutover junto con release de la app cliente |

Regla del ecosistema: **las ideas nacen en Firestore y se gradúan aquí** cuando
funcionan (decisión dueño 2026-07-06).

## Infra

- Instancia Cloud SQL existente `vendeme-app` (us-central1), **database propia**
  `vendeme-sqlconnect` — separada del espejo de la migración (`schemaValidation:
  STRICT` es por database, no toca el espejo).
- Servicio Data Connect `vendeme-sqlconnect`, conector `default`.

## Auth

- Staff (lecturas y administración): claim `roles.bazo` o `roles.employee` —
  los mismos custom claims que estampa `vendeme-service-permissions` (IAM).
- `AddIncidence` es `level: USER`: la crean usuarios del local desde la app
  cliente.

## Estructura

```
dataconnect/
  dataconnect.yaml      # servicio + instancia + database (STRICT)
  schema/*.gql          # tablas (@table)
  default/              # conector: queries/mutations por dominio + connector.yaml
clients/flutter/        # package vendeme_sqlconnect (SDK generado en lib/src)
```

## Comandos

`make help` — resumen. Los importantes:

- `make emulator-test` — DataConnect + Auth locales para probar la app.
- `make generate` — regenera el SDK Dart tras tocar los .gql.
- `make diff` / `make migrate` — diff/aplicación del SQL contra la BD.
- `make deploy` — despliega schema + conectores (pide confirmación).

## Consumir el SDK en una app

```yaml
dependencies:
  vendeme_sqlconnect:
    git:
      url: git@github.com:bazospa/vendeme_sql_connect.git
      path: clients/flutter
```
