output "ecs_cluster_id" {
  value = join("", aws_ecs_cluster.this.*.id)
}

output "ecs_cluster_arn" {
  value = join("", aws_ecs_cluster.this.*.arn)
}

output "ecs_cluster_name" {
  value = join("", aws_ecs_cluster.this.*.name)
}

output "ecs_capacity_provider" {
  value = join("", aws_ecs_capacity_provider.default.*.name)
}