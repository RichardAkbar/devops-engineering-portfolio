module "networking" {
  source = "../../modules/networking"

  project_name       = var.project_name
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = "us-east-1a"
}

module "compute" {
  source = "../../modules/compute"

  project_name     = var.project_name
  vpc_id           = module.networking.vpc_id
  ssh_allowed_cidr = var.ssh_allowed_cidr
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  subnet_id        = module.networking.public_subnet_id
  public_key_path  = var.public_key_path
}
