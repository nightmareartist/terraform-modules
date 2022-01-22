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

variable "container_definitions" {
  description = "Task container definitions"
  type        = string
  default     = ""
}

variable "network_mode" {
  description = "(Optional) The Docker networking mode to use for the containers in the task. The valid values are none, bridge, awsvpc, and host"
  type        = string
  default     = "bridge"
}

variable "schedule_expression" {
  description = "Schedule expression (cron) for when to run task"
  type        = string
}

variable "cluster_arn" {
  description = "ARN of cluster on which to run task"
  type        = string
}

variable "cluster_name" {
  description = "Name of cluster on which to run task"
  type        = string
}

variable "task_count" {
  description = "Number of tasks to run"
  type        = string
  default     = 1
}

variable "launch_type" {
  description = "(Optional) Specifies the launch type on which your task is running. The launch type that you specify here must match one of the launch type (compatibilities) of the target task. Valid values are EC2 or FARGATE"
  type        = string
  default     = ""
}

variable "cpu" {
  description = "The number of cpu units used by the task"
  type        = string
}

variable "memory" {
  description = "The amount (in MiB) of memory used by the task"
  type        = string
}

variable "subnets" {
  description = "Subnet IDs"
  type        = list(string)
}

variable "security_groups" {
  description = "Security group IDs to allow in Service `network_configuration`"
  type        = list(string)
  default     = []
}

variable "assign_public_ip" {
  description = "Assign a public IP address to the ENI (Fargate launch type only). Valid values are `true` or `false`. Default `false`"
  type        = bool
  default     = false
}

### Custom exec role variables
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
