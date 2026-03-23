---
name: module-special-courses
description: "Skill enfocado en la gestión de Cursos Especiales / Special Classes. Permite la creación, visualización, inscripción e importación de estudiantes en este módulo."
---

# Skill de Cursos Especiales (Special Classes Module)

Este skill se especializa en la navegación y operación dentro del módulo de Cursos Especiales ubicado en el panel lateral izquierdo de la aplicación Colegium.

## Flujo de Navegación y Operación

### 1. Acceso al Módulo
- Localiza en la barra lateral izquierda la opción **"Cursos especiales"** o **"Classes special"**.
- Al hacer clic, el sistema debe cargar la vista principal de gestión de estos cursos.

### 2. Visualización y Creación
- **Visualización**: Permite listar los cursos especiales existentes para el colegio y ciclo seleccionado.
- **Creación**: Localiza el botón de adición para generar un nuevo curso especial configurando sus parámetros básicos.

### 3. Gestión de Estudiantes (Inscripción)
- Dentro de un curso especial específico, navega a la sección de añadir/inscribir alumnos.
- Permite la búsqueda y selección de estudiantes para su vinculación al curso.
- *Referencia de URL común*: `/administrador/estudiantesAgregarEspecial/<ID_CURSO>`.

### 4. Importación de Estudiantes
- El módulo permite la funcionalidad de arrastre de datos de periodos anteriores.
- Localiza la opción de **"Importar estudiantes"** desde cursos anteriores al curso especial actual para agilizar la carga masiva.

## Casos de Uso Comunes
- **Bug Fixer**: Si se reporta que no se visualizan estudiantes o falla la importación, este skill guía al agente hacia la vista exacta para reproducir el error.
- **Requirement Handler**: Si se solicita un nuevo campo en la creación de cursos o un filtro adicional en la inscripción.

## Notas Técnicas
- Este módulo interactúa fuertemente con las tablas de inscripciones y cursos especiales en la base de datos.
- Asegúrate de que el colegio y ciclo lectivo sean los correctos antes de operar en este módulo (usa el skill `app-replicator` para el seteo previo).
