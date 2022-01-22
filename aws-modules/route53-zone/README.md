## Route 53 module

This module is used to create initial zones, private or public.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| domain | Top level domain | `string` | `""` | no |
| enabled | Set to false to prevent the module from creating or accessing any resources | `bool` | `true` | no |
| environment | environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| force\_destroy | Whether to destroy all records inside if the hosted zone is deleted | `string` | `false` | no |
| name | Service name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| secondary\_vpcs | List of VPCs that will also be associated with this zone | `list(string)` | `[]` | no |
| tags | Default tags | `map(string)` | <pre>{<br>  "Environment": "development",<br>  "Terraform": "true"<br>}<br></pre> | no |
| vpc | Primary VPC ID that will be associated with this hosted zone | `list(map(string))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| fqdn | FQDN for this zone |
| name\_servers | A list of name servers in associated (or default) delegation set |
| zone\_id | ID of the hosted zone that contains the records |
| zone\_name | Name of the hosted zone that contains the records |

