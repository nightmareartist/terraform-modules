## ACM module

This module is used to generate certificates in AWS Certificate Manager.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| certificate\_transparency\_logging\_preference | Specifies whether certificate details should be added to a certificate transparency log. Valid values are ENABLED or DISABLED. See https://docs.aws.amazon.com/acm/latest/userguide/acm-concepts.html#concept-transparency for more details. | `string` | `"ENABLED"` | no |
| domain | Domain to be used for this certificate | `string` | `""` | yes |
| environment | environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| name | Service name, e.g. 'app' or 'jenkins' | `string` | `""` | yes |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | yes |
| subject\_alternative\_names | A list of domains that should be SANs in the issued certificate | `list(string)` | `[]` | no |
| tags | Default tags. | `map(string)` | <pre>{<br>  "Environment": "development",<br>  "Terraform": "true"<br>}<br></pre> | no |
| validation\_method | Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform. | `string` | `"DNS"` | yes |

## Outputs

| Name | Description |
|------|-------------|
| certificate\_arn | Certificate ARN |

