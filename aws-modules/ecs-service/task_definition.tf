# Create container definition
module "container_definition" {
  source                       = "../ecs-container-definition"
  container_name               = var.name
  image_repo                   = var.image_repo
  image_tag                    = var.image_tag
  essential                    = var.essential
  entrypoint                   = var.entrypoint
  command                      = var.command
  working_directory            = var.working_directory
  readonly_root_filesystem     = var.readonly_root_filesystem
  mount_points                 = var.mount_points
  dns_servers                  = var.dns_servers
  ulimits                      = var.ulimits
  repository_credentials       = var.repository_credentials
  links                        = var.links
  volumes_from                 = var.volumes_from
  user                         = var.user
  container_depends_on         = var.container_depends_on
  privileged                   = var.privileged
  port_mappings                = var.port_mappings
  healthcheck                  = var.healthcheck
  firelens_configuration       = var.firelens_configuration
  log_configuration            = var.log_configuration
  container_memory             = var.container_memory
  container_memory_reservation = var.container_memory_reservation
  container_cpu                = var.container_cpu
  secrets                      = var.secrets
  docker_labels                = var.docker_labels
  start_timeout                = var.start_timeout
  stop_timeout                 = var.stop_timeout
  system_controls              = var.system_controls
  env_vars                     = var.env_vars
}

# Create a task definition
resource "aws_ecs_task_definition" "default" {
  count                    = var.enabled ? 1 : 0
  family                   = module.label.id
  container_definitions    = module.container_definition.json
  requires_compatibilities = length(var.launch_type) == 0 ? null : [var.launch_type]
  network_mode             = var.network_mode
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = join("", aws_iam_role.ecs_exec.*.arn)
  task_role_arn            = join("", aws_iam_role.ecs_task.*.arn)
  tags                     = var.tags

  dynamic "proxy_configuration" {
    for_each = var.proxy_configuration == null ? [] : [var.proxy_configuration]
    content {
      type           = lookup(proxy_configuration.value, "type", "APPMESH")
      container_name = proxy_configuration.value.container_name
      properties     = proxy_configuration.value.properties
    }
  }

  dynamic "placement_constraints" {
    for_each = var.task_placement_constraints
    content {
      type       = placement_constraints.value.type
      expression = lookup(placement_constraints.value, "expression", null)
    }
  }

  dynamic "volume" {
    for_each = var.volumes
    content {
      host_path = lookup(volume.value, "host_path", null)
      name      = volume.value.name

      dynamic "docker_volume_configuration" {
        for_each = lookup(volume.value, "docker_volume_configuration", [])
        content {
          autoprovision = lookup(docker_volume_configuration.value, "autoprovision", null)
          driver        = lookup(docker_volume_configuration.value, "driver", null)
          driver_opts   = lookup(docker_volume_configuration.value, "driver_opts", null)
          labels        = lookup(docker_volume_configuration.value, "labels", null)
          scope         = lookup(docker_volume_configuration.value, "scope", null)
        }
      }
    }
  }
}
