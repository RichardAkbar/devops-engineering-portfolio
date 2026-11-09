output "aws_region" {
  description = "AWS region used by this deployment"
  value       = var.aws_region
}

output "project_name" {
  description = "Project identifier"
  value       = var.project_name
}

output "vpc_cidr" {
  description = "Planned VPC CIDR block"
  value       = var.vpc_cidr
}

output "public_subnet_cidr" {
  description = "Planned public subnet CIDR block"
  value       = var.public_subnet_cidr
}

output "instance_type" {
  description = "Planned EC2 instance type"
  value       = var.instance_type
}
