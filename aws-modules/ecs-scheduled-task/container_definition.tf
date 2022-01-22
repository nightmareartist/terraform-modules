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