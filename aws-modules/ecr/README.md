## ECR module

This module is used to create ECR repositories. It also creates IAM access roles. There are two roles in place `read-only` and `full-access`. These two can be modified/extended using variables: `principals_readonly_access = []` and `principals_full_access = []`.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | yes |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | `""` | no |
| image\_tag\_mutability | The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE | `string` | `"MUTABLE"` | no |
| label\_order | The naming order of the id output and Name tag | `list(string)` | `[]` | no |
| max\_image\_count | How many Docker Image versions AWS ECR will store | `number` | `500` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `""` | yes |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `""` | no |
| principals\_full\_access | Principal ARNs to provide with full access to the ECR | `list(string)` | `[]` | no |
| principals\_readonly\_access | Principal ARNs to provide with readonly access to the ECR | `list(string)` | `[]` | no |
| regex\_replace\_chars | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`. By default only hyphens, letters and digits are allowed, all other chars are removed | `string` | `"/[^a-zA-Z0-9-]/"` | no |
| scan\_images\_on\_push | Indicates whether images are scanned after being pushed to the repository (true) or not (false) | `bool` | `true` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `""` | no |
| tags | Default tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| registry\_id | Registry ID |
| registry\_url | Registry URL |
| repository\_arn | Repository ARN |
| repository\_name | Repository name |

