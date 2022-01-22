data "aws_region" "current" {}

resource "random_string" "config_suffix" {
  count   = var.enabled ? 1 : 0
  length  = 12
  number  = false
  upper   = false
  special = false
  lower   = true
}

data "local_file" "msk_config" {
  filename = var.config_file
}

resource "aws_msk_configuration" "default" {
  count = var.enabled && var.enable_custom_config ? 1 : 0

  kafka_versions = [
    var.kafka_version
  ]
  name = "mskconfig-${join("", random_string.config_suffix.*.result)}"

  server_properties = data.local_file.msk_config.content
}

resource "aws_msk_cluster" "default" {
  count = var.enabled ? 1 : 0

  cluster_name           = var.name
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes
  enhanced_monitoring    = var.enhanced_monitoring

  broker_node_group_info {
    instance_type   = var.instance_type
    ebs_volume_size = var.ebs_volume_size
    client_subnets  = var.client_subnets
    security_groups = var.security_groups
  }

  configuration_info {
    arn      = length(var.msk_configuration_arn) > 0 ? var.msk_configuration_arn : aws_msk_configuration.default[count.index].arn
    revision = var.msk_configuration_revision > 0 ? var.msk_configuration_revision : aws_msk_configuration.default[count.index].latest_revision
  }

  dynamic "client_authentication" {
    for_each = var.client_sasl_auth_enabled ? [1] : []

    content {
      sasl {
        scram = var.sasl_scram
      }
    }
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = var.kms_key_arn

    encryption_in_transit {
      client_broker = var.encryption_in_transit_client_broker
      in_cluster    = var.encryption_in_transit_in_cluster
    }
  }

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = var.logging_info_cloudwatch_logs_enabled
        log_group = var.logging_info_cloudwatch_logs_log_group
      }
      firehose {
        enabled         = var.logging_info_firehose_enabled
        delivery_stream = var.logging_info_firehose_delivery_stream
      }
      s3 {
        enabled = var.logging_info_s3_enabled
        bucket  = var.logging_info_s3_bucket
        prefix  = var.logging_info_s3_prefix
      }
    }
  }

  tags = var.tags
}
