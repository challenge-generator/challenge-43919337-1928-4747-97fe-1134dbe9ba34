# Implementación de Infraestructura como Código con Principios de Código Limpio

El equipo de desarrollo de una empresa fintech necesita implementar un sistema de infraestructura como código que cumpla con los principios de código limpio y los principios de diseño de software. El sistema debe ser escalable, mantenible y fácil de entender para el equipo de trabajo. Los componentes clave del sistema incluyen la configuración de la red, el despliegue de servicios y la gestión de recursos.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Practicas de codigo limpio |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 10 horas |

## Stack

- **Lenguaje:** HCL
- **Framework:** Terraform
- **Version:** 1.5

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Tener el proyecto base del reto funcionando en tu máquina: clonar el repositorio, instalar las herramientas y verificar que compila y arranca antes de empezar a practicar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Instala las herramientas para ejecutar el proyecto: Terraform 1.5+.
- Clona el repositorio del reto (el enlace viene en la entrega del reto y en la sección "Repositorio del Proyecto" del PDF) y ábrelo en tu IDE.
- Instala las dependencias y compila ejecutando `terraform init -backend=false && terraform -chdir=modules/network init -backend=false && terraform -chdir=modules/resources init -backend=false && terraform -chdir=modules/services init -backend=false && terraform -chdir=modules/system_review init -backend=false && terraform validate && terraform -chdir=modules/network validate && terraform -chdir=modules/resources validate && terraform -chdir=modules/services validate && terraform -chdir=modules/system_review validate` en la raíz del repositorio.
- Confirma que el comando termina sin errores: el proyecto arranca y sus pruebas corren.
- Ubica los archivos de práctica: son los que contienen `TODO(reto)` (búscalos en el repositorio). Lee el README.md y el AGENTS.md antes de empezar.

**Entregable:** El proyecto compila/arranca sin errores con `terraform init -backend=false && terraform -chdir=modules/network init -backend=false && terraform -chdir=modules/resources init -backend=false && terraform -chdir=modules/services init -backend=false && terraform -chdir=modules/system_review init -backend=false && terraform validate && terraform -chdir=modules/network validate && terraform -chdir=modules/resources validate && terraform -chdir=modules/services validate && terraform -chdir=modules/system_review validate`.

<details>
<summary>Pistas de conocimiento</summary>

- Los archivos con `TODO(reto)` son el ejercicio: el resto del repositorio ya está resuelto y no hace falta tocarlo.
- Si el comando de verificación falla, revisa la versión de las herramientas instaladas antes de modificar código.
- AGENTS.md describe el reto, el comando de verificación y las reglas del repositorio.

</details>

### Fase 1: Configuración Inicial

**Objetivo:** Establecer la estructura básica del sistema de infraestructura como código.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Crea un repositorio para el proyecto y configura el entorno de desarrollo.
- Define la estructura de directorios y archivos para el sistema.
- Implementa la configuración inicial de la red utilizando los principios de código limpio.

**Entregable:** Repositorio con la estructura básica y la configuración inicial de la red.

<details>
<summary>Pistas de conocimiento</summary>

- Principios de código limpio: KISS, SOLID, YAGNI, DRY.
- Herramientas de infraestructura como código.

</details>

### Fase 2: Despliegue de Servicios

**Objetivo:** Implementar el despliegue de servicios siguiendo los principios de código limpio.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Define los servicios que se desplegarán en el sistema.
- Implementa el despliegue de servicios utilizando los principios de código limpio.
- Asegura que el despliegue sea escalable y mantenible.

**Entregable:** Configuración de despliegue de servicios que cumple con los principios de código limpio.

<details>
<summary>Pistas de conocimiento</summary>

- Principios de código limpio: KISS, SOLID, YAGNI, DRY.
- Herramientas de despliegue de servicios.

</details>

### Fase 3: Gestión de Recursos

**Objetivo:** Implementar la gestión de recursos del sistema siguiendo los principios de código limpio.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Define los recursos que se gestionarán en el sistema.
- Implementa la gestión de recursos utilizando los principios de código limpio.
- Asegura que la gestión de recursos sea eficiente y escalable.

**Entregable:** Configuración de gestión de recursos que cumple con los principios de código limpio.

<details>
<summary>Pistas de conocimiento</summary>

- Principios de código limpio: KISS, SOLID, YAGNI, DRY.
- Herramientas de gestión de recursos.

</details>

### Fase 4: Revisión y Mejora

**Objetivo:** Revisar y mejorar el sistema de infraestructura como código siguiendo los principios de código limpio.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Revisa el sistema implementado y identifica áreas de mejora.
- Implementa las mejoras necesarias siguiendo los principios de código limpio.
- Documenta las mejoras realizadas y las razones detrás de ellas.

