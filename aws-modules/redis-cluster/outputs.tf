output "id" {
  description = "Redis cluster ID."
  value       = aws_elasticache_replication_group.redis-cluster.id
}

output "endpoint" {
  description = "Endpoint for Redis cluster."
  value       = aws_elasticache_replication_group.redis-cluster.primary_endpoint_address
}
