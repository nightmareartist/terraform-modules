## Route 53 record module

This is a generic module that adds records to Route 53 zone. Zone needs to exist or be created using `route53-zone`.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| environment | environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| name | Service name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| records | DNS records | `list(string)` | `[]` | no |
| tags | Default tags | `map(string)` | <pre>{<br>  "Environment": "development",<br>  "Terraform": "true"<br>}<br></pre> | no |
| ttl | Time To Live for DNS record in minutes | `number` | `60` | no |
| type | Type of DNS record | `string` | `"CNAME"` | no |
| zone\_id | Zone which will host this record | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| record\_name | DNS record value |

