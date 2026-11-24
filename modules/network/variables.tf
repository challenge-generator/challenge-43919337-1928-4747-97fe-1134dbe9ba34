# Variables para el módulo de red
# Estas variables permiten personalizar la configuración de red según el entorno.

variable "vpc_cidr" {
  description = "CIDR block para la VPC. Ejemplo: '10.0.0.0/16'"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Lista de CIDR blocks para subnets públicas. Ejemplo: ['10.0.1.0/24', '10.0.2.0/24']"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Lista de CIDR blocks para subnets privadas. Ejemplo: ['10.0.3.0/24', '10.0.4.0/24']"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidad para distribuir las subnets. Ejemplo: ['us-east-1a', 'us-east-1b']"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "environment" {
  description = "Entorno de despliegue (dev, staging, prod). Usado para etiquetar recursos."
  type        = string
  default     = "dev"
}