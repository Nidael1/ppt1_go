Datos sensibles y controles de seguridad. Léelo al tocar datos de usuario.

# Seguridad

## Datos que maneja el sistema
- Nombre: 3 caracteres [A-Z0-9], sin datos personales identificables.
- Puntaje: entero, sin datos sensibles.
- No hay cuentas, sesiones, tokens ni contraseñas.

## Controles
| Control | Implementación |
|---|---|
| Validar nombre en API | `POST /api/top3/entrada`: rechaza si no es exactamente 3 chars [A-Z0-9] → 400 |
| No red externa | Servidor escucha solo en `localhost:8080`; no hay llamadas salientes |
| Sin datos sensibles en logs | Zap no registra nombres ni puntajes individuales |

## No aplica
- Sin autenticación ni autorización (uso local, un solo usuario).
- Sin HTTPS (localhost).
- Sin CORS (binario sirve frontend y API desde el mismo origen).
