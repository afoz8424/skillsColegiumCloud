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

## Nota de Operación
- Este skill puede usarse como una tarea aislada o como parte de un proceso automatizado de inicio/fin de día.
