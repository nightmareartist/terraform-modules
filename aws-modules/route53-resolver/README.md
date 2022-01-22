#### Route53 Resolver Endpoints

In order to resolve Route53 records from on premise locations (office LAN) Route53 Resolver service needs to be utilized. For detailed documentation read: [Resolving DNS queries between VPCs and your network](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver.html).

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| direction | (Required) The direction of DNS queries to or from the Route 53 Resolver endpoint. Valid values are INBOUND (resolver forwards DNS queries to the DNS service for a VPC from your network or another VPC) or OUTBOUND (resolver forwards DNS queries from the DNS service for a VPC to your network or another VPC) | `string` | `""` | yes |
| environment | Environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | yes |
| ip\_address | (Required) The subnets and IP addresses in your VPC that you want DNS queries to pass through on the way from your VPCs to your network (for outbound endpoints) or on the way from your network to your VPCs (for inbound endpoints) | `list(map(string))` | `[]` | yes |
| name | Service name, e.g. 'app' or 'jenkins' | `string` | `""` | yes |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | yes |
| security\_groups | (Required) The ID of one or more security groups that you want to use to control access to this VPC | `list(string)` | `[]` | yes |
| tags | Default tags. | `map(string)` | `{}` | no |

## Outputs

No output.

