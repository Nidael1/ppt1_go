# ADR-0003 — Canvas HTML para interfaz pixel art retro

**Estado:** Aceptado

## Contexto
El juego tiene estética retro inspirada en la Game Boy Advance (resolución base 240×160,
paleta limitada). El estándar nyx usa Vue 3 + Vite para el frontend.

## Decisión
La interfaz visual del juego se implementa con Canvas HTML5 dentro de componentes Vue,
usando escalado CSS con `image-rendering: pixelated` para mantener el aspecto retro
sin blur al escalar. Los sprites y fuentes son pixel art (PNG o CSS).

## Consecuencias
- Canvas da control total sobre cada píxel y facilita el estilo retro auténtico.
- Más trabajo de diseño que con CSS estándar.
- Compatible con Vue 3: el canvas vive en un componente con `<canvas ref="canvas">`.
