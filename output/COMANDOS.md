# COMANDOS
Comandos útiles del proyecto. Revisar con el uso — pueden quedar desactualizados.

## Desarrollo
```sh
# Tests Go
go test ./...

# Tests frontend
cd web && npx vitest run

# Frontend en modo dev
cd web && npm run dev
```

## Build
```sh
cd web && npm run build && cd ..
go build -o server ./cmd/server/
```

## Ejecutar
```sh
./server
# http://localhost:8080
```
