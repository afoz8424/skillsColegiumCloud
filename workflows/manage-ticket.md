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
   - **INTERACCIÓN REQUERIDA**: Para evitar confusiones, realiza las siguientes preguntas obligatorias al usuario para configurar la réplica:
     - *¿En qué ambiente se desea replicar (ej. Local, Beta, Prod)?*
     - *¿Cuál es el ID del colegio donde se debe replicar?*
     - *¿Cuál es el correo o identificación del usuario con el cual se requiere hacer la réplica?*
   - Una vez obtenidos, usa el skill `app-replicator` para configurar la sesión.

## FASE 3: Desarrollo
6. **Resolución del Caso**:
   - Basado en si es un Defecto o un Requerimiento, usa opcionalmente los skills analíticos (`bug-fixer` o `requirement-handler`) para planificar tu solución.
   - Procede a generar y probar los cambios/ajustes a nivel de código.
7. **Generar el Commit**: Una vez validados todos los cambios localmente, realiza el `git add` y el `git commit` describiendo claramente los ajustes realizados en la rama temporal.

## FASE 4: Documentación y Cierre
8. **Documentar el Ticket**: 
   - Usa el skill `ticket-documenter` para leer los cambios del commit (o diff) y redactar el borrador de resolución según los 2 modelos preestablecidos (Defecto o Requerimiento).
   - **INTERACCIÓN REQUERIDA**: Antes de proceder a guardar la información en el ticket, muestra los comentarios redactados y pregunta: *¿Estás de acuerdo con los comentarios registrados?*. Solo continúa si el usuario confirma.
9. **Derivar y Gestionar en la Intranet**:
   - **INTERACCIÓN REQUERIDA**: Realiza las siguientes preguntas obligatorias:
     - *¿A qué QA se le derivará el ticket?*
     - *¿En qué ambiente se integró el cambio realizado?*
   - Usa el skill `ticket-qa-derivator` para:
     - Asegurar que en la estructura de respuesta del ticket aparezca **Integrado a:** seguido del ambiente indicado.
     - Ir a la sección "Gestión del ticket", cambiar el responsable al QA proveído, y actualizar el Estado General a "Corregido" o "Implementado".
