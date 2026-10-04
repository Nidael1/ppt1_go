Método: nyx v2.1

Al empezar cualquier sesión, lee docs/MANIFEST.md y carga solo los
documentos que la tarea necesita.

# Proceso de trabajo

## Commits
- Un commit por issue terminado.
  Por qué: cada commit es un punto seguro al que se puede volver.
- Formato: `[sprint N.N][issue #N] descripción` o `[sprint N.N][meta] descripción`
  para trabajo de proceso sin issue. El hook commit-msg rechaza otros formatos.
  Por qué: cada commit se relaciona con su tarea sin buscar en el historial.
- Commits directos a main mientras se trabaje solo. Con colaboradores, una rama
  por issue.
  Por qué: las ramas solo aportan cuando hay trabajo en paralelo.

## Sprints
- Máximo 5 issues por sprint, en docs/07_sprint_actual.md.
  Por qué: la confiabilidad de la IA baja cuando la tarea y el contexto crecen.
- Cada sprint se ejecuta en una sesión nueva.
  Por qué: arranca desde docs/ actualizado y no carga correcciones viejas.

## Tests
- Cada issue incluye tests unitarios del comportamiento esencial que implementa.
  Sin tests, el issue no está terminado.
  Por qué: si un cambio rompe algo esencial, el commit no pasa.
- Si hay lógica SQL en juego (ORDER BY, LIMIT, filtros), se requiere test
  de integración.
  Por qué: un test de dominio no detecta errores en la consulta.
- Prohibido modificar o borrar un test existente para que pase. Si falla,
  se corrige el código. Si el comportamiento cambió a propósito, se actualiza
  el test en el mismo commit y se explica en el mensaje.
  Por qué: un test ajustado para pasar ya no protege nada.
- El hook pre-commit corre vet, tests y revisión de tipos antes de cada commit.
  Por qué: la calidad no depende de que la IA se acuerde.

## Fallos
- Si el pre-commit falla: corrige el código y reintenta. Después de 3 intentos
  fallidos, detente y reporta qué falla y qué intentaste.
  Por qué: evita ciclos y evita "arreglar" los tests en lugar del código.
- Si se detecta un fallo en un issue ya cerrado: crea un issue nuevo en el
  sprint actual que lo referencie ("corrige #N"), con un test que reproduzca
  el fallo antes de corregirlo.
  Por qué: no se reescribe la historia, y el error no puede volver sin aviso.

## Registros (output/)
- El commit que cierra un issue actualiza output/CHANGELOG.md (archivo,
  función, qué hace el cambio) y output/TEST.md (cómo se validó).
  Por qué: permite auditar qué cambió y cómo se probó sin leer el código.
- output/CHANGES.md (lenguaje llano) y output/COMANDOS.md se consolidan al
  cerrar el sprint.
  Por qué: CHANGES es para lectores no técnicos y basta por sprint.
  ⚠️ COMANDOS.md: revisar con el uso si se consulta.

## Revisión de sprint
Antes del cierre, en una sesión nueva:
1. Revisa el diff del sprint contra los criterios de aceptación de cada issue.
2. Por cada discrepancia de código: crea un issue en el sprint actual
   ("corrige #N") y corrígelo con su test y su commit.
3. Si corregir implica cambiar un criterio de aceptación: detente y pregunta.
4. Después, continúa con el cierre.
Por qué: los tests verifican que nada se rompió; la revisión verifica que se
construyó lo que se pidió.

## Cierre de sprint
1. Lista las correcciones del sprint que cambiaron lo planeado.
2. Actualiza docs/ con esas correcciones. La spec describe lo que existe.
3. Mueve el sprint cerrado a docs/08_sprints_pasados.md.
4. Arma el siguiente sprint (máximo 5 issues) desde docs/09_backlog.md,
   ajustando, marcando como obsoleto (sin borrar) o agregando lo que falte.
5. Consolida output/CHANGES.md y output/COMANDOS.md.
6. Registra todo en un commit [sprint N.N][meta].
Por qué: si una corrección queda solo en el código, el siguiente sprint lee
una spec desactualizada y repite el error.

## Decisiones
- Toda desviación del estándar se registra como ADR en docs/.
  Por qué: una decisión sin registro se vuelve a discutir.