**Entregable:** Sistema de infraestructura como código mejorado y documentado.

<details>
<summary>Pistas de conocimiento</summary>

- Principios de código limpio: KISS, SOLID, YAGNI, DRY.
- Herramientas de revisión y mejora de código.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es la infraestructura como código y por qué es importante en el desarrollo de software?
- **paraQueSirve**: ¿Para qué sirve aplicar los principios de código limpio en la infraestructura como código?
- **comoSeUsa**: ¿Cómo se aplican los principios de diseño de software (KISS, SOLID, YAGNI, DRY) en la infraestructura como código?
- **erroresComunes**: ¿Cuáles son los errores comunes al implementar la infraestructura como código y cómo se pueden evitar?
- **queDecisionesImplica**: ¿Qué decisiones implica la implementación de la infraestructura como código siguiendo los principios de código limpio?

## Criterios de Evaluacion

- Implementación de la configuración inicial siguiendo los principios de código limpio.
- Despliegue de servicios que cumple con los principios de código limpio.
- Gestión de recursos eficiente y escalable que sigue los principios de código limpio.
- Revisión y mejora del sistema de infraestructura como código siguiendo los principios de código limpio.

## Mapa de fases

La **Fase 0** es clonar el repositorio, instalar dependencias y correr las pruebas de aceptacion: todas fallan porque la logica de cada pieza esta pendiente.

| Fase | Pieza (skill) | Archivo:simbolo | Criterios | Prueba | Comando |
|------|---------------|-----------------|-----------|--------|---------|
| f1 — Configuración Inicial | configuración inicial de la red | — | La estructura básica del sistema de infraestructura como código está establecida.; La configuración inicial de la red está correctamente implementada.; La configuración inicial no utiliza recursos innecesarios.; La configuración inicial maneja correctamente errores de configuración. | — | — |
| f2 — Despliegue de Servicios | despliegue de servicios | — | El despliegue de servicios sigue los principios de código limpio.; Los servicios desplegados están correctamente configurados.; El despliegue de servicios maneja correctamente errores de despliegue.; El despliegue de servicios no introduce dependencias innecesarias. | `tests/acceptance/f2.tftest.hcl` | `terraform test -test-directory=tests/acceptance -filter=tests/acceptance/f2.tftest.hcl` |
| f3 — Gestión de Recursos | gestión de recursos | — | La gestión de recursos sigue los principios de código limpio.; Los recursos están correctamente gestionados.; La gestión de recursos maneja correctamente errores de gestión.; La gestión de recursos no introduce redundancias. | `tests/acceptance/f3.tftest.hcl` | `terraform test -test-directory=tests/acceptance -filter=tests/acceptance/f3.tftest.hcl` |
| f4 — Revisión y Mejora | revisión y mejora del sistema | — | El sistema de infraestructura como código ha sido revisado y mejorado siguiendo los principios de código limpio.; La documentación del sistema de infraestructura como código está actualizada.; La revisión y mejora del sistema maneja correctamente errores de revisión.; La revisión y mejora del sistema no introduce nuevas dependencias innecesarias. | `tests/acceptance/f4.tftest.hcl` | `terraform test -test-directory=tests/acceptance -filter=tests/acceptance/f4.tftest.hcl` |

## Pruebas de aceptacion

Las pruebas de aceptacion (columna "Prueba" de la tabla) son de **solo lectura**: definen que significa "listo". No las edites, no las borres y no les agregues `skip`; lo que se resuelve es el codigo de cada pieza.

## Restricciones del pedido

| Restriccion | Donde se cumple | Estado |
|-------------|-----------------|--------|
| Conoce, aplica y enseña al equipo de trabajo los conceptos y principios de código limpio y los principios de diseño de software (KISS, SOLID, YAGNI, DRY) | sin ubicar | Restriccion no verificada en sin ubicar |

## Herramientas

- **KISS**: Tecnologia pedida para este reto: forma parte del stack con el que se resuelve el ejercicio.
- **SOLID**: Tecnologia pedida para este reto: forma parte del stack con el que se resuelve el ejercicio.
- **YAGNI**: Tecnologia pedida para este reto: forma parte del stack con el que se resuelve el ejercicio.
- **DRY**: Tecnologia pedida para este reto: forma parte del stack con el que se resuelve el ejercicio.
- **Python**: Tecnologia del perfil del candidato: el reto se resuelve con ella.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
terraform init -backend=false && terraform -chdir=modules/network init -backend=false && terraform -chdir=modules/resources init -backend=false && terraform -chdir=modules/services init -backend=false && terraform -chdir=modules/system_review init -backend=false && terraform validate && terraform -chdir=modules/network validate && terraform -chdir=modules/resources validate && terraform -chdir=modules/services validate && terraform -chdir=modules/system_review validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
