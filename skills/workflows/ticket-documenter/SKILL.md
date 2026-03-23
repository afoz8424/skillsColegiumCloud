---
name: ticket-documenter
description: "Skill para generar automáticamente la documentación de cierre de un ticket (bug o requerimiento) basada en los cambios realizados en la rama de Git."
---

# Skill de Documentación de Tickets (Ticket Documenter)

Este skill se encarga de resumir el trabajo realizado en una rama técnica de Git para reportar el cierre oficial del ticket, siguiendo los formatos institucionales de Colegium.

## Flujo de Trabajo

### 1. Análisis de Rama y Cambios
- Identifica la rama actual: `git branch --show-current`.
- Realiza una comparativa con `main` para entender los cambios técnicos: `git diff main...HEAD`.
- Identifica archivos modificados en Backend (PHP), Frontend (JS/Vue/Blade) y Database (SQL/Migraciones).

### 2. Clasificación del Formato
- Basándose en el ticket original (o el análisis previo del `ticket-processor`), decide qué modelo aplicar: **Defecto** o **Requerimiento**.

### 3. Generación del Informe (Draft)

#### MODELO A: Defecto (Bug)
Genera el informe con los siguientes campos obligatorios:
- **📌 Branch**: Nombre de la rama (`temporal_#ticket`).
- **📌 Integrado a**: Ambiente de pruebas (Beta, Local, Staging según corresponda).
- **📌 Descripción**: Explica qué fallaba originalmente y qué se implementó en términos generales.
- **📌 Solución**: Detalla cómo se arregló el código y cómo funciona ahora.
- **📌 Revisar con detalle**: Puntos críticos que QA debe mirar específicamente para evitar regresiones.
- **💡 Recomendaciones**: (Añadir solo si aplica) Cambios en APIs, cambios en DB, o links de ambientes específicos por cliente.

#### MODELO B: Requerimiento
Genera el informe con los siguientes campos:
- **📌 Branch**: Nombre de la rama.
- **📌 Integrado a**: Ambiente para pruebas.
- **📌 Flujo de usuario**: Descripción funcional de qué hace el usuario ahora y cuál es el resultado esperado.
- **📌 Cambios técnicos**: Desglose de modificaciones en Backend, Frontend y BD.
- **📌 Evidencias funcionales**: Lista notas de las pruebas realizadas o mención a capturas/videos si se generaron.
- **📌 Roles y países**: Especifica qué roles (Docente, Admin, etc.) y qué países (CL, CO, etc.) se ven afectados.
- **📌 Responsables técnicos**: Devs asignados.
- **📌 Colegio base**: Colegio donde se validó el requerimiento (Ej. Colegio DEMO #419).

## Resultado Final
Presenta el borrador de la documentación al usuario en formato Markdown para que este pueda copiarlo y pegarlo en la sección de comentarios del ticket en la Intranet.
