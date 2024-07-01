provider "aws" {
  region = var.region
}

resource "aws_key_pair" "DevOps_key" {
  key_name   = var.key_name
  public_key = file(var.public_key)

  tags = {
    Name = var.key_name
  }
}

# Security Group for EC2 in Public Subnet
resource "aws_security_group" "public_sg" {
  name        = var.public_sg_name
  description = "Allow inbound traffic on ports 80, 443, 22"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.public_sg_name
  }

}

# Security Group for EC2 in Private Subnet
resource "aws_security_group" "private_sg" {
  name        = var.private_sg_name
  description = "Allow outbound traffic to the internet via NAT Gateway"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.public_sg.id]
  }

  tags = {
    Name = var.private_sg_name
  }
}

# IAM Instance profile 

resource "aws_iam_instance_profile" "DevOps_instance_profile" {
name = "DevOps_instance_profile"
role = aws_iam_role.DevOps_role.name
}

# IAM Role

resource "aws_iam_role" "DevOps_role" {
name        = "DevOps_role"
description = "The role for the DevOps resources EC2"
assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": {
"Effect": "Allow",
"Principal": {"Service": "ec2.amazonaws.com"},
"Action": "sts:AssumeRole"
}
}
EOF
tags = {
Name = "DevOps-policy"
}
}

# Attach the SSM policy to the role
resource "aws_iam_role_policy_attachment" "DevOps_role_ssm_policy" {
  role       = aws_iam_role.DevOps_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# EC2 Instance in Public Subnet
resource "aws_instance" "public_ec2" {
  count         = var.create_public_instance ? var.public_ec2_number : 0
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  iam_instance_profile = aws_iam_instance_profile.DevOps_instance_profile.name
  key_name = aws_key_pair.DevOps_key.key_name
  associate_public_ip_address = true
  user_data = file("${path.module}/user_data.sh")

  root_block_device {
    volume_type = "gp3"
    volume_size = 8 
    delete_on_termination = true
  }

  tags = {
    Name = "${var.public_ec2_name}-${count.index + 1}"
  }
}

resource "aws_eip" "public_ec2" {
  instance = aws_instance.public_ec2[0].id

  tags = {
    Name = var.public_ec2_eip_name
  }
}

# EC2 Instance in Private Subnet
resource "aws_instance" "private_ec2" {
  count         = var.create_private_instance ? 1 : 0
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  iam_instance_profile = aws_iam_instance_profile.DevOps_instance_profile.name
  key_name = aws_key_pair.DevOps_key.key_name

  tags = {
    Name = var.private_ec2_name
  }
}