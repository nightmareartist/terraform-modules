# Create Redis cluster
resource "aws_elasticache_parameter_group" "default" {
  name        = var.name
  family      = var.family
  description = var.description
  tags        = var.tags

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name  = lookup(parameter.value, "name", null)
      value = lookup(parameter.value, "value", null)
    }
  }
}
