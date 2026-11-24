# Variables for AWS infrastructure deployment
# These variables configure the network, services, and resources

variable "environment" {
  type        = string
  description = "Environment name (dev, staging, prod)"
  default     = "dev"
}

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones for subnets"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Enable NAT Gateway for private subnets"
  default     = true
}

variable "single_nat_gateway" {
  type        = bool
  description = "Use a single NAT Gateway for all private subnets"
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames for VPC"
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support for VPC"
  default     = true
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map public IP on subnet launch"
  default     = true
}

variable "service_name" {
  type        = string
  description = "Name of the ECS service"
  default     = "fintech-service"
}

variable "service_desired_count" {
  type        = number
  description = "Desired number of tasks for the service"
  default     = 2
}

variable "service_container_image" {
  type        = string
  description = "Container image for the service"
  default     = "fintech/app:latest"
}

variable "service_container_port" {
  type        = number
  description = "Container port exposed by the service"
  default     = 8080
}

variable "service_cpu" {
  type        = number
  description = "CPU units for the service task"
  default     = 256
}

variable "service_memory" {
  type        = number
  description = "Memory in MB for the service task"
  default     = 512
}

variable "alb_ingress_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks allowed to access the ALB"
  default     = ["0.0.0.0/0"]
}

variable "db_instance_class" {
  type        = string
  description = "RDS instance class"
  default     = "db.t3.micro"
}

variable "db_name" {
  type        = string
  description = "Name of the database"
  default     = "fintechdb"
}

variable "db_username" {
  type        = string
  description = "Database master username"
  default     = "admin"
}

variable "db_password" {
  type        = string
  description = "Database master password"
  default     = "ChangeMe123!"
  sensitive   = true
}

variable "db_allocated_storage" {
  type        = number
  description = "Allocated storage in GB for RDS"
  default     = 20
}

variable "db_engine" {
  type        = string
  description = "Database engine"
  default     = "mysql"
}

variable "db_engine_version" {
  type        = string
  description = "Database engine version"
  default     = "8.0"
}

variable "storage_type" {
  type        = string
  description = "Storage type for RDS"
  default     = "gp2"
}

variable "db_instance_identifier" {
  type        = string
  description = "RDS instance identifier"
  default     = "fintech-db"
}

variable "enable_review" {
  type        = bool
  description = "Enable system review checks"
  default     = false
}

variable "strict_mode" {
  type        = bool
  description = "Enable strict mode for system review"
  default     = false
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to apply to all resources"
  default     = {}
}