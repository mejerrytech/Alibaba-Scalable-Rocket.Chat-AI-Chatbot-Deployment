variable "access_key" {
  description = "Alibaba Cloud access key"
  type        = string
}

variable "secret_key" {
  description = "Alibaba Cloud secret key"
  type        = string
}

variable "region" {
  description = "Region to deploy resources"
  type        = string
  default     = "me-central-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "ecs_instance_type" {
  description = "ECS instance type"
  type        = string
  default     = "ecs.t5-lc2m1.nano"
}

variable "image_id" {
  description = "ECS image ID for Ubuntu 22.04"
  type        = string
  default     = "ubuntu_22_04_x64_20G_alibase_20250415.vhd"
}

variable "ecs_password" {
  description = "ECS root password"
  type        = string
  sensitive   = true
}
