output "alarm_id" {
  description = "IDs of Cloudwatch alarms"
  value       = values(aws_cloudwatch_metric_alarm.main)[*]["id"]
}

output "alarm_arn" {
  description = "ARNs of Cloudwatch alarms"
  value       = values(aws_cloudwatch_metric_alarm.main)[*]["arn"]
}
