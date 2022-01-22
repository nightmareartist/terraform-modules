# Setup PagerDuty
data "aws_ssm_parameter" "pd_endpoint" {
  count = length(var.ssm_pd_endpoint) > 0 ? 1 : 0
  name  = var.ssm_pd_endpoint
}

resource "aws_sns_topic_subscription" "pagerduty" {
  count                  = length(var.ssm_pd_endpoint) > 0 ? 1 : 0
  endpoint               = join("", data.aws_ssm_parameter.pd_endpoint.*.value)
  endpoint_auto_confirms = true
  protocol               = "https"
  topic_arn              = var.sns_topic_arn
}
