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

### 3. Registro de Marca
- Una vez seleccionado el tipo de marcación (Inicio, Salida almuerzo, Regreso almuerzo o Salida), localiza el botón **"Enviar marcación"**.
- Haz clic en este botón para oficializar el registro.

### 4. Confirmación
- Asegúrate de ver el mensaje de confirmación del sistema antes de reportar éxito.

## Nota de Operación
- Este skill puede usarse como una tarea aislada o como parte de un proceso automatizado de inicio/fin de día.
