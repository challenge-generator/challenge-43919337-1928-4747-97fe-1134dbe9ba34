# AGENTS.md

Instrucciones para el agente de IA que abra este repositorio (Claude Code, Cursor, Codex, Copilot, Gemini). Se cargan solas: no hay que pegar nada en ningun chat.

## Que es este repositorio

Es el codigo base de un reto de aprendizaje de Pragma: **Implementación de Infraestructura como Código con Principios de Código Limpio**.

| | |
|---|---|
| Tema | Practicas de codigo limpio |
| Nivel | senior-l2 |
| Chapter | DevSecOps |
| Especialidad | DevSecOps |
| Stack | HCL / Terraform |
| Patron arquitectonico | modular con separación de responsabilidades (network, services, resources, system_review) |
| Tiempo estimado | 10 horas |

## Herramientas

- **KISS**: Tecnologia pedida para este reto: forma parte del stack con el que se resuelve el ejercicio.
- **SOLID**: Tecnologia pedida para este reto: forma parte del stack con el que se resuelve el ejercicio.
- **YAGNI**: Tecnologia pedida para este reto: forma parte del stack con el que se resuelve el ejercicio.
- **DRY**: Tecnologia pedida para este reto: forma parte del stack con el que se resuelve el ejercicio.
- **Python**: Tecnologia del perfil del candidato: el reto se resuelve con ella.

## Receta del stack

Esqueleto obligatorio:

- `azure-pipelines.yml o .github/workflows/*.yml con stages reales`
- `Dockerfile multi-stage`
- `.dockerignore`
- `main.tf, variables.tf y outputs.tf de Terraform en la raiz del proyecto`
- `environments/{env}/terraform.tfvars`
- `scripts/ con los scripts de build y healthcheck`
- `sonar-project.properties`

Trampas conocidas:

- `required_version` de Terraform va como RANGO (`>= 1.5`), nunca exacto: pineado, el proyecto no corre con otra version instalada.
- Los providers tambien con restriccion flexible (`~> 5.0`).
- El Dockerfile multi-stage necesita que la etapa final copie el artefacto de la etapa de build, no el codigo fuente.

## Tu tarea

Dejar este proyecto en estado **verificable**: que el comando de verificacion corra sin errores. Escribi los archivos en disco, en este repositorio. No generes ZIPs ni archivos adjuntos.

En orden:

1. Corre `terraform init -backend=false && terraform -chdir=modules/network init -backend=false && terraform -chdir=modules/resources init -backend=false && terraform -chdir=modules/services init -backend=false && terraform -chdir=modules/system_review init -backend=false && terraform validate && terraform -chdir=modules/network validate && terraform -chdir=modules/resources validate && terraform -chdir=modules/services validate && terraform -chdir=modules/system_review validate` y mira que falla.
2. Completa lo que falte de la lista de abajo: manifiesto de dependencias, punto de entrada, capa de interfaz y las capas del patron declarado.
3. Arregla SOLO los errores que impiden compilar o arrancar.
4. Volve a correr `terraform init -backend=false && terraform -chdir=modules/network init -backend=false && terraform -chdir=modules/resources init -backend=false && terraform -chdir=modules/services init -backend=false && terraform -chdir=modules/system_review init -backend=false && terraform validate && terraform -chdir=modules/network validate && terraform -chdir=modules/resources validate && terraform -chdir=modules/services validate && terraform -chdir=modules/system_review validate` hasta que pase.
5. Pará ahí.

## Regla dura: las fases son trabajo del humano

**PROHIBIDO implementar los entregables de las fases.** El valor del reto esta en que la persona los resuelva. Tu trabajo es que tenga un proyecto que arranca; el hueco pedagogico se queda como esta.

No resuelvas nada de esto:

- **Fase 1 — Configuración Inicial**: Repositorio con la estructura básica y la configuración inicial de la red.
- **Fase 2 — Despliegue de Servicios**: Configuración de despliegue de servicios que cumple con los principios de código limpio.
- **Fase 3 — Gestión de Recursos**: Configuración de gestión de recursos que cumple con los principios de código limpio.
- **Fase 4 — Revisión y Mejora**: Sistema de infraestructura como código mejorado y documentado.

Distincion operativa:

- **Arreglar** (si): import faltante, tipo que no existe, dependencia sin declarar, error de sintaxis, archivo referenciado que no existe.
- **No tocar** (no): logica de negocio incompleta, validaciones ausentes, secretos hardcodeados, APIs deprecadas que funcionan, concurrencia insegura, patrones mejorables. Eso es lo que la persona tiene que encontrar.

## Superficie de practica (NO completes)

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs. No toques la logica que el reto pide completar.

- [ ] `modules/services/service_deployment.tf` — La pieza p2 (despliegue de servicios, fase f2) vive aqui: este archivo es su unico dueno (blueprint v2).
- [ ] `modules/resources/resource_management.tf` — La pieza p3 (gestión de recursos, fase f3) vive aqui: este archivo es su unico dueno (blueprint v2).
- [ ] `modules/system_review/system_review.tf` — La pieza p4 (revisión y mejora del sistema, fase f4) vive aqui: este archivo es su unico dueno (blueprint v2).

## Mapa de fases

La **Fase 0** es clonar el repositorio, instalar dependencias y correr las pruebas de aceptacion: todas fallan porque la logica de cada pieza esta pendiente.

