Estructura hexagonal, naming y convenciones del proyecto. Léelo al empezar a trabajar.

# Reglas compartidas

## Arquitectura hexagonal
- El dominio define las reglas de negocio y los puertos (interfaces).
- Los adaptadores implementan los puertos; nunca al revés.
- El dominio no tiene conocimiento de HTTP, archivos ni frameworks.

## Naming
- Identificadores en Go y archivos sin acentos ni ñ: `piedra`, `marcador`, `partida`.
- Términos de dominio en español en la documentación.
- Constantes en un solo lugar (`domain/game/movimiento.go`, `domain/marcador/puntos.go`).
- Tests usan valores literales, no referencias a constantes.

## Convenciones Go
- Módulo: `ppt64` (ver go.mod cuando exista).
- Un archivo por tipo principal en `domain/`.
- Los puertos se definen en `domain/` como interfaces de Go.
- Tests en el mismo paquete con sufijo `_test.go`.

## Convenciones Vue
- Composition API + `<script setup>` en todos los componentes.
- Lógica reutilizable en `composables/`.
- TypeScript estricto.
- Vitest para tests unitarios del frontend.

## Stack
- Go 1.24, Gin, Zap, Viper.
- Vue 3 + Vite + TypeScript + Vitest.
- Node 24 LTS.
- Sin PostgreSQL (ADR-0001).
