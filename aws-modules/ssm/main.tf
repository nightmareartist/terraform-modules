resource "aws_ssm_parameter" "default" {
  name        = var.name
  description = var.description
  key_id      = var.key_id
  overwrite   = var.overwrite
  type        = var.type
  value       = var.value
  tier        = var.tier
  tags        = var.tags

  lifecycle {
    ignore_changes = [value]
  }
}
