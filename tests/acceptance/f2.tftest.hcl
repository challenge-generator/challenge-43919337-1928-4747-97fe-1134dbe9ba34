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