resource "aws_kinesis_firehose_delivery_stream" "default" {
  name        = var.name
  destination = var.destination
  tags        = var.tags

  server_side_encryption {
    enabled  = var.ssm_enabled
    key_type = var.key_type
    key_arn  = var.key_arn
  }

  extended_s3_configuration {
    bucket_arn         = var.bucket_arn
    buffer_interval    = var.buffer_interval
    buffer_size        = var.buffer_size
    compression_format = var.compression_format
    kms_key_arn        = var.s3_kms_key_arn
    role_arn           = var.role_arn
    s3_backup_mode     = var.s3_backup_mode

    cloudwatch_logging_options {
      enabled         = var.cloudwatch_logging_enabled
      log_group_name  = var.log_group_name
      log_stream_name = var.log_stream_name
    }
  }
}
