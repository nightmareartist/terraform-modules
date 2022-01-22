## AWS VPC module

This module is a fork from an official VPC module. The fork is located in `source/` director and README.md in there should be used for further references.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|--------|:-----:|
| availability\_zones | Availability zones to be used within VPC. | `list(string)` | n/a | yes |
| cidr | CIDR range for VPC. | `any` | n/a | yes |
| database\_subnets | A list of database subnets inside the VPC. | `list(string)` | `[]` | no |
| enable\_dns\_hostnames | Enable DNS resolving. | `bool` | `true` | no |
| enable\_dns\_support | Enable DNS. | `bool` | `true` | no |
| enable\_ipv6 | Enable IPv6 support. | `bool` | `false` | no |
| enable\_nat\_gateway | Provision NAT Gateways for each of private networks. | `bool` | `true` | no |
| enable\_vpn\_gateway | Create a new VPN Gateway resource and attach it to the VPC. | `bool` | `true` | no |
| environment | environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| map\_public\_ip\_on\_launch | Should public IPs be assigned at launch. | `bool` | `false` | no |
| name | Service name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| one\_nat\_gateway\_per\_az | Enable one NAT gateway per Availability Zone. | `bool` | `false` | no |
| private\_subnets | A list of private subnets inside the VPC. | `list(string)` | `[]` | no |
| public\_subnets | A list of public subnets inside the VPC. | `list(string)` | `[]` | no |
| single\_nat\_gateway | Enable single NAT gateway. | `bool` | `false` | no |
| tags | Default tags | `map(string)` | <pre>{<br>  "Environment": "development",<br>  "Terraform": "true"<br>}<br></pre> | no |
| vpc\_name | VPC name. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| availability\_zones | A list of availability zones specified as argument to this module |
| database\_subnets | List of IDs of database subnets |
| database\_subnets\_cidr\_blocks | List of cidr\_blocks of database subnets |
| default\_security\_group\_id | n/a |
| private\_route\_table\_ids | List of IDs of private route tables |
| private\_subnets | List of IDs of private subnets |
| private\_subnets\_cidr\_blocks | List of cidr\_blocks of private subnets |
| private\_subnets\_cidr\_blocks\_comma\_separated | List of cidr\_blocks of private subnets |
| public\_subnets | List of IDs of public subnets |
| public\_subnets\_cidr\_blocks | List of cidr\_blocks of public subnets |
| vpc\_cidr\_block | The CIDR block of the VPC |
| vpc\_id | The ID of the VPC |

