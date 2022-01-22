# AWS SNS + PagerDuty module

Terraform module that integrate PagerDuty to SNS topic. Since Pagerduty endpoint is considered sensitive this value should be in Parameter Store or in other service used to store sensitive data.

## Examples

```hcl
module "sns-pagerduty" {
  source  = "pagerduty"

  ssm_pd_endpoint   = "/PagerDuty/endpoint"
  sns_topic_arn     = SNS_TOPIC_ARN
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| sns\_topic\_arn | The ARN of SNS topic to be used | `string` | `""` | yes |
| ssm\_pd\_endpoint | PagerDuty endpoint in Parameter store | `string` | `""` | yes |

## Outputs

No output.

