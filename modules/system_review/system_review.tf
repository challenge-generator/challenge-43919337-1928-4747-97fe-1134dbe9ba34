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