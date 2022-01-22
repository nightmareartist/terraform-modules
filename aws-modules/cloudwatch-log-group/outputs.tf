# Export log group name
output "log_group" {
  value = aws_cloudwatch_log_group.ecs-logs[0].name
}

# Export log group ARN
output "log_group_arn" {
  value = aws_cloudwatch_log_group.ecs-logs[0].arn
}
