---
name: git-branch-manager
description: "Skill para la gestión de ramas en Git. Asegura que el trabajo inicie desde una rama main actualizada y con la nomenclatura correcta (temporal_xyz)."
---

# Skill de Gestión de Ramas Git (Git Branch Manager)

Este skill estandariza el inicio de cada tarea técnica, asegurando que el código base esté al día y organizado por ramas temporales.

## Flujo de Trabajo

### 1. Preparación de la Base (Main)
- Cambia a la rama principal: `git checkout main`.
- Sincroniza con el repositorio remoto: `git pull origin main`.
- Asegúrate de que no haya cambios locales sin confirmar que puedan causar conflictos.

### 2. Definición del Nombre de la Rama
- Si la tarea es para un **Ticket de Intranet**: El nombre debe ser `temporal_#ticketId` (Ej. `temporal_12345`).
- Si la tarea **NO es por ticket**: Provee un nombre corto y descriptivo de la actividad. El nombre será `temporal_nombre_corto` (Ej. `temporal_refactor_login`).

### 3. Creación y Cambio de Rama
- Crea la nueva rama partiendo desde `main` actualizado:
  `git checkout -b <nombre_rama>`
- Confirma que el cambio de rama fue exitoso antes de proceder con el código.

## Integración con otros Skills
- **Ticket Processor**: Este skill debe invocarse inmediatamente después de que el ticket ha sido clasificado y antes de empezar la réplica o el arreglo del bug/requerimiento.
- **Bug Fixer / Requirement Handler / Project Starter**: Ninguna de estas habilidades debe trabajar directamente sobre `main`. Siempre deben verificar que se encuentran en una rama de tipo `temporal_`.
