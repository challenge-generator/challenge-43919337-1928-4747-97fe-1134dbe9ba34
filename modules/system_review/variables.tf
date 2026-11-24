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