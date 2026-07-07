---
name: intranet-clock
description: "Skill para automatizar el registro de la jornada laboral en la Intranet de Colegium (Inicio, Almuerzo, Salida)."
---

# Skill de Marcación de Jornada (Intranet Clock)

Este skill permite realizar el marcado oficial de la asistencia del trabajador desde cualquier lugar de la Intranet.

## Requisito Previo
- Haber iniciado sesión en la Intranet usando el skill `intranet-auth`.

## Tipos de Marcación Soportados
- **Inicio de jornada** (Entrada en la mañana).
- **Salida a almorzar** (Inicio de descanso).
- **Regreso de almuerzo** (Fin de descanso).
- **Salida de jornada** (Fin de turno).

## Flujo de Trabajo

### 1. Localización del Botón Principal
- Busca en la parte **superior derecha** de la pantalla de la Intranet el botón con el texto **"Marcaciones"**.

### 2. Selección del Tipo de Marcado
- Al hacer clic en "Marcaciones", se desplegará un modal pequeño.
- Identifica y selecciona la opción correcta basada en la intención actual (pedida por el usuario o detectada por hora).
- **CRÍTICO**: El sistema no permite registros duplicados para el mismo tipo de marcación en un mismo día. Antes de proceder a enviar, verifica si el tipo de marcación solicitado por el usuario aparece como ya registrado o deshabilitado en el modal.
- Si el sistema indica que ya se ha realizado una marcación de ese tipo para el día de hoy, detén el proceso y notifica al usuario con un mensaje indicándolo.

### 3. Registro de Marca
- Una vez seleccionado el tipo de marcación (Inicio, Salida almuerzo, Regreso almuerzo o Salida) y validado que no es duplicada, localiza el botón **"Enviar marcación"**.
- Haz clic en este botón para oficializar el registro.

### 4. Confirmación
- Asegúrate de ver el mensaje de confirmación del sistema antes de reportar éxito.

## Marcación por API (Nuevo)
- **URL**: `https://intranet4backend.colegium.com/registrarMarcacionAutomatica/{uuid}`
- **Método**: POST
- **Headers**:
    - **`x-access-token`**: `${newToken}` (obtenido del login API).
    - **`x-id-application`**: `36`
    - **`x-current-timestamp`**: Timestamp actual (ej: `new Date().toString()`).
    - `Content-Type`: `application/json;charset=UTF-8`
- **Parámetro `{uuid}`**: El `uuid` de sesión devuelto en el login API.
- **Cuerpo (JSON)**:
    - **`marcacion`**: Fecha y hora actual en formato `YYYY-MM-DD HH:mm:ss`.
    - **`ipLocal`**: Dirección IP **pública** del dispositivo.
    - **`id_usuario`**: ID del usuario devuelto en el login API (anteriormente idpersona, ej: `825`).
- **Lógica Automática**: El sistema identifica automáticamente el tipo de marcación faltante.
- **Respuesta**: "Marcación generada con éxito" en el mensaje o 200 OK.

### Cómo obtener los valores dinámicos (para ejecución desatendida/programada)
- **`ipLocal`**: Consulta un servicio externo antes de cada marcación, ej. `curl -s https://api.ipify.org`. No asumas ni cachees una IP fija, ya que puede cambiar entre ejecuciones.
- **`x-current-timestamp`**: Genera el valor exactamente con `new Date().toString()`. Si hay Node.js disponible, ejecuta `node -e "console.log(new Date().toString())"`. Si no, replica el mismo formato (`Ddd Mmm DD YYYY HH:mm:ss GMT±HHMM (Zona horaria)`) con las herramientas disponibles.

### Manejo de duplicados en el flujo API
- El comportamiento exacto del endpoint ante una marcación ya registrada para el día **aún no está confirmado/documentado**. Al recibir la respuesta:
    - Si el mensaje indica éxito ("Marcación generada con éxito" o 200 OK), reporta éxito normalmente.
    - Si el mensaje o status indican error relacionado con una marca ya existente/duplicada para el tipo correspondiente, **no lo trates como una falla del proceso**: repórtalo como informativo (ya se había marcado) y no reintentes.
    - Ante cualquier otro error, detén el proceso y notifica el mensaje exacto devuelto por el servidor para poder documentarlo aquí en una próxima iteración.

### Script automatizado (recomendado para tareas programadas)
- `scripts/marcar_automatico.sh` (en esta misma carpeta) encapsula todo el flujo API: lee `INTRANET_USER`/`INTRANET_PASS` del `.env` en la raíz del repo, hace login, obtiene la IP pública, genera el timestamp y hace el POST de marcación.
- Uso: `bash skills/core/intranet-clock/scripts/marcar_automatico.sh` desde la raíz del repositorio. No recibe argumentos — el servidor detecta automáticamente el tipo de marcación según la hora.
- Salida: JSON de respuesta del endpoint de marcación seguido de `___HTTP_STATUS___:<codigo>`. Códigos de salida propios: `3` (falta `.env` o credenciales vacías), `4` (login fallido; imprime `ERROR_LOGIN: <respuesta>`).
- Usar este script en vez de reconstruir los comandos curl/node manualmente hace que las tareas programadas (entrada, salida a almorzar, regreso de almuerzo, salida) siempre invoquen exactamente el mismo comando, lo que permite dar permiso de allowlist una sola vez sin pedir aprobación en cada ejecución.

## Nota de Operación
- El flujo **Browser** es ideal si el usuario quiere ver el proceso o requiere validación visual previa.
- El flujo **API** es más rápido y eficiente para automatizaciones, ya que el servidor elige el tipo de marcación correcto.
