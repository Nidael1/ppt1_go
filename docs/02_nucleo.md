Entidades, invariantes y lenguaje del dominio. Léelo al tocar el dominio.

# Núcleo del dominio

## Lenguaje
- **Movimiento**: piedra, papel, tijeras.
- **Ronda**: una jugada completa (movimiento del jugador + movimiento de la máquina + resultado + puntos).
- **ResultadoRonda**: victoria, empate, derrota (desde la perspectiva del jugador).
- **Partida**: secuencia de rondas con contadores de victorias y puntaje acumulado.
- **EntradaMarcador**: nombre de 3 caracteres + puntaje entero (puede ser negativo).
- **Top3**: colección de hasta 3 EntradaMarcador ordenada por puntaje descendente.

## Entidades

### Movimiento
Enum: `piedra`, `papel`, `tijeras`.

### Ronda
- `movimientoJugador Movimiento`
- `movimientoMaquina Movimiento`
- `resultado ResultadoRonda`
- `puntos int`

### Partida
- `victorias int` (victorias de ronda del jugador)
- `victoriasMaquina int`
- `puntaje int` (acumulado de todas las rondas)
- `rondas []Ronda`
- `terminada bool`
- `ganador string` ("jugador" | "maquina")

### EntradaMarcador
- `nombre string` (exactamente 3 chars, A-Z y 0-9, siempre mayúsculas)
- `puntaje int`

## Invariantes
- Una partida termina exactamente cuando `victorias == 3` o `victoriasMaquina == 3`.
- Los empates de ronda no incrementan ningún contador de victorias.
- `puntos` de una ronda es siempre +3, 0 o -3.
- `nombre` tiene exactamente 3 caracteres del conjunto [A-Z0-9].
- Top3 tiene como máximo 3 entradas, ordenadas de mayor a menor puntaje.
- Una entrada entra al Top3 solo si su puntaje es estrictamente mayor al menor puntaje existente, o si hay espacio libre.
- Puntajes iguales no reemplazan entradas existentes.
