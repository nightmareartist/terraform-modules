## CloudWatch log group

This module creates log group for services.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | yes |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | `""` | no |
| label\_order | The naming order of the id output and Name tag | `list(string)` | `[]` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `""` | yes |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `""` | no |
| regex\_replace\_chars | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`. By default only hyphens, letters and digits are allowed, all other chars are removed | `string` | `"/[^a-zA-Z0-9-]/"` | no |
| retention\_in\_days | Retention time frame for CloudWatch logs | `number` | `30` | yes |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `""` | no |
| tags | Default tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| log\_group | Export log group name |
| log\_group\_arn | Export log group ARN |

