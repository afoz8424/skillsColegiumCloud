---
name: intranet-auth
description: "Skill para gestionar el acceso a la intranet de Colegium. Loguea automáticamente al usuario aordonez en https://intranet.colegium.com/."
---

# Skill de Antenticación Colegium (Intranet Auth)

Este skill provee los mecanismos de entrada a la intranet institucional para procesos posteriores.

## Credenciales y Acceso
- **URL Base**: `https://intranet.colegium.com/`
- **Usuario**: Usa la variable `${INTRANET_USER}` del archivo `.agents/.env`.
- **Password**: Usa la variable `${INTRANET_PASS}` del archivo `.agents/.env`.

## Flujo de Login
### 1. Navegación Inicial
- Abre la URL base y verifica si el sistema ya tiene una sesión activa mediante la detección de elementos del dashboard.

### 2. Formulario de Entrada
- Si no hay sesión, localiza los campos de usuario y contraseña e ingresa las credenciales proporcionadas.
- Haz clic en el botón de ingreso o presiona Enter.

### 3. Confirmación de Sesión
- Asegúrate de que el despliegue del menú principal o del nombre de usuario sea visible antes de reportar éxito.
- Maneja posibles redirecciones o mensajes de error de autenticación.

## Notas para Subagentes
- Este skill debe ser el primer paso siempre que se requiera acceso a cualquier otra sección de la intranet (Tickets, RRHH, Proyectos).