| Fase | Pieza (skill) | Archivo:simbolo | Criterios | Prueba | Comando |
|------|---------------|-----------------|-----------|--------|---------|
| f1 — Configuración Inicial | configuración inicial de la red | — | La estructura básica del sistema de infraestructura como código está establecida.; La configuración inicial de la red está correctamente implementada.; La configuración inicial no utiliza recursos innecesarios.; La configuración inicial maneja correctamente errores de configuración. | — | — |
| f2 — Despliegue de Servicios | despliegue de servicios | — | El despliegue de servicios sigue los principios de código limpio.; Los servicios desplegados están correctamente configurados.; El despliegue de servicios maneja correctamente errores de despliegue.; El despliegue de servicios no introduce dependencias innecesarias. | `tests/acceptance/f2.tftest.hcl` | `terraform test -test-directory=tests/acceptance -filter=tests/acceptance/f2.tftest.hcl` |
| f3 — Gestión de Recursos | gestión de recursos | — | La gestión de recursos sigue los principios de código limpio.; Los recursos están correctamente gestionados.; La gestión de recursos maneja correctamente errores de gestión.; La gestión de recursos no introduce redundancias. | `tests/acceptance/f3.tftest.hcl` | `terraform test -test-directory=tests/acceptance -filter=tests/acceptance/f3.tftest.hcl` |
| f4 — Revisión y Mejora | revisión y mejora del sistema | — | El sistema de infraestructura como código ha sido revisado y mejorado siguiendo los principios de código limpio.; La documentación del sistema de infraestructura como código está actualizada.; La revisión y mejora del sistema maneja correctamente errores de revisión.; La revisión y mejora del sistema no introduce nuevas dependencias innecesarias. | `tests/acceptance/f4.tftest.hcl` | `terraform test -test-directory=tests/acceptance -filter=tests/acceptance/f4.tftest.hcl` |

## Pruebas de aceptacion y ubicacion de la logica

Las pruebas de aceptacion (columna "Prueba" de la tabla) son de **solo lectura**: definen que significa "listo". No las edites, no las borres y no les agregues `skip`; lo que se resuelve es el codigo de cada pieza.

La logica de cada pieza va en su archivo; no la muevas a otro.

## Restricciones del pedido

| Restriccion | Donde se cumple | Estado |
|-------------|-----------------|--------|
| Conoce, aplica y enseña al equipo de trabajo los conceptos y principios de código limpio y los principios de diseño de software (KISS, SOLID, YAGNI, DRY) | sin ubicar | Restriccion no verificada en sin ubicar |

## Lo que falta y tenes que completar

Referencias no verificadas para: .hcl. El analisis estatico no cubre esos lenguajes: que no se haya listado nada NO garantiza que no haya referencias colgando. Corre el comando de verificacion para encontrarlas.

### Presentes (15)

- `main.tf`
- `versions.tf`
- `providers.tf`
- `modules/network/network_setup.tf`
- `modules/network/variables.tf`
- `modules/services/variables.tf`
- `modules/resources/variables.tf`
- `modules/services/service_deployment.tf`
- `modules/resources/resource_management.tf`
- `modules/system_review/system_review.tf`
- `tests/acceptance/f2.tftest.hcl`
- `tests/acceptance/f3.tftest.hcl`
- `tests/acceptance/f4.tftest.hcl`
- `modules/system_review/variables.tf`
- `variables.tf`

### Capas del patron declarado

Son las capas que la propuesta arquitectonica plantea, marcadas segun existan hoy en el repo. Orientan donde poner el codigo nuevo; no son una condicion para compilar.

- `modules/network` (presente)
- `modules/services` (presente)
- `modules/resources` (presente)
- `modules/system_review` (presente)
- `environments/dev` (ausente)
- `environments/prod` (ausente)

## Verificacion

```bash
terraform init -backend=false && terraform -chdir=modules/network init -backend=false && terraform -chdir=modules/resources init -backend=false && terraform -chdir=modules/services init -backend=false && terraform -chdir=modules/system_review init -backend=false && terraform validate && terraform -chdir=modules/network validate && terraform -chdir=modules/resources validate && terraform -chdir=modules/services validate && terraform -chdir=modules/system_review validate
```

El comando tiene que pasar SIN implementar los archivos de la superficie de practica: solo andamiaje.

Ese comando pasando es la definicion de "terminado" para vos.

## Convenciones que tenes que respetar

- Un solo ecosistema: no declares librerias de otro lenguaje ni mezcles gestores de paquetes.
- Toda libreria que uses tiene que estar declarada en el manifiesto de dependencias.
- Todo import declarado tiene que usarse; todo tipo usado tiene que existir o venir de una dependencia declarada.
- El patron es **modular con separación de responsabilidades (network, services, resources, system_review)**: los contratos (interfaces, puertos) los define la capa interna y los implementa la externa, nunca al revés.
- Los archivos que crees llevan implementacion real, no stubs: sin `TODO`, sin cuerpos vacios, sin `// getters y setters`.

## Contexto del candidato

Sirve para calibrar el nivel del codigo, no para resolver las fases.

- Perfil: Chapter DevSecOps, Especialidad Ingeniería, Tecnología Python, Senior L2
- Brecha que el reto ataca: Conoce, aplica y enseña al equipo de trabajo los conceptos y principios de código limpio y los principios de diseño de software (KISS, SOLID, YAGNI, DRY)

---

*Generado por Challenge Generator — Pragma. `README.md` tiene el enunciado completo del reto para la persona. `PROMPT_MEJORA.md` es la variante para pegar en un chat, si se prefiere ese flujo.*
