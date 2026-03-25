---
description: Proceso para realizar la marcación de jornada laboral (entrada, almuerzo, salida) en la Intranet de Colegium.
---

# Registro de Jornada Laboral (Intranet Clock)

Este workflow detalla el proceso para registrar la asistencia diaria en la intranet institucional de Colegium.

## FASE 1: Autenticación
1. **Acceso Inicial**: Usa el skill `intranet-auth` para loguearte automáticamente en `https://intranet.colegium.com/`. Utiliza las variables `${INTRANET_USER}` y `${INTRANET_PASS}` configuradas en `.agents/.env`.

## FASE 2: Selección y Validación
2. **INTERACCIÓN REQUERIDA - Tipo de Marcación**: 
   - Pregunta al usuario qué tipo de marcación desea realizar:
     - Inicio de jornada
     - Salida al almuerzo
     - Vuelta de almuerzo
     - Término de jornada
   
3. **Apertura de Marcaciones**: Siguiendo el skill `intranet-clock`, localiza el botón **"Marcaciones"** en la esquina superior derecha y haz clic para desplegar el modal.

4. **Verificación de Marcación Duplicada**: 
   - **IMPORTANTE**: Antes de proceder, verifica si el tipo de marcación seleccionado ya ha sido registrado hoy.
   - Si el sistema muestra que ya existe un registro o si la opción correspondiente no está disponible para selección, detén el flujo e informa al usuario: *"Ya existe una marcación de tipo [Tipo] registrada para el día de hoy."*

## FASE 3: Registro y Finalización
5. **Ejecutar Marcación**:
   - Si la validación es exitosa, selecciona la opción deseada en el modal.
   - Haz clic en el botón **"Enviar marcación"**.
   
6. **Confirmación**: 
   - Espera el mensaje de confirmación del sistema.
   - Una vez confirmado, informa al usuario el éxito de la operación.
