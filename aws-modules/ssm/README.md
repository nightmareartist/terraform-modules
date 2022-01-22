## SSM Module

This module creates SSM Parameter. The idea is not to feed is with real values but just create the structure in AWS Parameter store.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| description | (Optional) The description of the parameter | `string` | `""` | yes |
| key\_id | (Optional) The KMS key id or arn for encrypting a SecureString. Default KMS SSM will be used if this is empty | `string` | `""` | no |
| name | (Required) The name of the parameter. If the name contains a path (e.g. any forward slashes (/)), it must be fully qualified with a leading forward slash (/). For additional requirements and constraints, see: https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-parameter-name-constraints.html | `string` | `""` | yes |
| overwrite | (Optional) Overwrite an existing parameter. If not specified, will default to false if the resource has not been created by terraform to avoid overwrite of existing resource and will default to true otherwise (terraform lifecycle rules should then be used to manage the update behavior) | `bool` | `false` | no |
| tags | (Optional) A mapping of tags to assign to the object | `map(string)` | `{}` | no |
| tier | (Optional) The tier of the parameter. If not specified, will default to Standard. Valid tiers are Standard and Advanced. For more information on parameter tiers, see https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html | `string` | `"Standard"` | no |
| type | (Required) The type of the parameter. Valid types are String, StringList and SecureString | `string` | `"SecureString"` | yes |
| value | (Required) The value of the parameter | `string` | `""` | yes |

## Outputs

| Name | Description |
|------|-------------|
| ssm\_item | SSM parameter ARN |
| ssm\_name | SSM parameter ARN |
