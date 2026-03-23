---
name: intranet-tickets
description: "Skill especializado en la búsqueda, análisis y extracción de información de tickets (bugs, requerimientos, proyectos) de la intranet de Colegium."
---

# Skill de Gestión de Tickets Colegium (Intranet Tickets)

Este skill se encarga de navegar y entender la información técnica contenida en la sección de tickets de la intranet ante reportes específicos por ID.

## Requisito de Inicio
- **IMPORTANTE**: Este skill requiere que la sesión esté iniciada. Antes de cualquier acción, utiliza la lógica de `intranet-auth` si no estás logueado.

## Flujo de Búsqueda y Análisis de Ticket (ID)

### 1. Acceso a Tickets
- Navega directamente a `https://intranet.colegium.com/tickets`.

### 2. Localización por ID
- Busca el campo de entrada (`input`) con el ID `filtro_idticket`.
- Escribe el número de ticket que se menciona en el prompt en dicho campo.
- Haz clic en el botón de **"Buscar"**.

### 3. Apertura del Ticket
- Una vez cargados los resultados, busca la fila (o elemento) con el ID `ticket_#ID_DEL_TICKET` (donde #ID_DEL_TICKET es el número buscado).
- Haz clic sobre esta fila para abrir los detalles del ticket.
- El sistema cargará la información en una nueva pestaña (tab).

### 4. Extracción de Información Crítica
- Una vez abierto, revisa y extrae los siguientes puntos:
  *   **ID del Colegio**: Identifica el establecimiento educativo afectado.
  *   **Usuarios de Réplica**: Extrae el nombre o ID de los usuarios mencionados para reproducir el caso.
  *   **Resumen y Detalle**: Lee la descripción técnica completa del ticket.
  *   **Comentarios**: Extrae las últimas notas de otros desarrolladores o soporte.
  *   **Multimedia**: Localiza y descarga (o analiza visualmente) las imágenes y videos adjuntos para entender visualmente el error o requerimiento.

## Resultados Esperados
- Entrega un resumen estructurado al usuario con todos los datos extraídos para que el asistente pueda proceder a la corrección del bug o atención del requerimiento usando los skills `bug-fixer` o `requirement-handler`.

## Notas sobre multimedia
- Asegúrate de listar todos los archivos adjuntos (imágenes/videos) para revisión visual detallada si es necesario.
