---
description: Proceso para la creación de escalas de evaluación cuantitativas y cualitativas en Colegium Cloud.
---

# Workflow: Creación de Escala de Evaluación

Este workflow guía al usuario a través del proceso de definición y creación de una nueva escala de evaluación.

## FASE 1: Definición de la Escala

1. **Selección de Tipo**: Pregunta al usuario si desea crear una escala **Cuantitativa** o **Cualitativa**.
2. **Selección de Camino**: Pregunta al usuario si desea realizar la creación mediante el **Navegador** o por **API**.

2. **Recopilación de Datos (Cuantitativa)**:
   Realiza las siguientes preguntas de forma agrupada:
   
   **Grupo A: Información General**
   - ¿Nombre de la escala?
   - ¿Rango de notas (Mínima y Máxima)?
   - ¿Nota mínima para aprobar?

   **Grupo B: Configuración de Redondeo**
   - ¿Regla de redondeo: Redondeo estándar o Truncado?
   - ¿Cantidad de decimales: 0, 1, 2 o 3?
   - ¿Agrupación de notas: Decimales, Calificación Completa, Personalizado, Conversiones o Bonificaciones?
   
   **Grupo C: Detalle de Redondeo (Condicional)**
   - Si eligió **Decimales**: ¿Hacia arriba ↑ o Hacia abajo ↓?
   - Si eligió **Calificación Completa**: ¿Por cuartos ↑/↓, Por medios ↑/↓ o Por enteros ↑/↓?
   - Si eligió **Personalizado / Conversiones / Bonificaciones**:
     - Indica el nombre de la configuración.
     - (Personalizado): Define los rangos (desde, hasta, es igual a).
     - (Conversiones): Indica el ID de la escala de referencia y si desea habilitar rangos.
     - (Bonificaciones): Indica el valor extra/bono por cada nota de la escala.

   **Grupo D: Casos Especiales**
   - ¿Datos para el Ausente (Sigla y Valor)?
   - ¿El ausente debe promediar en el cálculo?
   - ¿Habilitar opción de "Pendiente"?

## FASE 2: Ejecución

3. **Confirmación**: Muestra un resumen de todos los datos recopilados y solicita confirmación antes de proceder.
4. **Creación**:
   - **Camino Navegador**: Utiliza el skill `evaluation-scales` para navegar a `http://localhost:8080/administrador/configuracionNuevaEscala`, rellenar el formulario y guardar.
   - **Camino API**: Utiliza el skill `evaluation-scales` para construir y ejecutar un comando `curl` (vía `run_command`) enviando los parámetros directamente al endpoint.
5. **Verificación**: Confirma al usuario que la escala ha sido creada y muestra la lista actualizada. En el camino API, también debe validarse el listado en el navegador posteriormente.
