variable "region" {
  description = "AWS region"
}

variable "vpc_id" {
  description = "ID of the VPC"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
}

variable "public_subnet_id" {
  description = "ID of the subnet for the public EC2 instance"
}

variable "private_subnet_id" {
  description = "ID of the subnet for the private EC2 instance"
}

variable "public_sg_name" {
  description = "Name of the security group for EC2 in public subnet"
}

variable "private_sg_name" {
  description = "Name of the security group for EC2 in private subnet"
}

variable "public_ec2_name" {
  description = "Name of the EC2 instance in the public subnet"
}

variable "private_ec2_name" {
  description = "Name of the EC2 instance in the private subnet"
}

variable "create_private_instance" {
  description = "Set to true to create the EC2 instance, false to skip."
  type        = bool
  default     = false
}

variable "create_public_instance" {
  description = "Set to true to create the EC2 instance, false to skip."
  type        = bool
  default     = false
}

variable "key_name" {
  description = "Key Pair name for SSH access"
}

variable "public_key" {
  description = "Public key for SSH access"
}

variable "public_ec2_eip_name" {
  description = "Name for the Elastic IP for Public EC2"
}

variable "public_ec2_number" {
  description = "Numbers of Public EC2"
}