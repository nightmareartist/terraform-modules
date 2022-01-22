resource "aws_cloudwatch_metric_alarm" "main" {
  for_each                  = var.metric_alarms
  actions_enabled           = lookup(each.value, "actions_enabled", true)
  alarm_actions             = var.alarm_actions
  alarm_description         = each.value.alarm_description
  alarm_name                = format("%s-%s", var.name, each.value.alarm_name)
  comparison_operator       = each.value.comparison_operator
  datapoints_to_alarm       = lookup(each.value, "datapoints_to_alarm", null)
  dimensions                = lookup(each.value, "dimensions", null)
  evaluation_periods        = each.value.evaluation_periods
  insufficient_data_actions = var.alarm_actions
  metric_name               = each.value.metric_name
  namespace                 = each.value.namespace
  ok_actions                = var.alarm_actions_ok
  period                    = each.value.period
  statistic                 = each.value.statistic
  tags                      = module.label.tags
  threshold                 = each.value.threshold
  treat_missing_data        = each.value.treat_missing_data
}
