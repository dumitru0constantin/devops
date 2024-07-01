output "public_ec2_id" {
  value = aws_instance.public_ec2[*].id
}

output "public_ec2_ip" {
  value = aws_instance.public_ec2[*].public_ip
}