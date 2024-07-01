variable "key_name" {
  description = "Key pair name for SSH access"
}

variable "public_key" {
  description = "Public key for SSH access"
}

variable "vpc_name" {
  description = "Name for the VPC"
}

variable "region" {
  description = "AWS region"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
}

variable "public_subnet_az" {
  description = "Availability Zone for the public subnet"
}

variable "private_subnet_az" {
  description = "Availability Zone for the private subnet"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
}

variable "public_sg_name" {
  description = "Name of the security group for EC2 in public subnet"
}

variable "private_sg_name" {
  description = "Name of the security group for EC2 in private subnet"
}
  
variable "create_instance" {
  description = "Set to true to create the EC2 instance, false to skip."
  type        = bool
  default     = false
}

variable "igw_name" {
  description = "Name for the IGW"
}

variable "public_subnet_name" {
  description = "Name for the Public Subnet"
}

variable "private_subnet_name" {
  description = "Name for the Private Subnet"
}

variable "private_rt_name" {
  description = "Name for the Private Route Table"
}

variable "public_rt_name" {
  description = "Name for the Public Route Table"
}

variable "public_ec2_name" {
  description = "Name of the EC2 instance in the public subnet"
}

variable "private_ec2_name" {
  description = "Name of the EC2 instance in the private subnet"
}

variable "ngw_name" {
  description = "Name for the NAT Gateway"
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

variable "public_ec2_eip_name" {
  description = "Name for the Elastic IP for Public EC2"
}

variable "ngw_eip_name" {
  description = "Name for the NAT Gateway EIP"
}

variable "public_ec2_number" {
  description = "Numbers of Public EC2"
}