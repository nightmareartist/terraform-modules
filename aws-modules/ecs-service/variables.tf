variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  type        = bool
  default     = true
}

variable "name" {
  description = "Solution name, e.g. 'app' or 'jenkins'"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Default tags"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "The VPC ID where resources are created"
  type        = string
}

variable "alb_security_group" {
  description = "Security group of the ALB"
  type        = string
  default     = ""
}

variable "ecs_cluster_arn" {
  description = "The ARN of the ECS cluster where service will be provisioned"
  type        = string
}

variable "ecs_load_balancers" {
  description = "A list of load balancer config objects for the ECS service; see `load_balancer` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html"
  type = list(object({
    container_name   = string
    container_port   = number
    elb_name         = string
    target_group_arn = string
  }))
  default = []
}

variable "container_port" {
  description = "The port on the container to allow via the ingress security group"
  type        = number
  default     = 80
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security group IDs to allow in Service `network_configuration`"
  type        = list(string)
  default     = []
}

variable "launch_type" {
  description = "The launch type on which to run your service. Valid values are `EC2` and `FARGATE`"
  type        = string
  default     = ""
}

variable "platform_version" {
  description = "The platform version on which to run your service. Only applicable for launch_type set to FARGATE. More information about Fargate platform versions can be found in the AWS ECS User Guide."
  type        = string
  default     = "LATEST"
}

variable "scheduling_strategy" {
  description = "The scheduling strategy to use for the service. The valid values are REPLICA and DAEMON. Note that Fargate tasks do not support the DAEMON scheduling strategy."
  type        = string
  default     = "REPLICA"
}

variable "ordered_placement_strategy" {
  description = "Service level strategy rules that are taken into consideration during task placement. List from top to bottom in order of precedence. The maximum number of ordered_placement_strategy blocks is 5. See `ordered_placement_strategy` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html#ordered_placement_strategy-1"
  type = list(object({
    type  = string
    field = string
  }))
  default = []
}

variable "task_placement_constraints" {
  description = "A set of placement constraints rules that are taken into consideration during task placement. Maximum number of placement_constraints is 10. See `placement_constraints` docs https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#placement-constraints-arguments"
  type = list(object({
    type       = string
    expression = string
  }))
  default = []
}

variable "service_placement_constraints" {
  description = "The rules that are taken into consideration during task placement. Maximum number of placement_constraints is 10. See `placement_constraints` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html#placement_constraints-1"
  type = list(object({
    type       = string
    expression = string
  }))
  default = []
}

variable "network_mode" {
  description = "The network mode to use for the task. This is required to be `awsvpc` for `FARGATE` `launch_type`"
  type        = string
  default     = "awsvpc"
}

variable "task_cpu" {
  description = "The number of CPU units used by the task. If using `FARGATE` launch type `task_cpu` must match supported memory values (https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_size)"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "The amount of memory (in MiB) used by the task. If using Fargate launch type `task_memory` must match supported cpu value (https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_size)"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "The number of instances of the task definition to place and keep running"
  type        = number
  default     = 1
}

variable "deployment_controller_type" {
  description = "Type of deployment controller. Valid values are `CODE_DEPLOY` and `ECS`"
  type        = string
  default     = "ECS"
}

variable "deployment_maximum_percent" {
  description = "The upper limit of the number of tasks (as a percentage of `desired_count`) that can be running in a service during a deployment"
  type        = number
  default     = 200
}

variable "deployment_minimum_healthy_percent" {
  description = "The lower limit (as a percentage of `desired_count`) of the number of tasks that must remain running and healthy in a service during a deployment"
  type        = number
  default     = 100
}

variable "health_check_grace_period_seconds" {
  description = "Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 7200. Only valid for services configured to use load balancers"
  type        = number
  default     = 0
}

variable "volumes" {
  description = "Task volume definitions as list of configuration objects"
  type = list(object({
    host_path = string
    name      = string
    docker_volume_configuration = list(object({
      autoprovision = bool
      driver        = string
      driver_opts   = map(string)
      labels        = map(string)
      scope         = string
    }))
  }))
  default = []
}

variable "proxy_configuration" {
  description = "The proxy configuration details for the App Mesh proxy. See `proxy_configuration` docs https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#proxy-configuration-arguments"
  type = object({
    type           = string
    container_name = string
    properties     = map(string)
  })
  default = null
}

