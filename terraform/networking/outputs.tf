# Output VPC ID and Subnet IDs
output "vpc_id" {
  value = aws_vpc.DevOps_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

