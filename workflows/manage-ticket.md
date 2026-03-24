---
description: Flujo integral para revisar, desarrollar y gestionar la resolución de un ticket de Colegium Cloud de principio a fin.
---

# Gestión Integral de Tickets Colegium Cloud

Este workflow detalla el proceso paso a paso para resolver un ticket utilizando la suite de skills de Antigravity. Sigue este orden estrictamente para garantizar la consistencia, a menos que el usuario indique lo contrario.

## FASE 1: Análisis y Entendimiento
1. **Acceder a la Intranet**: Usa el skill `intranet-auth` para iniciar sesión en la intranet de Colegium usando las credenciales del `.env`.
2. **Buscar el Ticket**: Recibe el ID del ticket por parte del usuario y búscalo utilizando el skill `intranet-tickets`.
3. **Ingresar y Analizar el Detalle**: Siguiendo el skill `intranet-tickets`, entra al detalle y extrae toda la información crítica para comprender completamente el caso (qué falla, qué se pide, imágenes, IDs, etc.). Presenta un resumen claro al usuario.

## FASE 2: Entorno y Réplica
4. **Preparar la Rama de Trabajo**: Usa el skill `git-branch-manager` para asegurar que el repositorio local esté actualizado (`main`) y crea la rama de trabajo `temporal_#IDTICKET` **ANTES** de empezar a modificar código.
5. **Replicar el Caso**:
   - **INTERACCIÓN REQUERIDA**: Pídele al usuario que te confirme los siguientes 3 datos obligatorios para la réplica si no están claros en el ticket:
     - *¿En qué ambiente se desea replicar (ej. Local, Beta, Prod)?*
     - *¿Cuál es el email del usuario y con qué rol se debe replicar?*
     - *¿Cuál es el ID del colegio donde se debe replicar?*
   - Una vez obtenidos, usa el skill `app-replicator` para configurar la sesión.

## FASE 3: Desarrollo
6. **Resolución del Caso**:
   - Basado en si es un Defecto o un Requerimiento, usa opcionalmente los skills analíticos (`bug-fixer` o `requirement-handler`) para planificar tu solución.
   - Procede a generar y probar los cambios/ajustes a nivel de código.
7. **Generar el Commit**: Una vez validados todos los cambios localmente, realiza el `git add` y el `git commit` describiendo claramente los ajustes realizados en la rama temporal.

## FASE 4: Documentación y Cierre
8. **Documentar el Ticket**: Usa el skill `ticket-documenter` para leer los cambios del commit (o diff) y redactar el borrador de resolución según los 2 modelos preestablecidos (Defecto o Requerimiento). Solicita aprobación del usuario sobre el texto generado.
9. **Derivar y Gestionar en la Intranet**:
   - **INTERACCIÓN REQUERIDA**: Pide al usuario el nombre del QA responsable al que se le derivará.
   - Usa el skill `ticket-qa-derivator` para ir a la sección "Gestión del ticket", cambiar el responsable al QA proveído, y actualizar el Estado General a "Corregido" o "Implementado".
