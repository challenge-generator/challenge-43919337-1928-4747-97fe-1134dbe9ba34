# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `modules/services/service_deployment.tf` — La pieza p2 (despliegue de servicios, fase f2) vive aqui: este archivo es su unico dueno (blueprint v2).
- `modules/resources/resource_management.tf` — La pieza p3 (gestión de recursos, fase f3) vive aqui: este archivo es su unico dueno (blueprint v2).
- `modules/system_review/system_review.tf` — La pieza p4 (revisión y mejora del sistema, fase f4) vive aqui: este archivo es su unico dueno (blueprint v2).

## Herramientas

- **KISS**: Tecnologia pedida para este reto: forma parte del stack con el que se resuelve el ejercicio.
- **SOLID**: Tecnologia pedida para este reto: forma parte del stack con el que se resuelve el ejercicio.
- **YAGNI**: Tecnologia pedida para este reto: forma parte del stack con el que se resuelve el ejercicio.
- **DRY**: Tecnologia pedida para este reto: forma parte del stack con el que se resuelve el ejercicio.
- **Python**: Tecnologia del perfil del candidato: el reto se resuelve con ella.

## Referencias no verificadas

Referencias no verificadas para: .hcl. El analisis estatico no cubre esos lenguajes: que no se haya listado nada NO garantiza que no haya referencias colgando.

## Como saber que terminaste

