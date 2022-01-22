resource "aws_cloudwatch_event_rule" "default" {
  is_enabled          = var.is_enabled
  name                = var.name
  description         = var.description
  schedule_expression = var.schedule_expression
  event_bus_name      = var.event_bus_name
  event_pattern       = var.event_pattern
  role_arn            = var.event_role_arn
}

resource "aws_cloudwatch_event_target" "default" {
  rule = var.name
  arn  = var.event_target_role_arn
}
