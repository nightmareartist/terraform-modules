variable "enabled" {
  description = "A boolean to enable/disable resource creation"
  type        = bool
  default     = true
}

variable "name" {
  description = "Solution name, e.g. 'app' or 'jenkins'"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Default tags"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
}

variable "availability_zones" {
  description = "Availability zones to be used within VPC."
  type        = list(string)
}

variable "cache_subnet_name" {
  description = "Name for cache subnet."
  default     = "default-redis-cache-subnet"
}

variable "cache_subnetgroup" {
  description = "Subnet to be used for Redis."
  type        = set(string)
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window."
  default     = false
}

variable "at_rest_encryption_enabled" {
  description = "Whether to enable encryption at rest."
  default     = true
}

variable "auto_minor_version_upgrade" {
  description = "Specifies whether a minor engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window."
  default     = true
}

variable "automatic_failover_enabled" {
  description = "Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails."
  default     = true
}

variable "engine" {
  description = "Name of the cache engine to be used for this cache cluster. Valid values for this parameter are memcached or redis.The compute and memory capacity of the nodes."
  default     = "redis"
}

variable "engine_version" {
  description = "Version number of the cache engine to be used."
  default     = "5.0.6"
}

variable "kms_key_id" {
  description = "KMS key for Redis encryption."
  default     = ""
}

variable "maintenance_window" {
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed."
  default     = "thu:23:00-fri:00:00"
}

variable "node_type" {
  description = "The compute and memory capacity of the nodes."
  default     = "cache.t2.micro"
}

variable "number_cache_clusters" {
  description = "The number of cache clusters (primary and replicas) this replication group will have."
  default     = 2
}

variable "parameter_group_name" {
  description = "Name of the parameter group to associate with this cache cluster."
  default     = "default.redis5.0.cluster.on"
}

variable "cluster_mode" {
  description = "Decide whether to setup full cluster mode or just a single shard with a single node."
  type        = map(string)
  default     = {}
}

variable "redis_port" {
  description = "The port number on which each of the cache nodes will accept connections."
  default     = "6379"
}

variable "replication_group_description" {
  description = "Short description for replication group."
  default     = "Redis replication group."
}

variable "security_group_ids" {
  description = "Default security group used for Redis."
  type        = list(string)
  default     = []
}

variable "snapshot_window" {
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster."
  default     = "03:00-05:00"
}

variable "snapshot_retention_limit" {
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them."
  default     = "1"
}

variable "transit_encryption_enabled" {
  description = "Whether to enable encryption in transit."
  default     = true
}
