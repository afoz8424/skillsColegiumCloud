---
name: ticket-qa-derivator
description: "Skill para el cierre técnico y derivación de tickets al área de QA en la Intranet de Colegium."
---

# Skill de Derivación a QA (Ticket QA Derivator)

Este skill se encarga de las acciones finales administrativas dentro de la Intranet de Colegium para entregar un ticket al equipo de pruebas.

## Requisito Previo
- Haber generado y/o publicado el comentario de cierre usando `ticket-documenter`.
- Haber iniciado sesión en la Intranet (`intranet-auth`).

## Flujo de Trabajo

### 1. Identificación del Responsable (QA)
- Antes de proceder, **PREGUNTA AL USUARIO**: "¿Quién será el nuevo responsable de QA para este ticket?".
- Almacena el nombre del responsable provisto por el usuario.

### 2. Navegación al Ticket
- Si no estás en la vista del ticket indicado por el `ticket-processor`, navega a la URL correspondiente en la Intranet.

### 3. Cambio de Responsable
- Localiza la sección **"Gestión del ticket"**.
- Busca el selector de "Responsable".
- Selecciona el nombre del nuevo responsable de QA indicado por el usuario anteriormente.

### 4. Actualización del Estado
- Localiza la sección **"Información General"**.
- Evalúa el tipo de ticket (Defecto o Requerimiento):
  *   Si es **Defecto (Bug)**: Cambia el estado a **"Corregido"**.
  *   Si es **Requerimiento**: Cambia el estado a **"Implementado"**.

### 5. Confirmación y Cierre
- Guarda los cambios en el ticket.
- Reporta al usuario que el ticket ha sido derivado exitosamente y está listo para revisión por parte de QA.
