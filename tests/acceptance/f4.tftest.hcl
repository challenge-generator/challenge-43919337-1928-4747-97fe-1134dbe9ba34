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