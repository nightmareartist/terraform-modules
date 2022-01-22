## ECS Services module

This module creates an ECS service.

Terragrunt HCL code sample:

```
  enabled = true
  name    = "my-service"

  # Task definition variables
  container_definition_json = dependency.container-definition.outputs.json
  launch_type               = "FARGATE"
  task_cpu                  = 512
  task_memory               = 1024

  # ECS service variables
  vpc_id                             = dependency.vpc.outputs.vpc_id
  ecs_cluster_arn                    = dependency.ecs-cluster.outputs.ecs_cluster_arn
  desired_count                      = 1
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  ecs_load_balancers = [
    {
      elb_name         = null
      target_group_arn = dependency.pwa-alb.outputs.target_group_arns[2]
      container_name   = "my-service"
      container_port   = 3001
    },
  ]
  subnet_ids = dependency.vpc.outputs.private_subnets
  security_group_ids = [
    dependency.my-security-group.outputs.this_security_group_id,
  ]
  assign_public_ip = false
```

This module allows usage of custom IAM policies for both execution and task roles, depending when the service needs access to other resources. All the services get the default access rights which are just enough to run a service. These permissions are the same across all the services. However, if service needs access to specific resources these custom permission should be used. For task role use the following:

```
  # Custom task policy
  custom_task_policy_enabled = true
  custom_task_policy_statement = [
    {
      actions = [
        "s3:PutObject"
      ]
      effect = "Allow"
      resources = [
        "arn:aws:s3:::my-bucket",
        "arn:aws:s3:::my-bucket/*"
      ]

    }
  ]
```

For execution role use the following:

```
  # Custom exec policy
  custom_exec_policy_enabled = true
  custom_task_policy_statement = [
    {
      actions = [
        "s3:GetObject"
      ]
      effect = "Allow"
      resources = [
        "arn:aws:s3:::my-bucket2",
        "arn:aws:s3:::my-bucket2/*"
      ]

    }
  ]
```

