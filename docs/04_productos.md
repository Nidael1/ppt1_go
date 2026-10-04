Módulos del proyecto, límites y dependencias. Léelo al ubicar algo nuevo.

# Productos y módulos

## Estructura de carpetas
```
ppt_go_v21/
├── cmd/server/       # main.go: arranca el servidor, embebe web/dist/
├── domain/
│   ├── game/         # Movimiento, Ronda, Partida, reglas RPS
│   └── marcador/     # EntradaMarcador, Top3, puerto MarcadorRepository
├── adapter/
│   ├── http/         # Handlers Gin: /health, /api/top3, /api/top3/entrada
│   └── store/        # Implementación JSON de MarcadorRepository
└── web/              # Vue 3 + Vite + TypeScript (frontend)
    └── src/
        ├── composables/useGame.ts   # Lógica del juego en el cliente
        └── components/             # GameBoard, NameEntry, TopThree
```

## Límites
- `domain/` no importa `adapter/` ni `cmd/`.
- `adapter/` importa `domain/` únicamente.
- `cmd/server/` importa `adapter/` y `domain/`.
- El frontend no contiene lógica de marcador; delega al backend por HTTP.

## Dependencias entre módulos
- `adapter/store` implementa `domain/marcador.MarcadorRepository`.
- `adapter/http` usa `domain/game` para validar movimientos y `domain/marcador` para el Top3.
- `cmd/server` inyecta las dependencias y lanza el servidor.
