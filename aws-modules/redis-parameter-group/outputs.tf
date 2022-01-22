output "name" {
  description = "Redis parameter group name."
  value       = aws_elasticache_parameter_group.default.name
}
