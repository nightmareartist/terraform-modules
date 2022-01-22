resource "aws_ecs_cluster" "this" {
  count              = var.enabled ? 1 : 0
  name               = var.name
  capacity_providers = var.create_capacity_provider ? [aws_ecs_capacity_provider.default[count.index].name] : null

  # This particular for_each is possible because aws_ecs_capacity_provider has a conditional in itself
  dynamic "default_capacity_provider_strategy" {
    for_each = aws_ecs_capacity_provider.default
    content {
      base              = var.capacity_provider_base
      capacity_provider = aws_ecs_capacity_provider.default[count.index].name
      weight            = var.capacity_provider_weight
    }
  }

  setting {
    name  = "containerInsights"
    value = var.setting_value
  }

  tags = var.tags
}
