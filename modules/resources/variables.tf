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