resource "aws_kms_key" "default" {
  count                    = var.enabled ? 1 : 0
  deletion_window_in_days  = var.deletion_window_in_days
  enable_key_rotation      = var.enable_key_rotation
  policy                   = var.policy
  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  is_enabled               = var.is_enabled
  tags                     = var.tags
  description              = var.description
}

resource "aws_kms_alias" "default" {
  count         = var.enabled ? 1 : 0
  name          = format("alias/%s", var.name)
  target_key_id = join("", aws_kms_key.default.*.id)
}
