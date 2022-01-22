# Create Elasticashe subnet group
resource "aws_elasticache_subnet_group" "cache-subnetgroup" {
  name        = var.cache_subnet_name
  description = "Redis ${var.name} cache subnet group."
  subnet_ids  = var.cache_subnetgroup
}

# Create Redis cluster
resource "aws_elasticache_replication_group" "redis-cluster" {
  apply_immediately             = var.apply_immediately
  availability_zones            = var.availability_zones
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  auto_minor_version_upgrade    = var.auto_minor_version_upgrade
  automatic_failover_enabled    = var.automatic_failover_enabled
  engine                        = var.engine
  engine_version                = var.engine_version
  kms_key_id                    = var.kms_key_id
  maintenance_window            = var.maintenance_window
  node_type                     = var.node_type
  number_cache_clusters         = var.number_cache_clusters
  parameter_group_name          = var.parameter_group_name
  port                          = var.redis_port
  replication_group_description = var.replication_group_description
  replication_group_id          = "${var.name}-redis"
  security_group_ids            = var.security_group_ids
  snapshot_window               = var.snapshot_window
  snapshot_retention_limit      = var.snapshot_retention_limit
  subnet_group_name             = aws_elasticache_subnet_group.cache-subnetgroup.name
  transit_encryption_enabled    = var.transit_encryption_enabled
  tags                          = var.tags

  # Create full featured cluster (ie. two shards with single read repica per in each)
  dynamic "cluster_mode" {
    for_each = length(keys(var.cluster_mode)) == 0 ? [] : [var.cluster_mode]

    content {
      num_node_groups         = lookup(cluster_mode.value, "num_node_groups", null)
      replicas_per_node_group = lookup(cluster_mode.value, "replicas_per_node_group", null)
    }
  }
}
