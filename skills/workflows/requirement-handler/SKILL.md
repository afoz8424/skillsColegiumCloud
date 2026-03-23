---
name: requirement-handler
description: Skill para la atención de requerimientos pequeños, cambios en vistas, ajustes de lógica de negocio o adición de parámetros.
---

# Skill de Atención de Requerimientos (Requirement Handler)

Diseñado para el procesamiento de cambios, ajustes menores o mejoras incrementales en el proyecto.

## Nota de Seguridad Git
- **IMPORTANTE**: Antes de realizar cualquier cambio en el código, asegúrate de haber invocado el skill `git-branch-manager` y de estar trabajando en una rama tipo `temporal_`. NUNCA apliques cambios directamente en `main`.

## Flujo de Trabajo

### 1. Entendimiento del Requerimiento
- Analiza la solicitud del usuario para entender qué se espera (nueva visualización, cambio de texto, ajuste de lógica).
- Identifica los componentes MVC afectados (Model, View, Controller).

### 2. Mapeo de Impacto
- Identifica dependencias en el código actual.
- Verifica si el cambio altera APIs externas, la base de datos o componentes compartidos.

### 3. Plan de Implementación
- Crea un plan paso a paso rápido que incluya:
  *   Creación de campos (si aplica).
  *   Ajuste en el modelo (PHP).
  *   Modificación en el controlador para envío de datos.
  *   Actualización de la vista (Blade/HTML).

### 4. Implementación y Pulido
- Escribe el código siguiendo el estilo existente del archivo.
- Asegúrate de que las cadenas de texto usen las convenciones de internacionalización o literales correctas según el contexto.

### 5. Validación
- Verifica visualmente (si aplica) o mediante lógica de datos que el requerimiento se cumple.