Both can be extended with multiple statement sections `{}`.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| alb\_security\_group | Security group of the ALB | `string` | `""` | no |
| assign\_public\_ip | Assign a public IP address to the ENI (Fargate launch type only). Valid values are `true` or `false`. Default `false` | `bool` | `false` | no |
| container\_definition\_json | The JSON of the task container definition | `string` | n/a | yes |
| container\_port | The port on the container to allow via the ingress security group | `number` | `80` | no |
| custom\_exec\_policy\_enabled | Enable custom policies for exec role | `bool` | `false` | no |
| custom\_exec\_policy\_statement | Content of the custom IAM policy | `any` | `[]` | no |
| custom\_task\_policy\_enabled | Enable custom policies for task role | `bool` | `false` | no |
| custom\_task\_policy\_statement | Content of the custom IAM policy | `any` | `[]` | no |
| deployment\_controller\_type | Type of deployment controller. Valid values are `CODE_DEPLOY` and `ECS` | `string` | `"ECS"` | no |
| deployment\_maximum\_percent | The upper limit of the number of tasks (as a percentage of `desired_count`) that can be running in a service during a deployment | `number` | `200` | no |
| deployment\_minimum\_healthy\_percent | The lower limit (as a percentage of `desired_count`) of the number of tasks that must remain running and healthy in a service during a deployment | `number` | `100` | no |
| desired\_count | The number of instances of the task definition to place and keep running | `number` | `1` | no |
| ecs\_cluster\_arn | The ARN of the ECS cluster where service will be provisioned | `string` | n/a | yes |
| ecs\_load\_balancers | A list of load balancer config objects for the ECS service; see `load_balancer` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html | <pre>list(object({<br>    container_name   = string<br>    container_port   = number<br>    elb_name         = string<br>    target_group_arn = string<br>  }))</pre> | `[]` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| environment | environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| health\_check\_grace\_period\_seconds | Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 7200. Only valid for services configured to use load balancers | `number` | `0` | no |
| ignore\_changes\_task\_definition | Whether to ignore changes in container definition and task definition in the ECS service | `bool` | `true` | no |
| launch\_type | The launch type on which to run your service. Valid values are `EC2` and `FARGATE` | `string` | `"FARGATE"` | no |
| name | Service name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| network\_mode | The network mode to use for the task. This is required to be `awsvpc` for `FARGATE` `launch_type` | `string` | `"awsvpc"` | no |
| ordered\_placement\_strategy | Service level strategy rules that are taken into consideration during task placement. List from top to bottom in order of precedence. The maximum number of ordered\_placement\_strategy blocks is 5. See `ordered_placement_strategy` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html#ordered_placement_strategy-1 | <pre>list(object({<br>    type  = string<br>    field = string<br>  }))</pre> | `[]` | no |
| platform\_version | The platform version on which to run your service. Only applicable for launch\_type set to FARGATE. More information about Fargate platform versions can be found in the AWS ECS User Guide. | `string` | `"LATEST"` | no |
| propagate\_tags | Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are SERVICE and TASK\_DEFINITION | `string` | n/a | yes |
| proxy\_configuration | The proxy configuration details for the App Mesh proxy. See `proxy_configuration` docs https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#proxy-configuration-arguments | <pre>object({<br>    type           = string<br>    container_name = string<br>    properties     = map(string)<br>  })</pre> | n/a | yes |
| scheduling\_strategy | The scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. Note that Fargate tasks do not support the DAEMON scheduling strategy. | `string` | `"REPLICA"` | no |
| security\_group\_ids | Security group IDs to allow in Service `network_configuration` | `list(string)` | `[]` | no |
| service\_placement\_constraints | The rules that are taken into consideration during task placement. Maximum number of placement\_constraints is 10. See `placement_constraints` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html#placement_constraints-1 | <pre>list(object({<br>    type       = string<br>    expression = string<br>  }))</pre> | `[]` | no |
| service\_registries | The service discovery registries for the service. The maximum number of service\_registries blocks is 1. The currently supported service registry is Amazon Route 53 Auto Naming Service - `aws_service_discovery_service`; see `service_registries` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html#service_registries-1 | <pre>list(object({<br>    registry_arn   = string<br>    port           = number<br>    container_name = string<br>    container_port = number<br>  }))</pre> | `[]` | no |
| subnet\_ids | Subnet IDs | `list(string)` | n/a | yes |
| tags | Default tags | `map(string)` | <pre>{<br>  "Environment": "development",<br>  "Terraform": "true"<br>}</pre> | no |
| task\_cpu | The number of CPU units used by the task. If using `FARGATE` launch type `task_cpu` must match supported memory values (https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_size) | `number` | `256` | no |
| task\_memory | The amount of memory (in MiB) used by the task. If using Fargate launch type `task_memory` must match supported cpu value (https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_size) | `number` | `512` | no |
| task\_placement\_constraints | A set of placement constraints rules that are taken into consideration during task placement. Maximum number of placement\_constraints is 10. See `placement_constraints` docs https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#placement-constraints-arguments | <pre>list(object({<br>    type       = string<br>    expression = string<br>  }))</pre> | `[]` | no |
| use\_alb\_security\_group | A flag to enable/disable adding the ingress rule to the ALB security group | `bool` | `false` | no |
| volumes | Task volume definitions as list of configuration objects | <pre>list(object({<br>    host_path = string<br>    name      = string<br>    docker_volume_configuration = list(object({<br>      autoprovision = bool<br>      driver        = string<br>      driver_opts   = map(string)<br>      labels        = map(string)<br>      scope         = string<br>    }))<br>  }))</pre> | `[]` | no |
| vpc\_id | The VPC ID where resources are created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ecs\_exec\_role\_policy\_id | The ECS service role policy ID, in the form of `role_name:role_policy_name` |
| ecs\_exec\_role\_policy\_name | ECS service role name |
| service\_name | ECS Service name |
| service\_role\_arn | ECS Service role ARN |
| task\_definition\_family | ECS task definition family |
| task\_definition\_revision | ECS task definition revision |
| task\_exec\_role\_arn | ECS Task exec role ARN |
| task\_exec\_role\_name | ECS Task role name |
| task\_role\_arn | ECS Task role ARN |
| task\_role\_id | ECS Task role id |
| task\_role\_name | ECS Task role name |

