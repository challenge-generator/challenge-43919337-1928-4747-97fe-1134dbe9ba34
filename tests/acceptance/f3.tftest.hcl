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