variable "ignore_changes_task_definition" {
  description = "Whether to ignore changes in container definition and task definition in the ECS service"
  type        = bool
  default     = true
}

variable "assign_public_ip" {
  description = "Assign a public IP address to the ENI (Fargate launch type only). Valid values are `true` or `false`. Default `false`"
  type        = bool
  default     = false
}

variable "propagate_tags" {
  description = "Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are SERVICE and TASK_DEFINITION"
  type        = string
  default     = null
}

variable "service_registries" {
  description = "The service discovery registries for the service. The maximum number of service_registries blocks is 1. The currently supported service registry is Amazon Route 53 Auto Naming Service - `aws_service_discovery_service`; see `service_registries` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html#service_registries-1"
  type = list(object({
    registry_arn   = string
    port           = number
    container_name = string
    container_port = number
  }))
  default = []
}

variable "use_alb_security_group" {
  description = "A flag to enable/disable adding the ingress rule to the ALB security group"
  type        = bool
  default     = false
}

### Custom task & exec variables
variable "custom_task_policy_enabled" {
  description = "Enable custom policies for task role"
  type        = bool
  default     = false
}

variable "custom_task_policy_statement" {
  description = "Content of the custom IAM policy"
  type        = any
  default     = []
}

variable "custom_exec_policy_enabled" {
  description = "Enable custom policies for exec role"
  type        = bool
  default     = false
}

variable "custom_exec_policy_statement" {
  description = "Content of the custom IAM policy"
  type        = any
  default     = []
}

### Capacity provider
variable "capacity_provider_strategy" {
  description = "Use capacity provider"
  type        = any
  default     = []
}

### Container definition variables
variable "container_name" {
  description = "The name of the container. Up to 255 characters ([a-z], [A-Z], [0-9], -, _ allowed)"
  type        = string
  default     = ""
}

variable "image_repo" {
  description = "Repository containing images for this service"
  type        = string
  default     = ""
}

variable "image_tag" {
  description = "Tag for the image to be used for this service"
  type        = string
  default     = "latest"
}

variable "container_memory" {
  description = "The amount of memory (in MiB) to allow the container to use. This is a hard limit, if the container attempts to exceed the container_memory, the container is killed. This field is optional for Fargate launch type and the total amount of container_memory of all containers in a task will need to be lower than the task memory value"
  type        = number
  default     = 256
}

variable "container_memory_reservation" {
  description = "The amount of memory (in MiB) to reserve for the container. If container needs to exceed this threshold, it can do so up to the set container_memory hard limit"
  type        = number
  default     = 128
}

variable "port_mappings" {
  description = "The port mappings to configure for the container. This is a list of maps. Each map should contain \"containerPort\", \"hostPort\", and \"protocol\", where \"protocol\" is one of \"tcp\" or \"udp\". If using containers in a task with the awsvpc or host network mode, the hostPort can either be left blank or set to the same value as the containerPort"
  type = list(object({
    containerPort = number
    hostPort      = number
    protocol      = string
  }))
  default = []
}

# https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_HealthCheck.html
variable "healthcheck" {
  description = "A map containing command (string), timeout, interval (duration in seconds), retries (1-10, number of times to retry before marking container unhealthy), and startPeriod (0-300, optional grace period to wait, in seconds, before failed healthchecks count toward retries)"
  type = object({
    command     = list(string)
    retries     = number
    timeout     = number
    interval    = number
    startPeriod = number
  })
  default = null
}

variable "container_cpu" {
  description = "The number of cpu units to reserve for the container. This is optional for tasks using Fargate launch type and the total amount of container_cpu of all containers in a task will need to be lower than the task-level cpu value"
  type        = number
  default     = 256
}

variable "essential" {
  description = "Determines whether all other containers in a task are stopped, if this container fails or stops for any reason. Due to how Terraform type casts booleans in json it is required to double quote this value"
  type        = bool
  default     = true
}

variable "entrypoint" {
  description = "The entry point that is passed to the container"
  type        = list(string)
  default     = null
}

variable "command" {
  description = "The command that is passed to the container"
  type        = list(string)
  default     = null
}

