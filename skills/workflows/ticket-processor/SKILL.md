---
name: ticket-processor
description: "Orquestador de procesamiento de tickets. Analiza el caso de la intranet, clasifica (bug/req/proyecto), solicita réplica en el entorno y delega en el skill correspondiente."
---

# Skill de Procesamiento de Tickets (Ticket Processor)

Este es un skill de orquestación. Su responsabilidad es entender la naturaleza de un ticket desde la intranet y decidir el flujo de trabajo correcto, delegando en los skills especialistas pertinentes.

## Flujo de Orquestación

### 1. Extracción de Información
- Invoca la lógica de `intranet-tickets` (que a su vez usa `intranet-auth` de ser necesario) proporcionando el ID del ticket para obtener todo su contexto: resumen, detalle, colegio afectado, email/ID de usuario, rol, imágenes o comentarios.

### 2. Análisis y Clasificación del Ticket
- Lee en detalle el texto extraído del ticket.
- Clasifica el tipo de caso evaluando su contenido:
  *   **Defecto / Bug**: Si reporta un error del sistema, comportamiento inesperado o página caída.
  *   **Requerimiento pequeño**: Si solicita un cambio de vista, nuevo texto, validación simple de campos, adición de parámetros.
  *   **Nuevo Proyecto**: Si instruye la creación de un nuevo módulo complejo o reestructuraciones profundas a nivel de arquitectura.

### 3. Gestión de la Rama de Trabajo
- Antes de comenzar con cualquier cambio o réplica, invoca el skill `git-branch-manager`.
- Si es por ticket: Pide crear la rama `temporal_#ID_DEL_TICKET`.
- Si es una actividad general: Pide crear la rama con un nombre corto descriptivo.

### 4. Preparación de Entorno (Réplica)
- Salvo que sea un "Nuevo Proyecto" generalizado, un bug o requerimiento generalmente necesita réplica.
- Invoca el skill `app-replicator` para el ambiente deseado (por defecto `local: http://localhost:8080/`), proporcionando el email/ID de usuario, colegio (ID o nombre) y el perfil/rol extraído.

### 5. Delegación a Especialistas
- Una vez la rama esté lista y la réplica testeada (o descartada si no aplica), delega el caso al skill pertinente y envíale toda la información extraída del ticket junto con el estado del entorno:
  *   Si es defecto/bug -> usa el skill `bug-fixer`.
  *   Si es requerimiento -> usa el skill `requirement-handler`.
  *   Si es un nuevo módulo/proyecto -> usa el skill `project-starter`.

## Notas de Operación
- El `ticket-processor` es responsable como "Analista de Triage", asegurando que el especialista recibe un entorno replicado y los datos listos para empezar a codificar.
