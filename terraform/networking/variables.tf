variable "region" {
  description = "AWS region"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  description = "Name for the VPC"
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

variable "nat_gateway_id" {
  description = "ID of the NAT Gateway for the private subnet"
  default = ""
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

variable "ngw_name" {
  description = "Name for the NAT Gateway"
}

variable "ngw_eip_name" {
  description = "Name for the NAT Gateway EIP"
}