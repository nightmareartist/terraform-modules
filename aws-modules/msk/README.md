### MSK module

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_subnets | A list of subnets to connect to in client VPC | `list(string)` | n/a | yes |
| name | Cluster name to be used on all the resources as identifier | `string` | n/a | yes |
| vpc\_id | VPC where the cluster and workers will be deployed | `string` | n/a | yes |
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| cluster\_create\_security\_group | Whether to create a security group for the cluster or attach the cluster to `cluster_security_group_id` | `bool` | `true` | no |
| config\_file | Location and name of file with custom configuration | `string` | `"msk.properties"` | no |
| deletion\_window\_in\_days | --------------------------------------------------------------------------------------------------------------------- AWS KMS --------------------------------------------------------------------------------------------------------------------- | `string` | `"7"` | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| ebs\_volume\_size | The size in GiB of the EBS volume for the data drive on each broker node | `string` | `"1"` | no |
| enable\_cname | Control creation of CNAME R53 record to bootstrap server | `bool` | `false` | no |
| enable\_custom\_config | Control if custom configuration file should be loaded | `bool` | `false` | no |
| enabled | Controls if MSK should be created (it affects almost all resources) | `bool` | `true` | no |
| encryption\_in\_transit\_client\_broker | Encryption setting for data in transit between clients and brokers | `string` | `"TLS_PLAINTEXT"` | no |
| encryption\_in\_transit\_in\_cluster | Whether data communication among broker nodes is encrypted | `bool` | `true` | no |
| environment | environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| instance\_type | The type of Amazon EC2 instances to use for Kafka brokers | `string` | `"kafka.m5.large"` | no |
| kafka\_version | The version of Apache Kafka | `string` | `"2.1.0"` | no |
| label\_order | The naming order of the id output and Name tag | `list(string)` | <pre>[<br>  "namespace",<br>  "name",<br>  "environment",<br>  "stage",<br>  "attributes"<br>]</pre> | no |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| number\_of\_broker\_nodes | The number of broker nodes in the cluster | `string` | `"3"` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', or 'test' | `string` | `""` | no |
| tags | A map of tags to add to MSK Cluster | `map(string)` | `{}` | no |
| ttl | R53 CNAME ttl | `string` | `"60"` | no |
| zone\_id | R53 zone ID to add CNAME entries | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| msk\_cluster\_arn | n/a |
| msk\_cluster\_bootstrap\_brokers | Plaintext connection host:port pairs |
| msk\_cluster\_bootstrap\_brokers\_tls | TLS connection host:port pairs |
| msk\_cluster\_brokers\_aws\_route53\_records | n/a |
| msk\_cluster\_id | n/a |
| msk\_cluster\_kms\_key\_arn | n/a |
| msk\_cluster\_kms\_key\_id | n/a |
| msk\_cluster\_name | The name of the MSK cluster |
| msk\_cluster\_sg | The security group of the MSK cluster |
| msk\_cluster\_zookeeper\_connect\_string | A comma separated list of one or more IP:port pairs to use to connect to the Apache Zookeeper cluster |
| msk\_cluster\_zookeepers\_aws\_route53\_records | n/a |

