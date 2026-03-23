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
- **¡IMPORTANTE! Contexto de Iframe**: La interfaz de búsqueda está dentro de un iframe. Primero, debes cambiar el contexto (switch frame) al iframe principal de la página (su origen suele ser `intranet4backend.colegium.com/intranet4.html`).
- Busca el campo de entrada (`input`) con el ID `filtro_idticket` dentro del iframe.
- Escribe el número de ticket que se menciona en el prompt en dicho campo (Ej. 454501).
- Haz clic en el botón de **"Buscar"** (usualmente un `<button>` con la clase `boton` al lado del input).
- **Espera**: El proceso de búsqueda es asíncrono. Espera un par de segundos a que la tabla se actualice.

### 3. Apertura del Ticket
- Una vez cargados los resultados, busca la celda `<td>` con el ID `ticket_#ID_DEL_TICKET` (donde #ID_DEL_TICKET es el número buscado, ej. `ticket_454501`).
- Haz clic directamente sobre esa celda (o la fila `<tr>` que la contiene) para abrir los detalles del ticket.
- El sistema NO cambiará de página, sino que abrirá una **nueva viñeta/pestaña (tab)** dentro de la misma interfaz de la intranet con el título "Ticket - #ID_DEL_TICKET". Asegúrate de enfocar tu lectura en ese nuevo tab.


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
