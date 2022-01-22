resource "aws_cloudwatch_log_metric_filter" "default" {
  count          = length(var.pattern)
  name           = length(var.metric_transformation_name) > 0 ? var.metric_transformation_name[count.index] : var.name
  pattern        = var.pattern[count.index]
  log_group_name = var.log_group_name

  metric_transformation {
    name          = var.metric_transformation_name[count.index]
    namespace     = var.metric_transformation_namespace
    value         = var.metric_transformation_value
    default_value = var.metric_transformation_default_value
  }
}
