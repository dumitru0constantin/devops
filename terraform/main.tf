provider "aws" {
  region = var.region
}

module "networking" {
  source = "./networking"
  region                = var.region
  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidr    = var.public_subnet_cidr
  private_subnet_cidr   = var.private_subnet_cidr
  public_subnet_az      = var.public_subnet_az
  private_subnet_az     = var.private_subnet_az
  igw_name              = var.igw_name
  private_subnet_name   = var.private_subnet_name
  public_subnet_name    = var.public_subnet_name
  private_rt_name       = var.private_rt_name
  public_rt_name        = var.public_rt_name
  ngw_name              = var.ngw_name
  ngw_eip_name          = var.ngw_eip_name 

}

module "ec2" {
  source = "./ec2"
  region                     = var.region
  vpc_id                     = module.networking.vpc_id
  ami_id                     = var.ami_id
  instance_type              = var.instance_type
  key_name                   = var.key_name
  public_key                 = var.public_key
  public_subnet_id           = module.networking.public_subnet_id
  private_subnet_id          = module.networking.private_subnet_id
  public_sg_name             = var.public_sg_name
  private_sg_name            = var.private_sg_name
  public_ec2_name            = var.public_ec2_name
  private_ec2_name           = var.private_ec2_name
  create_private_instance    = var.create_private_instance
  create_public_instance     = var.create_public_instance
  public_ec2_eip_name        = var.public_ec2_name
  public_ec2_number          = var.public_ec2_number
}
