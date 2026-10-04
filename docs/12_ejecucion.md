Cómo correr, probar y compilar. Léelo al clonar el repo.

# Ejecución

## Requisitos
- Go 1.24
- Node 24 LTS

## Pasos para desarrollar
```sh
# Frontend (modo dev, sin binario Go)
cd web && npm install && npm run dev

# Tests Go
go test ./...

# Tests frontend
cd web && npx vitest run

# Build completo
cd web && npm run build && cd ..
go build -o server ./cmd/server/
./server
```

## Estrategia de pruebas
- **Tests unitarios Go** (`domain/`): comportamiento del dominio, sin I/O.
- **Tests de integración Go** (`adapter/`): httptest para handlers, archivo temporal para store JSON.
- **Tests unitarios Vue** (`web/src/`): Vitest + @vue/test-utils para composables y componentes.
- No hay tests end-to-end en v1.

## Pre-commit
El hook `.githooks/pre-commit` corre automáticamente:
1. `go vet ./...`
2. `go test ./...`
3. `vue-tsc -b` (type check)
4. `vitest run --passWithNoTests`

Un commit falla si cualquiera de los pasos anterior falla.
