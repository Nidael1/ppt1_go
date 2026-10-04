# ADR-0002 — Sin despliegue en red: localhost únicamente

**Estado:** Aceptado

## Contexto
El estándar nyx despliega en Fly.io con Docker. PPT64 no tiene conexión a internet
y no es multijugador; no hay razón para despliegue externo.

## Decisión
El binario escucha solo en `localhost:8080`. No se crea Dockerfile ni configuración
de Fly.io. No se usa CI de GitHub Actions para despliegue (solo para tests si se agrega).

## Consecuencias
- Instalación = copiar el binario y ejecutarlo. Sin infraestructura.
- Si en el futuro se quiere exponer en red, se necesita añadir TLS, autenticación
  y Dockerfile (trabajo significativo no contemplado en v1).
