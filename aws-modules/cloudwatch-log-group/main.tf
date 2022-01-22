# Create CloudWatch log group
resource "aws_cloudwatch_log_group" "ecs-logs" {
  count             = var.enabled ? 1 : 0
  name              = var.name
  retention_in_days = var.retention_in_days
  tags              = var.tags
}

module "aws_cloudwatch_log_export" {
  count     = var.s3_bucket == "" ? 0 : 1
  source    = "../../modules/cloudwatch-logs-exporter"
  name      = module.label.id
  log_group = module.label.id
  s3_bucket = var.s3_bucket
  schedule  = var.cloudwatch_logs_exporter_schedule
}
