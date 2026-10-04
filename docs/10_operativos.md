Cómo construir y ejecutar el proyecto. Léelo al desplegar.

# Operativos

## Construir
```sh
# 1. Compilar frontend
cd web && npm install && npm run build && cd ..

# 2. Compilar binario Go (embebe web/dist/)
go build -o server ./cmd/server/
```

## Ejecutar
```sh
./server
# Escucha en http://localhost:8080
```

El archivo `marcador.json` se crea en el directorio de trabajo al recibir
la primera entrada válida.

## No aplica
- Sin base de datos (ADR-0001): no hay migraciones.
- Sin Docker (ADR-0002): no hay contenedores para uso local.
- Sin despliegue en Fly.io (ADR-0002): el binario corre solo en localhost.
