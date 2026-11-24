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