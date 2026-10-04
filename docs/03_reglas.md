Reglas de negocio, casos borde y supuestos declarados. Léelo al implementar comportamiento.

# Reglas de negocio

## Mecánica de ronda
1. La máquina elige su movimiento de forma aleatoria uniforme entre piedra, papel y tijeras.
2. Resultado de ronda:
   - piedra vence a tijeras
   - tijeras vence a papel
   - papel vence a piedra
   - movimientos iguales = empate
3. Puntos por ronda: victoria = +3, empate = 0, derrota = -3.

## Mecánica de partida
4. La partida termina exactamente cuando el jugador o la máquina alcanza 3 victorias de ronda.
5. Los empates de ronda no cuentan hacia las 3 victorias.
6. No hay límite de rondas; la partida se alarga hasta que alguien gane 3.
7. Puede haber empate en el conteo de victorias (ej. ambos en 2 antes de la ronda decisiva).

## Marcador
8. Al terminar la partida se calcula el puntaje total (suma de puntos de todas las rondas).
9. Si el jugador gana la partida y su puntaje entra en el Top3, se le pide sus iniciales.
10. Si la máquina gana la partida y el puntaje entra en el Top3, se registra automáticamente como "XXX".
11. Un puntaje entra en el Top3 si:
    a. Hay menos de 3 entradas, o
    b. El puntaje es estrictamente mayor al puntaje más bajo del Top3.
12. Puntajes iguales al mínimo existente no reemplazan ninguna entrada.
13. El puntaje puede ser negativo; entra al Top3 bajo las mismas reglas.
14. El Top3 siempre está ordenado de mayor a menor puntaje.

## Nombre / iniciales
15. El nombre tiene exactamente 3 caracteres del conjunto [A-Z0-9] en mayúsculas.
16. Entrada fuera de ese conjunto se rechaza.

## Casos borde declarados
| Caso | Comportamiento |
|---|---|
| Partida 3-0 (jugador gana sin derrotas) | puntaje = 9 |
| Partida con muchos empates consecutivos | la partida continúa sin límite |
| Puntaje negativo porque hubo muchas derrotas antes de ganar | elegible para Top3 |
| Top3 con 3 entradas negativas, llega un puntaje menos negativo | reemplaza el mínimo |
| Top3 lleno, nuevo puntaje igual al mínimo | no reemplaza |
| Top3 vacío, primer resultado de la máquina | se guarda "XXX" si es victorias = 3 |
