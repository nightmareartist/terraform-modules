output "metric_filter_id" {
  description = "The name of the metric filter."
  value       = join("", aws_cloudwatch_log_metric_filter.default.*.id)
}

output "metric_transformation_namespace" {
  description = "Metric transformation namespace."
  value       = element(aws_cloudwatch_log_metric_filter.default[*].metric_transformation[0].namespace, 1)
}

output "metric_transformation_name" {
  description = "Metric transformation name(s)."
  value       = aws_cloudwatch_log_metric_filter.default[*].metric_transformation[0].name
}
