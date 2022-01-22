output "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = join("", aws_sns_topic.this.*.arn)
}
