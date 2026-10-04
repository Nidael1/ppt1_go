Issues pendientes para sprints futuros, ordenados con sus dependencias.

# Backlog

## Orden y dependencias
Issue #6 depende de #5. Issues #7 y #8 dependen de #4 y #5. Issue #9 depende de #4.
Issues #10 y #11 dependen de todos los anteriores.

---

### Issue #6 — Estilo pixel art retro GBA
Aplicar estética visual retro: paleta de colores limitada, fuente pixelada, canvas HTML
o CSS pixel-art para sprites de manos. Definir resolución base (240×160 referencia GBA).

**Criterios de aceptación:**
- La interfaz usa una fuente monoespaciada o pixelada coherente.
- Los elementos del juego tienen aspecto retro reconocible.
- Funciona en pantallas modernas con escalado entero (sin blur).

**Tests:**
- Test visual manual. Al menos un test Vitest que verifica que el componente renderiza sin errores.

---

### Issue #7 — Pantalla de entrada de nombre (estilo arcade)

Pantalla que aparece cuando el jugador gana y su puntaje entra en el Top3.
Permite ingresar 3 caracteres [A-Z0-9] al estilo marquesina de arcade (selector de letras
con flechas o teclado). Al confirmar, llama a `POST /api/top3/entrada`.

**Criterios de aceptación:**
- Solo acepta [A-Z0-9]; otros caracteres se ignoran o muestran error.
- Exactamente 3 caracteres antes de confirmar.
- Confirmación llama al API y muestra el Top3 actualizado.
- Si el puntaje no entra en Top3, la pantalla no aparece.

**Tests:**
- `web/src/composables/useNameEntry.test.ts`: validación de chars, longitud exacta, flujo completo.

---

### Issue #8 — Guardado automático "XXX" cuando gana la máquina

Cuando la máquina gana y el puntaje entra en el Top3, el frontend llama automáticamente
a `POST /api/top3/entrada` con nombre "XXX" sin intervención del usuario.

**Criterios de aceptación:**
- Si la máquina gana y el puntaje > mínimo del Top3, se llama al API automáticamente.
- No aparece ningún input al usuario.
- El Top3 se actualiza en pantalla con "XXX".

**Tests:**
- `web/src/composables/useGame.test.ts`: cuando máquina gana y puntaje es récord, se llama al API con "XXX".

---

### Issue #9 — Pantalla Top 3 retro

Componente `TopThree.vue` que consume `GET /api/top3` y muestra las 3 entradas
con estética de marcador de arcade retro.

**Criterios de aceptación:**
- Muestra hasta 3 entradas (o "---" en ranuras vacías).
- Se actualiza después de cada partida que termina.
- Estilo coherente con el resto del juego.

**Tests:**
- `web/src/components/TopThree.test.ts`: renderiza vacío, renderiza 3 entradas.

---

### Issue #10 — Pantalla de inicio / título

Pantalla inicial con el título "PPT64" y botón "Jugar". Estética retro GBA.

**Criterios de aceptación:**
- Al abrir la app se muestra la pantalla de inicio.
- Botón "Jugar" lleva a la pantalla de juego.

**Tests:**
- Test Vitest: el componente renderiza el título y el botón.

---

### Issue #11 — Flujo completo de juego

Integrar todas las pantallas: inicio → partida → resultado → entrada de nombre o auto-XXX → Top3 → reiniciar.

**Criterios de aceptación:**
- El flujo completo funciona sin pasos manuales del desarrollador.
- El Top3 refleja el resultado de la partida recién jugada.
- "Jugar de nuevo" desde el Top3 vuelve a la pantalla de juego (no a inicio).

**Tests:**
- Test de integración Vue (Vitest + @vue/test-utils): flujo completo simulado.