```bash
terraform init -backend=false && terraform -chdir=modules/network init -backend=false && terraform -chdir=modules/resources init -backend=false && terraform -chdir=modules/services init -backend=false && terraform -chdir=modules/system_review init -backend=false && terraform validate && terraform -chdir=modules/network validate && terraform -chdir=modules/resources validate && terraform -chdir=modules/services validate && terraform -chdir=modules/system_review validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter DevSecOps, Especialidad Ingeniería, Tecnología Python, Senior L2

### Brecha de conocimiento
Conoce, aplica y enseña al equipo de trabajo los conceptos y principios de código limpio y los principios de diseño de software (KISS, SOLID, YAGNI, DRY)

### Reto
- Tema: Practicas de codigo limpio
- Seniority: senior-l2
- Tipo: practical
- Título: Implementación de Infraestructura como Código con Principios de Código Limpio
- Tiempo estimado: 10 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración Inicial — objetivo: Establecer la estructura básica del sistema de infraestructura como código. — entregable (NO resolver): Repositorio con la estructura básica y la configuración inicial de la red.
- Fase 2: Despliegue de Servicios — objetivo: Implementar el despliegue de servicios siguiendo los principios de código limpio. — entregable (NO resolver): Configuración de despliegue de servicios que cumple con los principios de código limpio.
- Fase 3: Gestión de Recursos — objetivo: Implementar la gestión de recursos del sistema siguiendo los principios de código limpio. — entregable (NO resolver): Configuración de gestión de recursos que cumple con los principios de código limpio.
- Fase 4: Revisión y Mejora — objetivo: Revisar y mejorar el sistema de infraestructura como código siguiendo los principios de código limpio. — entregable (NO resolver): Sistema de infraestructura como código mejorado y documentado.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: main.tf ===
# Main Terraform configuration for AWS infrastructure deployment
# This file orchestrates the deployment of network, services, and resources

module "network" {
  source = "./modules/network"

  vpc_cidr             = var.vpc_cidr_block
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  environment          = var.environment
}

module "resources" {
  source = "./modules/resources"

  environment            = var.environment
  db_instance_identifier = var.db_instance_identifier
  db_name                = var.db_name
  db_username            = var.db_username
  db_password            = var.db_password
  db_instance_class      = var.db_instance_class
  allocated_storage      = var.db_allocated_storage
  vpc_security_group_ids = [module.network.web_security_group_id]
  db_subnet_group_name   = "fintech-db-subnet-group"
  db_subnet_ids          = module.network.private_subnet_ids
  storage_type           = var.storage_type
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
}

module "services" {
  source = "./modules/services"

  environment        = var.environment
  service_name       = var.service_name
  container_port     = var.service_container_port
  desired_count      = var.service_desired_count
  cpu                = var.service_cpu
  memory             = var.service_memory
  subnet_ids         = module.network.private_subnet_ids
  security_group_ids = [module.network.web_security_group_id]
  target_group_arn   = ""
  ecs_cluster_id     = ""
}

module "system_review" {
  source = "./modules/system_review"

  environment           = var.environment
  vpc_id                = module.network.vpc_id
  dynamodb_table_name   = "fintech-review-table"
  ecs_cluster_name      = "fintech-cluster"
  enable_review         = var.enable_review
  strict_mode           = var.strict_mode
  review_rules          = {}
  tags                  = var.common_tags
}

// === ARCHIVO: versions.tf ===
terraform {
  required_version = ">= 1.9.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.100.0"
    }
  }
}

// === ARCHIVO: providers.tf ===
provider "aws" {
  region = "us-east-1"
}

// === ARCHIVO: modules/network/network_setup.tf ===
# Módulo de configuración de red
# Responsable de definir la infraestructura de red básica siguiendo principios KISS, SOLID y DRY.
# Incluye VPC, subnets, security groups y routing.

# Creación de la VPC principal
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "vpc-${var.environment}"
    Environment = var.environment
  }
}

# Internet Gateway para acceso a Internet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "igw-${var.environment}"
    Environment = var.environment
  }
}

# Subnets públicas
resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "public-subnet-${var.environment}-${count.index}"
    Environment = var.environment
    Tier        = "public"
  }
}

# Subnets privadas
resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name        = "private-subnet-${var.environment}-${count.index}"
    Environment = var.environment
    Tier        = "private"
  }
}

# Tabla de ruteo para subnets públicas
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "public-rt-${var.environment}"
    Environment = var.environment
  }
}

# Asociación de subnets públicas con la tabla de ruteo
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Security Group para permitir tráfico HTTP/HTTPS
resource "aws_security_group" "web" {
  name        = "web-sg-${var.environment}"
  description = "Permite tráfico HTTP y HTTPS"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "web-sg-${var.environment}"
    Environment = var.environment
  }
}

# Outputs del módulo
output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = aws_subnet.private[*].id
}

output "web_security_group_id" {
  description = "ID del security group para tráfico web"
  value       = aws_security_group.web.id
}

// === ARCHIVO: modules/network/variables.tf ===
# Variables para el módulo de red
# Estas variables permiten personalizar la configuración de red según el entorno.

variable "vpc_cidr" {
  description = "CIDR block para la VPC. Ejemplo: '10.0.0.0/16'"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Lista de CIDR blocks para subnets públicas. Ejemplo: ['10.0.1.0/24', '10.0.2.0/24']"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Lista de CIDR blocks para subnets privadas. Ejemplo: ['10.0.3.0/24', '10.0.4.0/24']"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidad para distribuir las subnets. Ejemplo: ['us-east-1a', 'us-east-1b']"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod). Usado para etiquetar recursos."
  type        = string
  default     = "dev"
}

// === ARCHIVO: modules/services/variables.tf ===
# Variables para el módulo de servicios
# Estas variables permiten configurar los servicios desplegados en la infraestructura.

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "service_name" {
  description = "Nombre del servicio que se desplegará"
  type        = string
  default     = "fintech-service"
}

variable "container_port" {
  description = "Puerto expuesto por el contenedor del servicio"
  type        = number
  default     = 8080
}

variable "desired_count" {
  description = "Número deseado de instancias del servicio"
  type        = number
  default     = 2
}

variable "cpu" {
  description = "Cantidad de CPU asignada al servicio (en unidades de CPU)"
  type        = number
  default     = 256
}

variable "memory" {
  description = "Cantidad de memoria asignada al servicio (en MB)"
  type        = number
  default     = 512
}

variable "subnet_ids" {
  description = "IDs de las subnets donde se desplegará el servicio"
  type        = list(string)
}

variable "security_group_ids" {
  description = "IDs de los security groups asociados al servicio"
  type        = list(string)
}

variable "target_group_arn" {
  description = "ARN del target group para el balanceador de carga"
  type        = string
}

// === ARCHIVO: modules/resources/variables.tf ===
# Variables para el módulo de recursos
# Estas variables permiten configurar los recursos gestionados por la infraestructura.

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "db_instance_identifier" {
  description = "Identificador de la instancia de base de datos"
  type        = string
  default     = "fintech-db"
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
  default     = "fintechdb"
}

variable "db_username" {
  description = "Usuario maestro de la base de datos"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Contraseña maestra de la base de datos (debe proporcionarse vía tfvars)"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Clase de instancia de la base de datos"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Espacio de almacenamiento asignado (en GB)"
  type        = number
  default     = 20
}

variable "vpc_security_group_ids" {
  description = "IDs de los security groups para la base de datos"
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "Nombre del grupo de subnets para la base de datos"
  type        = string
}

variable "storage_type" {
  description = "Tipo de almacenamiento para la base de datos (standard, gp2, gp3)"
  type        = string
  default     = "gp2"
}

variable "engine" {
  description = "Motor de la base de datos (mysql, postgres, etc.)"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Versión del motor de la base de datos"
  type        = string
  default     = "8.0"
}

// === ARCHIVO: modules/services/service_deployment.tf ===
# ServiceDeployment: Módulo para despliegue de servicios siguiendo principios de código limpio
# Implementa SOLID, YAGNI y KISS en la configuración de infraestructura
# piece: Evidencia de aplicación de principios de código limpio (KISS, SOLID, YAGNI, DRY)

# Puerto para la configuración de servicios (contrato)
variable "service_config" {
  description = "Configuración del servicio a desplegar"
  type = object({
    name           = string
    container_port = number
    desired_count  = number
    cpu            = number
    memory         = number
    subnet_ids     = list(string)
    sg_ids         = list(string)
    target_group_arn = string
  })
  default = null
}

# Validación de configuración de servicio
locals {
  valid_service_config = var.service_config != null ? var.service_config : {
    name           = "fintech-service"
    container_port = 8080
    desired_count  = 2
    cpu            = 256
    memory         = 512
    subnet_ids     = []
    sg_ids         = []
    target_group_arn = ""
  }

  # Validación de parámetros (principio KISS)
  is_valid_config = (length(local.valid_service_config.subnet_ids) > 0 && length(local.valid_service_config.sg_ids) > 0 && local.valid_service_config.desired_count > 0 && local.valid_service_config.container_port > 0)
}

# Task Definition para ECS (principio de responsabilidad única)
# TODO(reto): implementa este bloque
# resource "aws_ecs_task_definition" "service" {
# }

# Servicio ECS (principio de responsabilidad única)
# TODO(reto): implementa este bloque
# resource "aws_ecs_service" "main" {
# }

# IAM Role para ejecución de tareas
# TODO(reto): implementa este bloque
# resource "aws_iam_role" "ecs_execution_role" {
# }

# TODO(reto): implementa este bloque
# resource "aws_iam_role_policy_attachment" "ecs_execution_policy" {
# }

# IAM Role para tareas
# TODO(reto): implementa este bloque
# resource "aws_iam_role" "ecs_task_role" {
# }

# Variable para el cluster ECS
variable "ecs_cluster_id" {
  description = "ID del cluster ECS donde se desplegará el servicio"
  type        = string
}

# Outputs
output "service_name" {
  value = null # TODO(reto): local.is_valid_config ? aws_ecs_service.main[0].name : ""
  description = "Nombre del servicio desplegado"
}

output "task_definition_arn" {
  value = null # TODO(reto): local.is_valid_config ? aws_ecs_task_definition.service[0].arn : ""
  description = "ARN de la task definition"
}

output "service_arn" {
  value = null # TODO(reto): local.is_valid_config ? aws_ecs_service.main[0].id : ""
  description = "ARN del servicio"
}

// === ARCHIVO: modules/resources/resource_management.tf ===
# ResourceManagement: Módulo para gestión de recursos siguiendo principios de código limpio
# Implementa KISS y DRY en la configuración de infraestructura

# Puerto para la configuración de recursos (contrato)
variable "resource_config" {
  description = "Configuración de los recursos a gestionar"
  type = object({
    db_instance_id     = string
    db_name            = string
    db_username        = string
    db_password        = string
    db_instance_class  = string
    allocated_storage  = number
    sg_ids             = list(string)
    subnet_group_name  = string
    storage_type       = string
    engine             = string
    engine_version     = string
  })
  default = null
}

# Validación de configuración de recursos
locals {
  valid_resource_config = var.resource_config != null ? var.resource_config : {
    db_instance_id    = "fintech-db"
    db_name           = "fintechdb"
    db_username       = "admin"
    db_password       = ""
    db_instance_class = "db.t3.micro"
    allocated_storage = 20
    sg_ids            = []
    subnet_group_name = ""
    storage_type      = "gp2"
    engine            = "mysql"
    engine_version    = "8.0"
  }

  # Validación de parámetros (principio KISS)
  is_valid_resource = (length(local.valid_resource_config.sg_ids) > 0 && local.valid_resource_config.subnet_group_name != "" && local.valid_resource_config.allocated_storage > 0)
}

# Subnet group para RDS (principio de responsabilidad única)
# TODO(reto): implementa este bloque
# resource "aws_db_subnet_group" "main" {
# }

# Instancia de base de datos RDS (principio de responsabilidad única)
# TODO(reto): implementa este bloque
# resource "aws_db_instance" "main" {
# }

# Parameter group para la base de datos
# TODO(reto): implementa este bloque
# resource "aws_db_parameter_group" "main" {
# }

# Option group para la base de datos
# TODO(reto): implementa este bloque
# resource "aws_db_option_group" "main" {
# }

# Variable para subnets de la base de datos
variable "db_subnet_ids" {
  description = "IDs de las subnets donde se desplegará la base de datos"
  type        = list(string)
}

# Variable de entorno

# Outputs
output "db_instance_id" {
  value = null # TODO(reto): local.is_valid_resource ? aws_db_instance.main[0].id : ""
  description = "Identificador de la instancia de base de datos"
}

output "db_endpoint" {
  value = null # TODO(reto): local.is_valid_resource ? aws_db_instance.main[0].endpoint : ""
  description = "Endpoint de la base de datos"
}

output "db_address" {
  value = null # TODO(reto): local.is_valid_resource ? aws_db_instance.main[0].address : ""
  description = "Dirección de la base de datos"
}

output "db_port" {
  value = null # TODO(reto): local.is_valid_resource ? aws_db_instance.main[0].port : ""
  description = "Puerto de la base de datos"
}

// === ARCHIVO: modules/system_review/system_review.tf ===
# Sistema de revisión y mejora de infraestructura como código
# Implementa revisión automática siguiendo principios de código limpio (SOLID, YAGNI, KISS, DRY)

locals {
  # Configuración de reglas de revisión basadas en principios de código limpio
  review_rules = {
    solid_principles = {
      single_responsibility = "Cada recurso debe tener una única responsabilidad"
      open_closed           = "Los módulos deben estar abiertos para extensión y cerrados para modificación"
      liskov_substitution   = "Los recursos deben ser reemplazables sin alterar el comportamiento"
      interface_segregation = "Múltiples interfaces específicas son mejores que una general"
      dependency_inversion  = "Depender de abstracciones, no de concreciones"
    }
    yagni_principles = {
      avoid_premature_abstraction = "No implementar funcionalidad que no sea necesaria actualmente"
      simple_design                = "Diseño simple primero, refactorizar cuando sea necesario"
    }
    kiss_principles = {
      simplicity_in_design = "Mantener la infraestructura simple y comprensible"
      minimal_complexity   = "Evitar complejidad innecesaria"
    }
    dry_principles = {
      avoid_duplication = "No repetir configuraciones"
      reusable_modules  = "Crear módulos reutilizables"
    }
  }
}

# Proveedor de configuración del sistema para inyección de dependencias
# Este es el puerto que permite aislar la pieza en pruebas
# TODO(reto): implementa este bloque
# resource "null_resource" "system_configuration_provider" {
# }

# Configuración del sistema (puerto de entrada para testing)
# Simula el contrato que la pieza SystemReview consume
locals {
  system_configuration = {
    vpc_id              = var.vpc_id
    dynamodb_table_name = var.dynamodb_table_name
    ecs_cluster_name    = var.ecs_cluster_name
    enable_review       = var.enable_review
    strict_mode         = var.strict_mode
  }
}

# Validador de configuración del sistema
locals {
  is_valid_configuration = (local.system_configuration != null && local.system_configuration.vpc_id != "" && local.system_configuration.enable_review == true)
}

# Sistema de revisión y mejora del sistema de infraestructura
# Clase principal que implementa la revisión siguiendo principios de código limpio
# TODO(reto): implementa este bloque
# resource "null_resource" "system_review" {
# }

# Manejo de errores cuando la configuración es inválida
# TODO(reto): implementa este bloque
# resource "null_resource" "system_review_error" {
# }

# Variables de entrada para el sistema de revisión

# Outputs del sistema de revisión
output "review_completed" {
  description = "Indica si la revisión se completó exitosamente"
  value       = local.is_valid_configuration
}

output "review_timestamp" {
  description = "Timestamp de la última revisión"
  value       = local.is_valid_configuration ? timestamp() : "never"
}

output "principles_applied" {
  description = "Principios de código limpio aplicados"
  value = {
    solid = local.is_valid_configuration
    yagni = local.is_valid_configuration
    kiss  = local.is_valid_configuration
    dry   = local.is_valid_configuration
  }
}

output "configuration_valid" {
  description = "Indica si la configuración es válida"
  value       = local.is_valid_configuration
}

output "error_message" {
  description = "Mensaje de error si la configuración es inválida"
  value       = local.is_valid_configuration ? "" : "Configuración inválida para revisión del sistema"
}

// === ARCHIVO: tests/acceptance/f2.tftest.hcl ===
# Pruebas de aceptación para el despliegue de servicios (fase f2)
# Verifica el comportamiento del módulo ServiceDeployment

mock_provider "aws" {}

run "valid_service_deployment" {
  description = "Despliegue de servicios correcto"
  
  command = plan
  
  variables {
    ecs_cluster_id = "arn:aws:ecs:us-east-1:123456789012:cluster/test-cluster"
    
    service_config = {
      name           = "fintech-service"
      container_port = 8080
      desired_count  = 2
      cpu            = 256
      memory         = 512
      subnet_ids     = ["subnet-12345678", "subnet-87654321"]
      sg_ids         = ["sg-12345678"]
      target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/test/12345678"
    }
  }
  
  assert {
    condition     = length(aws_ecs_service.main) == 1
    error_message = "El servicio ECS debe ser creado"
  }
  
  assert {
    condition     = aws_ecs_service.main[0].desired_count == 2
    error_message = "El número de instancias debe ser 2"
  }
  
  assert {
    condition     = aws_ecs_task_definition.service[0].family == "fintech-service-family"
    error_message = "La task definition debe tener el nombre correcto"
  }
}

run "invalid_service_deployment" {
  description = "Manejo de errores de despliegue"
  
  command = plan
  
  variables {
    ecs_cluster_id = "arn:aws:ecs:us-east-1:123456789012:cluster/test-cluster"
    
    service_config = {
      name           = "fintech-service"
      container_port = 8080
      desired_count  = 0
      cpu            = 256
      memory         = 512
      subnet_ids     = []
      sg_ids         = []
      target_group_arn = ""
    }
  }
  
  assert {
    condition     = length(aws_ecs_service.main) == 0
    error_message = "No debe crear recursos con configuración inválida"
  }
  
  assert {
    condition     = length(aws_ecs_task_definition.service) == 0
    error_message = "No debe crear task definition con configuración inválida"
  }
}

// === ARCHIVO: tests/acceptance/f3.tftest.hcl ===
# Pruebas de aceptación para la gestión de recursos (fase f3)
# Verifica el comportamiento del módulo ResourceManagement

mock_provider "aws" {}

run "valid_resource_management" {
  description = "Gestión de recursos correcta"
  
  command = plan
  
  variables {
    environment = "dev"
    db_subnet_ids = ["subnet-12345678", "subnet-87654321"]
    
    resource_config = {
      db_instance_id    = "fintech-db"
      db_name           = "fintechdb"
      db_username       = "admin"
      db_password       = "SecurePassword123!"
      db_instance_class = "db.t3.micro"
      allocated_storage = 20
      sg_ids            = ["sg-12345678"]
      subnet_group_name = "fintech-db-subnet-group"
      storage_type      = "gp2"
      engine            = "mysql"
      engine_version    = "8.0"
    }
  }
  
  assert {
    condition     = length(aws_db_instance.main) == 1
    error_message = "La instancia de base de datos debe ser creada"
  }
  
  assert {
    condition     = aws_db_instance.main[0].instance_class == "db.t3.micro"
    error_message = "La clase de instancia debe ser db.t3.micro"
  }
  
  assert {
    condition     = aws_db_instance.main[0].allocated_storage == 20
    error_message = "El almacenamiento asignado debe ser 20 GB"
  }
  
  assert {
    condition     = length(aws_db_subnet_group.main) == 1
    error_message = "El subnet group debe ser creado"
  }
}

run "invalid_resource_management" {
  description = "Manejo de errores de gestión"
  
  command = plan
  
  variables {
    environment = "dev"
    db_subnet_ids = []
    
    resource_config = {
      db_instance_id    = "fintech-db"
      db_name           = "fintechdb"
      db_username       = "admin"
      db_password       = "SecurePassword123!"
      db_instance_class = "db.t3.micro"
      allocated_storage = 20
      sg_ids            = []
      subnet_group_name = ""
      storage_type      = "gp2"
      engine            = "mysql"
      engine_version    = "8.0"
    }
  }
  
  assert {
    condition     = length(aws_db_instance.main) == 0
    error_message = "No debe crear recursos con configuración inválida"
  }
  
  assert {
    condition     = length(aws_db_subnet_group.main) == 0
    error_message = "No debe crear subnet group sin subnets"
  }
}

// === ARCHIVO: tests/acceptance/f4.tftest.hcl ===
# Pruebas de aceptación para la fase f4 - Revisión y Mejora del Sistema
# Estas pruebas verifican el comportamiento del sistema de revisión de infraestructura

mock_provider "aws" {}
mock_provider "null" {}

# Caso de aceptación 1: Revisión y mejora del sistema correcta
# Dado: Una configuración del sistema válida
# Cuando: Se ejecuta la revisión y mejora del sistema
# Entonces: La revisión y mejora del sistema se completa correctamente
run "valid_system_review_test" {
  
  command = apply

  providers = {
    aws  = mock.aws
    null = mock.null
  }

  variables {
    vpc_id              = "vpc-0123456789abcdef0"
    dynamodb_table_name = "fintech-table"
    ecs_cluster_name    = "fintech-cluster"
    enable_review       = true
    strict_mode         = true
  }

  # Verificar que la revisión se completó exitosamente
  assert {
    condition     = output.review_completed == true
    error_message = "La revisión del sistema debería completarse exitosamente con configuración válida"
  }

  # Verificar que la configuración es válida
  assert {
    condition     = output.configuration_valid == true
    error_message = "La configuración debería ser válida"
  }

  # Verificar que los principios fueron aplicados
  assert {
    condition     = output.principles_applied.value.solid == true
    error_message = "El principio SOLID debería estar aplicado"
  }

  assert {
    condition     = output.principles_applied.value.yagni == true
    error_message = "El principio YAGNI debería estar aplicado"
  }

  assert {
    condition     = output.principles_applied.value.kiss == true
    error_message = "El principio KISS debería estar aplicado"
  }

  assert {
    condition     = output.principles_applied.value.dry == true
    error_message = "El principio DRY debería estar aplicado"
  }

  # Verificar que no hay mensaje de error
  assert {
    condition     = output.error_message == ""
    error_message = "No debería haber mensaje de error con configuración válida"
  }
}

# Caso de aceptación 2: Manejo de errores de revisión
# Dado: Una configuración del sistema inválida
# Cuando: Se ejecuta la revisión y mejora del sistema
# Entonces: Se maneja correctamente el error de revisión
run "invalid_system_review_test" {
  
  command = apply

  providers = {
    aws  = mock.aws
    null = mock.null
  }

  variables {
    vpc_id              = ""
    dynamodb_table_name = "fintech-table"
    ecs_cluster_name    = "fintech-cluster"
    enable_review       = false
    strict_mode         = false
  }

  # Verificar que la revisión NO se completó
  assert {
    condition     = output.review_completed == false
    error_message = "La revisión no debería completarse con configuración inválida"
  }

  # Verificar que la configuración es inválida
  assert {
    condition     = output.configuration_valid == false
    error_message = "La configuración debería ser inválida"
  }

  # Verificar que hay mensaje de error
  assert {
    condition     = output.error_message != ""
    error_message = "Debería haber mensaje de error con configuración inválida"
  }

  # Verificar que los principios NO fueron aplicados
  assert {
    condition     = output.principles_applied.value.solid == false
    error_message = "El principio SOLID no debería estar aplicado con configuración inválida"
  }
}

# Caso de aceptación adicional: Revisión sin VPC ID
run "missing_vpc_review_test" {
  
  command = apply

  providers = {
    aws  = mock.aws
    null = mock.null
  }

  variables {
    vpc_id              = ""
    dynamodb_table_name = "fintech-table"
    ecs_cluster_name    = "fintech-cluster"
    enable_review       = true
    strict_mode         = false
  }

  # Verificar que la revisión NO se completó
  assert {
    condition     = output.review_completed == false
    error_message = "La revisión no debería completarse sin VPC ID"
  }

  # Verificar que la configuración es inválida
  assert {
    condition     = output.configuration_valid == false
    error_message = "La configuración debería ser inválida sin VPC ID"
  }
}

// === ARCHIVO: modules/system_review/variables.tf ===
# Variables para el módulo de revisión del sistema
# Este módulo proporciona validación y revisión de la configuración
# de infraestructura aplicando principios de código limpio.

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod). Usado para etiquetar recursos y validar configuraciones."
  type        = string
  default     = "dev"
}

variable "vpc_id" {
  description = "ID de la VPC a revisar. Se utiliza para validar la configuración de red."
  type        = string
  default     = ""
}

variable "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB para almacenar resultados de revisión."
  type        = string
  default     = ""
}

variable "ecs_cluster_name" {
  description = "Nombre del cluster ECS a revisar. Se utiliza para validar la configuración de servicios."
  type        = string
  default     = ""
}

variable "enable_review" {
  description = "Habilitar la ejecución de la revisión del sistema. Cuando está deshabilitado, el módulo no realiza ninguna validación."
  type        = bool
  default     = false
}

variable "strict_mode" {
  description = "Modo estricto de revisión. Cuando está habilitado, los errores de validación detienen la ejecución."
  type        = bool
  default     = false
}

variable "review_rules" {
  description = "Lista de reglas de revisión a aplicar. Cada regla define un criterio de validación específico."
  type = list(object({
    name        = string
    description = string
    enabled     = bool
    severity    = string
  }))
  default = [
    {
      name        = "vpc_configuration"
      description = "Validar que la VPC tenga la configuración correcta"
      enabled     = true
      severity    = "high"
    },
    {
      name        = "subnet_architecture"
      description = "Validar que las subnets estén correctamente configuradas"
      enabled     = true
      severity    = "medium"
    },
    {
      name        = "security_groups"
      description = "Validar que los security groups tengan reglas apropiadas"
      enabled     = true
      severity    = "high"
    },
    {
      name        = "ecs_cluster"
      description = "Validar que el cluster ECS esté configurado correctamente"
      enabled     = true
      severity    = "medium"
    },
    {
      name        = "database_resources"
      description = "Validar que los recursos de base de datos estén configurados"
      enabled     = true
      severity    = "high"
    }
  ]
}

variable "tags" {
  description = "Etiquetas personalizadas para los recursos de revisión."
  type        = map(string)
  default     = {}
}

// === ARCHIVO: variables.tf ===
# Variables for AWS infrastructure deployment
# These variables configure the network, services, and resources

variable "environment" {
  type        = string
  description = "Environment name (dev, staging, prod)"
  default     = "dev"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones for subnets"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Enable NAT Gateway for private subnets"
  default     = true
}

variable "single_nat_gateway" {
  type        = bool
  description = "Use a single NAT Gateway for all private subnets"
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames for VPC"
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support for VPC"
  default     = true
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map public IP on subnet launch"
  default     = true
}

variable "service_name" {
  type        = string
  description = "Name of the ECS service"
  default     = "fintech-service"
}

variable "service_desired_count" {
  type        = number
  description = "Desired number of tasks for the service"
  default     = 2
}

variable "service_container_image" {
  type        = string
  description = "Container image for the service"
  default     = "fintech/app:latest"
}

variable "service_container_port" {
  type        = number
  description = "Container port exposed by the service"
  default     = 8080
}

variable "service_cpu" {
  type        = number
  description = "CPU units for the service task"
  default     = 256
}

variable "service_memory" {
  type        = number
  description = "Memory in MB for the service task"
  default     = 512
}

variable "alb_ingress_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks allowed to access the ALB"
  default     = ["0.0.0.0/0"]
}

variable "db_instance_class" {
  type        = string
  description = "RDS instance class"
  default     = "db.t3.micro"
}

variable "db_name" {
  type        = string
  description = "Name of the database"
  default     = "fintechdb"
}

variable "db_username" {
  type        = string
  description = "Database master username"
  default     = "admin"
}

variable "db_password" {
  type        = string
  description = "Database master password"
  default     = "ChangeMe123!"
  sensitive   = true
}

variable "db_allocated_storage" {
  type        = number
  description = "Allocated storage in GB for RDS"
  default     = 20
}

variable "db_engine" {
  type        = string
  description = "Database engine"
  default     = "mysql"
}

variable "db_engine_version" {
  type        = string
  description = "Database engine version"
  default     = "8.0"
}

variable "storage_type" {
  type        = string
  description = "Storage type for RDS"
  default     = "gp2"
}

variable "db_instance_identifier" {
  type        = string
  description = "RDS instance identifier"
  default     = "fintech-db"
}

variable "enable_review" {
  type        = bool
  description = "Enable system review checks"
  default     = false
}

variable "strict_mode" {
  type        = bool
  description = "Enable strict mode for system review"
  default     = false
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to apply to all resources"
  default     = {}
}
```
