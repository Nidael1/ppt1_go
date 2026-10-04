Problema, usuarios, exclusiones y alcance de la v1. Léelo antes de cualquier decisión.

# Contexto

## Problema y usuarios
Juego clásico de Piedra Papel Tijeras para un solo jugador contra la máquina,
con estética pixel art retro inspirada en la Game Boy Advance.
Usuario: cualquier persona que quiera jugar en su computadora.

## Exclusiones
- Sin sonido.
- Sin conexión a internet (corre completamente offline en localhost).
- Sin multijugador.
- Sin cuentas de usuario ni autenticación.
- Sin base de datos (ver ADR-0001).
- Sin despliegue en servidores externos (ver ADR-0002).

## Alcance funcional — v1
1. Jugar una partida de Piedra Papel Tijeras contra la máquina.
2. Puntaje por ronda: victoria +3, empate 0, derrota -3.
3. La partida termina cuando el jugador o la máquina llega a 3 victorias de ronda.
4. Al terminar: si el jugador gana, puede ingresar sus iniciales (3 chars).
5. Marcador Top 3 local persistido en disco.
6. Si la máquina gana y es nuevo récord, se registra automáticamente como "XXX".
