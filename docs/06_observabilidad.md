Qué se registra y qué no. Léelo al agregar código que puede fallar en producción.

# Observabilidad

## Se registra (Zap)
- Inicio del servidor: puerto en el que escucha.
- Error al leer el archivo `marcador.json` al arrancar.
- Error al escribir `marcador.json` después de agregar una entrada.
- Petición HTTP con error 4xx o 5xx (método, ruta, código).

## No se registra
- Movimientos del jugador ni resultado de rondas (no hay valor en logs).
- Nombre ingresado por el jugador.
- Puntajes individuales de rondas.

## Nivel de log
- INFO para eventos normales (inicio del servidor).
- ERROR para fallos de I/O.
- No se usa DEBUG en producción.
