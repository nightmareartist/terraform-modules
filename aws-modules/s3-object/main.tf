resource "aws_s3_bucket_object" "default" {
  count = var.enabled ? 1 : 0

  bucket                        = var.bucket
  acl                           = var.acl
  key                           = var.key
  source                        = var.object_source
  etag                          = var.etag
  kms_key_id                    = var.kms_key_id
  object_lock_legal_hold_status = var.object_lock_legal_hold_status

  lifecycle {
    ignore_changes = [
      object_lock_mode,
      object_lock_retain_until_date
    ]
  }
}
