output "instance_id" {
  description = "EC2 instance id"
  value       = aws_instance.ec2-instance[*].id
}

output "instance_ip" {
  description = "EC2 instance IP"
  value       = aws_instance.ec2-instance[*].public_ip
}

output "instance_public_dns" {
  description = "EC2 instance public DNS"
  value       = aws_instance.ec2-instance[*].public_dns
}
