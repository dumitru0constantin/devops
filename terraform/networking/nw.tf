provider "aws" {
  region = var.region
}

# VPC
resource "aws_vpc" "DevOps_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.DevOps_vpc.id

  tags = {
    Name = var.igw_name
  }
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.DevOps_vpc.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.public_subnet_az

  tags = {
    Name = var.public_subnet_name
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.DevOps_vpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.private_subnet_az

  tags = {
    Name = var.private_subnet_name
  }
}

# Route Table for Public Subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.DevOps_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.public_rt_name
  }
}

# Route Table Association for Public Subnet

resource "aws_route_table_association" "public_rt_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# Route Table for Private Subnet
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.DevOps_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = var.private_rt_name
  }
}

# Route Table Association for Private Subnet

resource "aws_route_table_association" "private_rt_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

#locals {
#  public_subnet_id = aws_subnet.public_subnet.id
#}

# NAT Gateway
resource "aws_nat_gateway" "ngw" {
  connectivity_type = "public"
  #subnet_id     = local.private_subnet_id
  subnet_id     = aws_subnet.public_subnet.id 
  allocation_id = aws_eip.ngw.id
  tags = {
    Name = var.ngw_name
  }
}

resource "aws_eip" "ngw" {
  domain = "vpc"

  tags = {
    Name = var.ngw_eip_name
  }
}
