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