# ADR-0001 — Sin base de datos: marcador en JSON local

**Estado:** Aceptado

## Contexto
El estándar nyx usa PostgreSQL 16. PPT64 es un juego local de un solo jugador
sin conexión a internet. El único dato persistente es el Top3 (3 entradas de nombre + puntaje).

## Decisión
No se usa PostgreSQL. El marcador se guarda en `marcador.json` en el directorio
de trabajo del binario. El adaptador `adapter/store/json.go` implementa
`domain/marcador.MarcadorRepository`.

## Consecuencias
- Sin dependencia de PostgreSQL ni Docker para el uso habitual.
- El marcador se pierde si se borra `marcador.json` (comportamiento esperado y documentado).
- Si el archivo se corrompe, el servidor lo reinicia vacío y registra el error en log.
