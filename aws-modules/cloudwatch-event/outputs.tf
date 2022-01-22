output "arn" {
  value       = join("", aws_cloudwatch_event_rule.default.*.arn)
  description = "The Amazon Resource Name (ARN) of the rule"
}

output "id" {
  value       = join("", aws_cloudwatch_event_rule.default.*.id)
  description = "The name of the rule"
}
