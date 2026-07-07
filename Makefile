# Makefile — Firebase SQL Connect (vendeme)
# Centraliza los comandos del backend (schema + conectores) y del package Flutter.
#
# Overrides:
#   make FIREBASE="npx -y firebase-tools@latest" deploy   # usar firebase-tools por npx
#   make deploy CONFIRM=1                                  # saltar la confirmación (CI)

FIREBASE ?= firebase
FLUTTER  ?= flutter
PKG_DIR  := clients/flutter

.DEFAULT_GOAL := help
.PHONY: help emulator emulator-test test compile generate build pkg-get diff migrate deploy

help: ## Muestra esta ayuda
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN{FS=":.*?## "}{printf "  \033[36m%-16s\033[0m %s\n", $$1, $$2}'

## --- Desarrollo local ---

emulator: ## Levanta el emulador de Data Connect (PGlite) en :9399
	$(FIREBASE) emulators:start --only dataconnect

emulator-test: ## Levanta DataConnect (:9399) + Auth (:9099) para probar la app
	$(FIREBASE) emulators:start --only dataconnect,auth

test: ## e2e contra el emulador (se omite si no está corriendo)
	./scripts/test-e2e.sh

compile: ## Valida schema + conectores sin desplegar
	$(FIREBASE) dataconnect:sql:diff --json > /dev/null 2>&1 || true
	$(FIREBASE) deploy --only dataconnect --dry-run

generate: ## Regenera el SDK Dart (clients/flutter/lib/src)
	$(FIREBASE) dataconnect:sdk:generate

build: generate pkg-get ## Regenera el SDK y resuelve dependencias del package

pkg-get: ## flutter pub get del package
	cd $(PKG_DIR) && $(FLUTTER) pub get

## --- Despliegue ---

diff: ## Muestra el diff SQL contra la BD (sin aplicar)
	$(FIREBASE) dataconnect:sql:diff

migrate: ## Aplica el diff SQL a la BD (crea/actualiza tablas)
	$(FIREBASE) dataconnect:sql:migrate

deploy: ## Despliega schema + conectores a prod
ifndef CONFIRM
	@read -p "Desplegar SQL Connect a vendeme-app (prod)? [y/N] " ans && [ "$$ans" = "y" ]
endif
	$(FIREBASE) deploy --only dataconnect
