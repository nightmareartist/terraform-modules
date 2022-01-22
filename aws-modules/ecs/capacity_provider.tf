# Create capacity provider
resource "aws_ecs_capacity_provider" "default" {
  count = var.create_capacity_provider ? 1 : 0
  name  = module.label.id

  auto_scaling_group_provider {
    auto_scaling_group_arn         = var.auto_scaling_group_arn
    managed_termination_protection = var.managed_termination_protection

    managed_scaling {
      maximum_scaling_step_size = var.maximum_scaling_step_size
      minimum_scaling_step_size = var.minimum_scaling_step_size
      status                    = var.managed_scaling_status
      target_capacity           = var.target_capacity
    }
  }

  tags = module.label.tags
}
