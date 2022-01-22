## ECS scheduled task module

This module is used to schedule tasks on ECS (similar to crontab).

This module will setup needed IAM roles for ECS and CloudWatch. It does that per task so no role overlapping.

Bare minimum for Terragrunt inputs:

```
  name                    = "my-task-job"
  environment             = "prod"
  container_definitions   = my-container-definition.json
  schedule_expression     = "cron(0 12 * * ? *)"
  cluster_arn             = my-cluster-arn
  cluster_name            = my-cluster-name
  cpu                     = "256"
  memory                  = "512"
  subnets                 = my-private-subnets
  security_groups         = [my-security-group-ids]
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| cluster\_arn | ARN of cluster on which to run task | `string` | n/a | yes |
| cluster\_name | Name of cluster on which to run task | `string` | n/a | yes |
| container\_definitions | Task container definitions | `string` | n/a | yes |
| cpu | The number of cpu units used by the task | `string` | n/a | yes |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| environment | environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| memory | The amount (in MiB) of memory used by the task | `string` | n/a | yes |
| name | Service name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| schedule\_expression | Schedule expression (cron) for when to run task | `string` | n/a | yes |
| security\_groups | Which security groups for task | `list(string)` | n/a | yes |
| subnets | Which VPC subnets to run on | `list(string)` | n/a | yes |
| tags | Default tags | `map(string)` | <pre>{<br>  "Environment": "development",<br>  "Terraform": "true"<br>}<br></pre> | no |
| task\_count | Number of tasks to run | `string` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| scheduled\_task\_arn | n/a |

