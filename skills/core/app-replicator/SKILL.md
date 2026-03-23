---
name: app-replicator
description: "Skill encargado de autenticarse en la aplicación Colegium (Local o Remota), buscar un usuario por email o documento, impersonarlo (Usar) y configurar la institución y el perfil asignado para replicar los casos."
---

# Skill de Réplica de Casos en Colegium (App Replicator)

Este skill es invocado primordialmente por un orquestador para configurar el entorno web (local, beta o producción) con los datos del usuario afectado reportados en un ticket.

## Ambientes y Credenciales
- **Credenciales Base**:
  *   **Usuario**: Usa la variable `${APP_USER}` del archivo `.agents/.env`.
  *   **Clave**: Usa la variable `${APP_PASS}` del archivo `.agents/.env`.
- **Ambientes Soportados**:
  *   Local: `http://localhost:8080/`
  *   Producción: `https://app.colegium.cloud/`
  *   Beta: `https://beta-aca.colegium.cloud/`
  *   Staging: `https://staging.colegium.cloud/`
  *   Mantencion: `https://mantencion.colegium.cloud/`

## Flujo de Réplica / Impersonación

### 1. Autenticación Inicial
- Ingresa al ambiente indicado (o a localhost por defecto).
- Introduce las **Credenciales Base** listadas en esta guía.

### 2. Acceso a Administración
- Verifica si la sesión ha sido iniciada exitosamente o si ya hay una abierta.
- Haz clic en el menú desplegable ubicado en la parte **superior derecha** (debajo del nombre del usuario).
- Selecciona la opción **"Administración"**. Esta acción dirigirá la navegación al path `/admin/dashboard` basado en el dominio actual.

### 3. Búsqueda de Usuario Crítico
- Utiliza la información suministrada al skill (Email o Documento de Identidad del usuario).
- En el campo de búsqueda (input superior izquierdo con el placeholder *"Buscar..."*), ingresa este valor.
- Presiona `Enter` para ejecutar la búsqueda.

### 4. Impersonación ("Usar")
- Revisa el panel de resultados devueltos en la región **centro-derecha** de la pantalla.
- En la fila del usuario correcto, localiza la columna **"Acciones"**.
- Haz clic en el botón **"Usar"** (en lugar de Editar).
- El sistema automáticamente ingresará simulando al usuario seleccionado.

### 5. Configuración de Contexto (Colegio y Perfil)
- Ya impersonando al usuario, los permisos dependen del colegio y perfil correctos. 
- Vuelve al menú superior derecho y haz clic debajo del nombre de usuario.
- Escoge la opción **"Cambio de institución / Perfil"**.
- Selecciona la institución (ten en cuenta el *nombre o ID del colegio* extraído del ticket original).
- Finalmente, en "Seleccionar un perfil", busca el rol reportado por el ticket (Ej. *Administrador*, *Director*, *Docente*, etc.).
- Confirma la selección.

## Resultado de Ejecución
- Reporta éxito si el entorno se ha configurado al colegio y rol esperado, listo para que los developers o agentes especialistas prueben los pasos funcionales o apliquen correcciones de código bajo el contexto real de uso.
