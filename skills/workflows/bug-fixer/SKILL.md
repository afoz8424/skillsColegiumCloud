---
name: bug-fixer
description: Skill para la detección, reproducción y resolución de bugs en el proyecto colegiumcloud. Sigue un flujo estructurado de diagnóstico antes de proponer cambios.
---

# Skill de Solución de Bugs (Bug Fixer)

Este skill guía al asistente en la resolución de problemas técnicos reportados en el workspace.

## Nota de Seguridad Git
- **IMPORTANTE**: Antes de realizar cualquier cambio en el código, asegúrate de haber invocado el skill `git-branch-manager` y de estar trabajando en una rama tipo `temporal_`. NUNCA apliques cambios directamente en `main`.

## Flujo de Trabajo

### 1. Reproducción del Error
- Localiza el código afectado basándote en el reporte o logs.
- Si es posible, crea un script minificado en `/tmp/` o un caso de prueba unitaria que falle para confirmar el bug.
- Documenta los pasos exactos para reproducir el comportamiento inesperado.

### 2. Análisis de Causa Raíz
- Utiliza las herramientas de búsqueda (`grep_search`, `codebase_search`) para encontrar todas las referencias al componente fallido.
- Identifica si el error es de lógica, sintaxis o integración (datos inesperados de la DB o API).
- Considera efectos secundarios en otros módulos.

### 3. Implementación del Fix
- Aplica la corrección siguiendo los estándares de codificación del proyecto (PHP/Laravel/Blade).
- Mantén los cambios lo más quirúrgicos posible para evitar regresiones.

### 4. Verificación y Pruebas
- Ejecuta el caso de prueba creado en el paso 1 para confirmar que ahora pasa.
- Realiza un barrido rápido por componentes relacionados para asegurar estabilidad.
- Documenta qué se cambió y por qué.
