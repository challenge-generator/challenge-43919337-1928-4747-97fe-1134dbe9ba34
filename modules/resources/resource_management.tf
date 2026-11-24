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