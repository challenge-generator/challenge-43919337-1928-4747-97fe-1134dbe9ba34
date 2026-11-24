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