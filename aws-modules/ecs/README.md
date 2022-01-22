## ECS module

This is a very simple module that creates an ECS cluster. It takes two variables as inputs:

```sh   
enabled = true
name    = "my-cluster"
```

If capacity provider is to be used (instead of Fargate) then the following variables need to be set:

```
  create_capacity_provider       = true
  auto_scaling_group_arn         = autoscaling.group.arn
  managed_termination_protection = "ENABLED"
  maximum_scaling_step_size      = 2
  minimum_scaling_step_size      = 1
  managed_scaling_status         = "ENABLED"
  target_capacity                = 100
```

See [Deep Dive on Amazon ECS Cluster Auto Scaling](https://aws.amazon.com/blogs/containers/deep-dive-on-amazon-ecs-cluster-auto-scaling/) for details.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auto\_scaling\_group\_arn | Autoscaling group ARN | `string` | `""` | no |
| capacity\_provider\_base | (Optional) The number of tasks, at a minimum, to run on the specified capacity provider. Only one capacity provider in a capacity provider strategy can have a base defined. | `number` | `0` | no |
| capacity\_provider\_weight | (Optional) The relative percentage of the total number of launched tasks that should use the specified capacity provider. | `number` | `0` | no |
| create\_capacity\_provider | Enable usage of capacity provider | `bool` | `false` | no |
| enabled | Controls if ECS should be created | `bool` | `true` | no |
| environment | environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| managed\_scaling\_status | Whether auto scaling is managed by ECS. Valid values are ENABLED and DISABLED | `string` | `"ENABLED"` | no |
| managed\_termination\_protection | Enables or disables container-aware termination of instances in the auto scaling group when scale-in happens. Valid values are ENABLED and DISABLED | `string` | `"ENABLED"` | no |
| maximum\_scaling\_step\_size | The maximum step adjustment size. A number between 1 and 10,000 | `number` | `10` | no |
| minimum\_scaling\_step\_size | The minimum step adjustment size. A number between 1 and 10,000 | `number` | `1` | no |
| name | Service name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| setting\_value | The value to assign to the setting. Value values are enabled and disabled | `string` | `"disabled"` | no |
| tags | Default tags | `map(string)` | <pre>{<br>  "Environment": "development",<br>  "Terraform": "true"<br>}</pre> | no |
| target\_capacity | The target utilization for the capacity provider. A number between 1 and 100 | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| ecs\_capacity\_provider | n/a |
| ecs\_cluster\_arn | n/a |
| ecs\_cluster\_id | n/a |
| ecs\_cluster\_name | n/a |

