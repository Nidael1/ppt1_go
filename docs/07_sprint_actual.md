Sprint activo, máximo 5 issues con criterios de aceptación verificables.

# Sprint 1.1

---

### Issue #1 — Scaffolding del proyecto

- [ ] Crear módulo Go `ppt64` con `go.mod`
- [ ] Crear proyecto Vue 3 + Vite + TypeScript en `web/`
- [ ] `cmd/server/main.go` sirve estáticos de `web/dist/` con `go:embed`
- [ ] Ruta `GET /health` responde `{"status":"ok"}`
- [ ] Pre-commit pasa (vet + tests + vue-tsc + vitest --passWithNoTests)

**Criterios de aceptación:**
- `go build ./cmd/server/` compila sin errores.
- `GET http://localhost:8080/health` responde 200 con body `{"status":"ok"}`.
- `cd web && npm run build` produce `web/dist/` sin errores.

**Tests:**
- `adapter/http/health_test.go`: servidor de test responde 200 con `{"status":"ok"}`.

---

### Issue #2 — Dominio del juego RPS

- [ ] Tipo `Movimiento` (piedra, papel, tijeras) en `domain/game/`
- [ ] Tipo `ResultadoRonda` (victoria, empate, derrota)
- [ ] `DeterminarResultado(jugador, maquina Movimiento) ResultadoRonda`
- [ ] `PuntajePorResultado(r ResultadoRonda) int`
- [ ] Tipo `Partida` con contadores de victorias, puntaje y estado terminada
- [ ] `JugarRonda(p *Partida, jugador, maquina Movimiento)` actualiza partida
- [ ] `PartidaTerminada(p Partida) bool`

**Criterios de aceptación:**
- piedra vence tijeras, tijeras vence papel, papel vence piedra; iguales = empate.
- victoria = +3, empate = 0, derrota = -3.
- `PartidaTerminada` devuelve true solo cuando jugador o máquina llega a 3 victorias de ronda.
- Empates de ronda no incrementan ningún contador de victorias.
- La partida no termina antes de 3 victorias de ronda, sin importar el puntaje.

**Tests:**
- `domain/game/game_test.go`: los 9 resultados posibles, puntaje correcto por resultado, fin de partida en 3-0, 3-2, 3-con-empates, empates no terminan la partida.

---

### Issue #3 — Dominio del marcador Top 3

- [ ] Tipo `EntradaMarcador` en `domain/marcador/`
- [ ] Tipo `Top3` (slice de hasta 3 `EntradaMarcador` ordenado de mayor a menor)
- [ ] `AgregarEntrada(t *Top3, e EntradaMarcador) bool`: agrega si hay espacio o puntaje es estrictamente mayor al mínimo; igual no reemplaza; devuelve si se agregó
- [ ] Puerto `MarcadorRepository` (interfaz) en `domain/marcador/`
- [ ] Adaptador `adapter/store/json.go` que implementa `MarcadorRepository` con un archivo JSON local (`marcador.json`)

**Criterios de aceptación:**
- Top3 vacío acepta cualquier entrada.
- Al llegar a 3 entradas, solo entra si supera el mínimo.
- Puntaje igual al mínimo no reemplaza.
- Puntajes negativos entran bajo las mismas reglas.
- El archivo JSON persiste entre llamadas (cargar, modificar, guardar, volver a cargar = mismos datos).

**Tests:**
- `domain/marcador/marcador_test.go`: inserción en vacío, límite 3, igual no reemplaza, negativo entra si supera.
- `adapter/store/json_test.go`: guardar y cargar desde archivo temporal; datos idénticos tras ciclo.

---

### Issue #4 — API HTTP del marcador

- [ ] `GET /api/top3` devuelve las entradas del Top3 en JSON (array vacío si no hay)
- [ ] `POST /api/top3/entrada` recibe `{"nombre":"ABC","puntaje":9}`, agrega si aplica
- [ ] Validación: nombre exactamente 3 chars [A-Z0-9]; puntaje entero
- [ ] Responde 400 si nombre inválido o falta campo

**Criterios de aceptación:**
- `GET /api/top3` responde 200 con array JSON.
- `POST` con nombre inválido responde 400.
- `POST` con datos válidos responde 200 con el Top3 actualizado.
- `POST` con puntaje que no supera el mínimo responde 200 y el Top3 no cambia.

**Tests:**
- `adapter/http/marcador_test.go`: GET vacío, POST válido que entra, POST nombre con minúscula, POST nombre de 2 chars, POST que no supera mínimo.

---

### Issue #5 — Frontend Vue: pantalla de juego básica

- [ ] Composable `useGame.ts` con estado de la partida (victorias, puntaje, terminada, ganador)
- [ ] `elegirMovimiento(mov)` determina el movimiento de la máquina (aleatorio) y actualiza el estado
- [ ] Componente `GameBoard.vue`: botones Piedra / Papel / Tijeras
- [ ] Muestra movimiento de la máquina, resultado de la ronda, puntaje y victorias
- [ ] Al llegar a 3 victorias de ronda muestra resultado final y botón "Jugar de nuevo"
- [ ] `reiniciar()` limpia el estado para una nueva partida

**Criterios de aceptación:**
- Clic en un movimiento produce un resultado visible (movimiento máquina + resultado ronda).
- El puntaje acumulado se actualiza tras cada ronda.
- La pantalla de resultado final aparece exactamente cuando jugador o máquina llega a 3 victorias.
- "Jugar de nuevo" reinicia todos los contadores.

**Tests:**
- `web/src/composables/useGame.test.ts`: resultado de ronda correcto para los 9 casos, fin de partida a 3 victorias, empates no terminan, reinicio limpia el estado.
