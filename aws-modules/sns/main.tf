
resource "aws_sns_topic" "this" {
  count             = var.enabled ? 1 : 0
  name              = var.name
  display_name      = var.display_name
  kms_master_key_id = var.kms_master_key_id
  policy            = var.policy
  delivery_policy   = var.delivery_policy
  tags              = var.tags
}
