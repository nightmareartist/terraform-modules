#### ECS Container definition module

This module is used to create container definition. It is a forked version of [terraform-aws-ecs-container-definition](https://github.com/cloudposse/terraform-aws-ecs-container-definition.git) with adjustments to fit our needs. This module dumps JSON formatted data which can then be used to create ECS services. It also triggers creation of CloudWatch group for containers.

This is what Terragrunt inputs should look like for this module to create proper JSON data:

```sh 
inputs = {
  # CloudWatch vars
  log_group = "/ecs/some_path"
  retention_in_days = 30

  # Service vars
  container_name = "my-srv"
  image_repo = "my-registry-url"  # usually output of ECR module
  image_tag = "latest"
  essential = true
  container_cpu         = 1024
  container_memory      = 2048
  environment = "production"
  log_configuration = {
    logDriver = "awslogs"
    options = {
      "awslogs-group"         = "/ecs/some_path"
      "awslogs-region"        = "us-east-1",
      "awslogs-stream-prefix" = "ecs"
    }
    secretOptions = null
  }
  port_mappings = [
    {
      containerPort : 8080,
      hostPort : 8080,
      protocol : "tcp"
    },
    {
      containerPort : 9090,
      hostPort : 9090,
      protocol : "tcp"
    }
  ]
  environment = [
  {
      name : "ENV",
      value : "production"
    },
    {
      name : "SOME_VARIABLE",
      value : "SOME_VALUE"
    },
  ]

  secrets = [
    {
      valueFrom : "very-secret-thing-in-ssm",
      name : "name-in-ssm"
    },  
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| command | The command that is passed to the container | `list(string)` | n/a | yes |
| container\_cpu | The number of cpu units to reserve for the container. This is optional for tasks using Fargate launch type and the total amount of container\_cpu of all containers in a task will need to be lower than the task-level cpu value | `number` | `256` | no |
| container\_depends\_on | The dependencies defined for container startup and shutdown. A container can contain multiple dependencies. When a dependency is defined for container startup, for container shutdown it is reversed | `list(string)` | n/a | yes |
| container\_memory | The amount of memory (in MiB) to allow the container to use. This is a hard limit, if the container attempts to exceed the container\_memory, the container is killed. This field is optional for Fargate launch type and the total amount of container\_memory of all containers in a task will need to be lower than the task memory value | `number` | `256` | no |
| container\_memory\_reservation | The amount of memory (in MiB) to reserve for the container. If container needs to exceed this threshold, it can do so up to the set container\_memory hard limit | `number` | `128` | no |
| container\_name | The name of the container. Up to 255 characters ([a-z], [A-Z], [0-9], -, \_ allowed) | `string` | n/a | yes |
| create\_log\_group | Decide whether to create or not log group. | `bool` | `true` | no |
| dns\_servers | Container DNS servers. This is a list of strings specifying the IP addresses of the DNS servers | `list(string)` | n/a | yes |
| docker\_labels | The configuration options to send to the `docker_labels` | `map(string)` | n/a | yes |
| entrypoint | The entry point that is passed to the container | `list(string)` | n/a | yes |
| env\_vars | The environment variables to pass to the container. This is a list of maps | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))<br></pre> | n/a | yes |
| environment | environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| essential | Determines whether all other containers in a task are stopped, if this container fails or stops for any reason. Due to how Terraform type casts booleans in json it is required to double quote this value | `bool` | `true` | no |
| firelens\_configuration | The FireLens configuration for the container. This is used to specify and configure a log router for container logs. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_FirelensConfiguration.html | <pre>object({<br>    type    = string<br>    options = map(string)<br>  })<br></pre> | n/a | yes |
| healthcheck | A map containing command (string), timeout, interval (duration in seconds), retries (1-10, number of times to retry before marking container unhealthy), and startPeriod (0-300, optional grace period to wait, in seconds, before failed healthchecks count toward retries) | <pre>object({<br>    command     = list(string)<br>    retries     = number<br>    timeout     = number<br>    interval    = number<br>    startPeriod = number<br>  })<br></pre> | n/a | yes |
| image\_repo | Repository containing images for this service | `string` | `""` | no |
| image\_tag | Tag for the image to be used for this service | `string` | `"latest"` | no |
| links | List of container names this container can communicate with without port mappings | `list(string)` | n/a | yes |
| log\_configuration | Log configuration options to send to a custom log driver for the container. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LogConfiguration.html | <pre>object({<br>    logDriver = string<br>    options   = map(string)<br>    secretOptions = list(object({<br>      name      = string<br>      valueFrom = string<br>    }))<br>  })<br></pre> | n/a | yes |
| log\_group | CloudWatch log group for this service | `string` | `""` | no |
| mount\_points | Container mount points. This is a list of maps, where each map should contain a `containerPath` and `sourceVolume` | <pre>list(object({<br>    containerPath = string<br>    sourceVolume  = string<br>  }))<br></pre> | n/a | yes |
| name | Service name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| port\_mappings | The port mappings to configure for the container. This is a list of maps. Each map should contain "containerPort", "hostPort", and "protocol", where "protocol" is one of "tcp" or "udp". If using containers in a task with the awsvpc or host network mode, the hostPort can either be left blank or set to the same value as the containerPort | <pre>list(object({<br>    containerPort = number<br>    hostPort      = number<br>    protocol      = string<br>  }))<br></pre> | <pre>[<br>  {<br>    "containerPort": 80,<br>    "hostPort": 80,<br>    "protocol": "tcp"<br>  }<br>]<br></pre> | no |
| privileged | When this variable is `true`, the container is given elevated privileges on the host container instance (similar to the root user). This parameter is not supported for Windows containers or tasks using the Fargate launch type. Due to how Terraform type casts booleans in json it is required to double quote this value | `string` | n/a | yes |
| readonly\_root\_filesystem | Determines whether a container is given read-only access to its root filesystem. Due to how Terraform type casts booleans in json it is required to double quote this value | `bool` | `false` | no |
| repository\_credentials | Container repository credentials; required when using a private repo.  This map currently supports a single key; "credentialsParameter", which should be the ARN of a Secrets Manager's secret holding the credentials | `map(string)` | n/a | yes |
| retention\_in\_days | Retention time frame for CloudWatch logs | `number` | `30` | no |
| secrets | The secrets to pass to the container. This is a list of maps | <pre>list(object({<br>    name      = string<br>    valueFrom = string<br>  }))<br></pre> | n/a | yes |
| start\_timeout | Time duration (in seconds) to wait before giving up on resolving dependencies for a container | `number` | `30` | no |
| stop\_timeout | Time duration (in seconds) to wait before the container is forcefully killed if it doesn't exit normally on its own | `number` | `30` | no |
| system\_controls | A list of namespaced kernel parameters to set in the container, mapping to the --sysctl option to docker run. This is a list of maps: { namespace = "", value = ""} | `list(map(string))` | n/a | yes |
| tags | Default VPC tags. | `map(string)` | <pre>{<br>  "Environment": "development",<br>  "Terraform": "true"<br>}<br></pre> | no |
| ulimits | Container ulimit settings. This is a list of maps, where each map should contain "name", "hardLimit" and "softLimit" | <pre>list(object({<br>    name      = string<br>    hardLimit = number<br>    softLimit = number<br>  }))<br></pre> | n/a | yes |
| user | The user to run as inside the container. Can be any of these formats: user, user:group, uid, uid:gid, user:gid, uid:group | `string` | n/a | yes |
| volumes\_from | A list of VolumesFrom maps which contain "sourceContainer" (name of the container that has the volumes to mount) and "readOnly" (whether the container can write to the volume) | <pre>list(object({<br>    sourceContainer = string<br>    readOnly        = bool<br>  }))<br></pre> | n/a | yes |
| working\_directory | The working directory to run commands inside the container | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| json | JSON encoded list of container definitions for use with other terraform resources such as aws\_ecs\_task\_definition |
| json\_map | JSON encoded container definitions for use with other terraform resources such as aws\_ecs\_task\_definition |

