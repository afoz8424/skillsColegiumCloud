---
name: evaluation-scales
description: Skill para la gestión y creación de escalas de evaluación (cuantitativas y cualitativas) en Colegium Cloud.
---

# Skill: Gestión de Escalas de Evaluación

Este skill permite automatizar la creación de escalas de evaluación interactuando con la interfaz de administración de Colegium Cloud.

## Capacidades

### 1. Crear Escala Cuantitativa (Navegador)
Permite crear una nueva escala numérica configurando rangos, reglas de redondeo y casos especiales (ausentes/pendientes) a través de la interfaz de usuario.

### 2. Crear Escala Cuantitativa (API)
Permite crear la escala enviando un requerimiento POST directo al servidor. Útil para automatización masiva o cuando no se requiere interacción visual.

#### Endpoint:
`POST http://localhost:8080/administrador/configuracionNuevaEscala`

#### Payload (multipart/form-data):
- `nombre`: string
- `min`: int
- `max`: int
- `aprueba`: int
- `redondeo`: int
- `decimales`: string
- `agrupacion_redondeo`: int
- `tipo_redondeo`: int
- `valorAusente[sigla]`: string
- `valorAusente[valor]`: int
- `valorAusente[suma]`: -1 (opcional)
- `casosEspeciales[pendiente]`: 1 (opcional)
- `submit_nueva_escala`: . (requerido para activar la lógica persistente)

#### Instrucciones de Ejecución:
1. Obtener la cookie de sesión actual (`ci_session`).
2. Construir y ejecutar un comando `curl` con los parámetros anteriores.

#### Parámetros Requeridos:
- `nombre`: Nombre descriptivo.
- `min`: Nota mínima.
- `max`: Nota máxima.
- `aprueba`: Nota para aprobar.
- `redondeo`: 1 (Redondeo) o 0 (Truncado).
- `decimales`: 0, 0.1, 0.01, 0.001.
- `agrupacion_redondeo`: 1 (Decimales), 0 (Completa), 2 (Personalizada), 3 (Conversiones), 4 (Bonificaciones).
- `tipo_redondeo`: 1-8 (según la agrupación).
- `configuracionRedondeo`: (Solo para agrupaciones 2, 3, 4) Objeto con la configuración detallada de la tabla.
- `valorAusente`: Objeto con `sigla`, `valor` y `suma` (-1 para no promediar).
- `casosEspeciales`: Objeto con `pendiente` (1 para habilitar).

#### Instrucciones de Ejecución:
1. Navegar a `http://localhost:8080/administrador/configuracionNuevaEscala`.
2. Completar los campos del formulario utilizando los valores proporcionados.
3. Para los valores de "Ausente", abrir el modal/toggle correspondiente.
4. Hacer clic en el botón de guardar.

## Referencia de Agrupación y Redondeo:

**Si Agrupación = Decimales (1):**
- 1: Hacia arriba ↑
- 2: Hacia abajo ↓

- 8: Por enteros ↓

**Si Agrupación = Personalizada (2), Conversiones (3) o Bonificaciones (4):**
1. Al seleccionar la opción, aparecerá un botón "+ (Agregar)".
2. Al hacer clic, se abrirá una nueva pantalla para configurar la tabla de redondeo.
3. Se debe proporcionar un nombre para esta configuración (`nombreRedondeo`).
4. Los datos de la tabla varían según el tipo:
   - **Personalizada**: `desde`, `hasta`, `igual`.
   - **Conversiones**: `escalaReferenciaId`, `usarRangos`.
   - **Bonificaciones**: `valorBonificacion` por cada nota.
5. Al "Guardar" en esa pantalla, se vuelve al formulario principal con la configuración cargada en `configuracionRedondeo`.
