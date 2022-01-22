output "ssm_item" {
  description = "SSM parameter ARN"
  value       = aws_ssm_parameter.default.arn
}

output "ssm_name" {
  description = "SSM parameter ARN"
  value       = aws_ssm_parameter.default.name
}

output "ssm_value" {
  description = "SSM parameter value"
  sensitive   = true
  value       = aws_ssm_parameter.default.value
}
