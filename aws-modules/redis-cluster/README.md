#### Redis module

This module is used to setup Redis in non-cluster and cluster mode. Non-cluster mode sets up one Redis shard with one master and one read replica in another availability zone. It is Multi-AZ by default (failover turned on). In case multi-shard/cluster setup is needed the following parameters should be present in HCL file:

```sh
redis_cluster_enabled = {
    num_node_groups         = 1
    replicas_per_node_group = 2
  }
```

This also requires that `parameter_group_name` should be `default.redis5.0.cluster.on` and that number of `availability_zones` should correspond to `replicas_per_node_group`.

Other settings may remain the same. Multi-AZ is controlled with `automatic_failover_enabled` and should be `true` for both setups.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| apply\_immediately | Specifies whether any database modifications are applied immediately, or during the next maintenance window. | `bool` | `false` | no |
| at\_rest\_encryption\_enabled | Whether to enable encryption at rest. | `bool` | `true` | no |
| auto\_minor\_version\_upgrade | Specifies whether a minor engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window. | `bool` | `true` | no |
| automatic\_failover\_enabled | Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. | `bool` | `true` | no |
| availability\_zones | Availability zones to be used within VPC. | `list(string)` | n/a | yes |
| cache\_subnet\_name | Name for cache subnet. | `string` | `"default-redis-cache-subnet"` | no |
| cache\_subnetgroup | Subnet to be used for Redis. | `set(string)` | n/a | yes |
| cluster\_mode | Decide whether to setup full cluster mode or just a single shard with a single node. | `map(string)` | `{}` | no |
| engine | Name of the cache engine to be used for this cache cluster. Valid values for this parameter are memcached or redis.The compute and memory capacity of the nodes. | `string` | `"redis"` | no |
| engine\_version | Version number of the cache engine to be used. | `string` | `"5.0.6"` | no |
| environment | environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| kms\_key\_id | KMS key for Redis encryption. | `string` | `""` | no |
| maintenance\_window | Specifies the weekly time range for when maintenance on the cache cluster is performed. | `string` | `"thu:23:00-fri:00:00"` | no |
| name | Service name, e.g. 'app' or 'jenkins' | `string` | `"default"` | no |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| node\_type | The compute and memory capacity of the nodes. | `string` | `"cache.t2.micro"` | no |
| number\_cache\_clusters | The number of cache clusters (primary and replicas) this replication group will have. | `number` | `2` | no |
| parameter\_group\_name | Name of the parameter group to associate with this cache cluster. | `string` | `"default.redis5.0.cluster.on"` | no |
| redis\_port | The port number on which each of the cache nodes will accept connections. | `string` | `"6379"` | no |
| replication\_group\_description | Short description for replication group. | `string` | `"Redis replication group."` | no |
| security\_group\_ids | Default security group used for Redis. | `list(string)` | `[]` | no |
| snapshot\_retention\_limit | The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. | `string` | `"1"` | no |
| snapshot\_window | The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. | `string` | `"03:00-05:00"` | no |
| tags | Default tags | `map(string)` | <pre>{<br>  "Environment": "development",<br>  "Terraform": "true"<br>}<br></pre> | no |
| transit\_encryption\_enabled | Whether to enable encryption in transit. | `bool` | `true` | no |
| vpc\_id | ID of the VPC where to create security group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| endpoint | Endpoint for Redis cluster. |
| id | Redis cluster ID. |