variable "working_directory" {
  description = "The working directory to run commands inside the container"
  type        = string
  default     = null
}

variable "env_vars" {
  description = "The environment variables to pass to the container. This is a list of maps"
  type = list(object({
    name  = string
    value = string
  }))
  default = null
}

variable "secrets" {
  description = "The secrets to pass to the container. This is a list of maps"
  type = list(object({
    name      = string
    valueFrom = string
  }))
  default = null
}

variable "readonly_root_filesystem" {
  description = "Determines whether a container is given read-only access to its root filesystem. Due to how Terraform type casts booleans in json it is required to double quote this value"
  type        = bool
  default     = false
}

# https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LogConfiguration.html
variable "log_configuration" {
  description = "Log configuration options to send to a custom log driver for the container. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_LogConfiguration.html"
  type = object({
    logDriver = string
    options   = map(string)
    secretOptions = list(object({
      name      = string
      valueFrom = string
    }))
  })
  default = null
}

# https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_FirelensConfiguration.html
variable "firelens_configuration" {
  description = "The FireLens configuration for the container. This is used to specify and configure a log router for container logs. For more details, see https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_FirelensConfiguration.html"
  type = object({
    type    = string
    options = map(string)
  })
  default = null
}

variable "mount_points" {
  description = "Container mount points. This is a list of maps, where each map should contain a `containerPath` and `sourceVolume`"
  type = list(object({
    containerPath = string
    sourceVolume  = string
  }))

  default = null
}

variable "dns_servers" {
  description = "Container DNS servers. This is a list of strings specifying the IP addresses of the DNS servers"
  type        = list(string)
  default     = null
}

variable "ulimits" {
  description = "Container ulimit settings. This is a list of maps, where each map should contain \"name\", \"hardLimit\" and \"softLimit\""
  type = list(object({
    name      = string
    hardLimit = number
    softLimit = number
  }))
  default = null
}

variable "repository_credentials" {
  description = "Container repository credentials; required when using a private repo.  This map currently supports a single key; \"credentialsParameter\", which should be the ARN of a Secrets Manager's secret holding the credentials"
  type        = map(string)
  default     = null
}

variable "volumes_from" {
  description = "A list of VolumesFrom maps which contain \"sourceContainer\" (name of the container that has the volumes to mount) and \"readOnly\" (whether the container can write to the volume)"
  type = list(object({
    sourceContainer = string
    readOnly        = bool
  }))
  default = null
}

variable "links" {
  description = "List of container names this container can communicate with without port mappings"
  type        = list(string)
  default     = null
}

variable "user" {
  description = "The user to run as inside the container. Can be any of these formats: user, user:group, uid, uid:gid, user:gid, uid:group"
  type        = string
  default     = null
}

variable "container_depends_on" {
  description = "The dependencies defined for container startup and shutdown. A container can contain multiple dependencies. When a dependency is defined for container startup, for container shutdown it is reversed"
  type        = list(string)
  default     = null
}

variable "docker_labels" {
  description = "The configuration options to send to the `docker_labels`"
  type        = map(string)
  default     = null
}

variable "start_timeout" {
  description = "Time duration (in seconds) to wait before giving up on resolving dependencies for a container"
  type        = number
  default     = 30
}

variable "stop_timeout" {
  description = "Time duration (in seconds) to wait before the container is forcefully killed if it doesn't exit normally on its own"
  type        = number
  default     = 30
}

variable "privileged" {
  description = "When this variable is `true`, the container is given elevated privileges on the host container instance (similar to the root user). This parameter is not supported for Windows containers or tasks using the Fargate launch type. Due to how Terraform type casts booleans in json it is required to double quote this value"
  type        = string
  default     = null
}

variable "system_controls" {
  description = "A list of namespaced kernel parameters to set in the container, mapping to the --sysctl option to docker run. This is a list of maps: { namespace = \"\", value = \"\"}"
  type        = list(map(string))
  default     = null
}

### Cloudwatch variables
variable "create_log_group" {
  description = "Decide whether to create or not log group."
  type        = bool
  default     = true
}
variable "log_group" {
  description = "CloudWatch log group for this service"
  type        = string
  default     = ""
}

variable "retention_in_days" {
  description = "Retention time frame for CloudWatch logs"
  type        = number
  default     = 30
}
