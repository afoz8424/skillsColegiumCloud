---
description: Proceso para realizar la marcación de jornada laboral (entrada, almuerzo, salida) en la Intranet de Colegium.
---

# Registro de Jornada Laboral (Intranet Clock)

Este workflow detalla el proceso para registrar la asistencia diaria en la intranet institucional de Colegium.

## FASE 1: Selección de Método
1. **INTERACCIÓN REQUERIDA**: Pregunta al usuario qué método de marcación desea utilizar:
   - **Opción A (Web/Navegador)**: Tradicional, permite validación visual.
   - **Opción B (API)**: Rápida y automática, el sistema elige el tipo de marcación.

---

## OPCIÓN A: Marcación por Web (Browser)

### FASE A2: Autenticación
1. **Login**: Usa el skill `intranet-auth` (flujo Browser) para loguearte automáticamente.

### FASE A3: Selección y Validación
2. **INTERACCIÓN REQUERIDA - Tipo de Marcación**: 
   - Pregunta al usuario qué tipo de marcación desea realizar (Inicio, Almuerzo, Vuelta, Fin).
   
3. **Validación**: Sigue el skill `intranet-clock` para verificar duplicados en el modal.

### FASE A4: Registro
4. **Ejecutar**: Haz clic en "Enviar marcación" y confirma el éxito.

---

## OPCIÓN B: Marcación por API (Automática)

### FASE B2: Ejecución
1. **Autenticación y Registro**: 
   - Realiza el login vía API según el skill `intranet-auth`.
   - Obtiene el `uuid` y `newToken`.
   - Llama al endpoint de marcación automática según el skill `intranet-clock` usando los datos obtenidos.

2. **Confirmación**: 
   - El sistema retornará éxito indicando que la marcación correspondiente ha sido efectuada.
   - **IMPORTANTE**: No es necesario preguntar el tipo de marcación en este flujo, ya que el sistema lo determina automáticamente.

3. **Finalización**: Informa al usuario el éxito de la operación.
