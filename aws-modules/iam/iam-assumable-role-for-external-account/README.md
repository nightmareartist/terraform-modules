## IAM assumable role for external account

This role is used for external services that need access to AWS ie. Datadog.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_role"></a> [create\_role](#input\_create\_role) | Whether to create a role | `bool` | `false` | no |
| <a name="input_custom_role_policy_arns"></a> [custom\_role\_policy\_arns](#input\_custom\_role\_policy\_arns) | List of ARNs of IAM policies to attach to IAM role | `list(string)` | `[]` | no |
| <a name="input_external_id"></a> [external\_id](#input\_external\_id) | External ID that can assume this role | `string` | `""` | no |
| <a name="input_role_description"></a> [role\_description](#input\_role\_description) | The description of the role. | `string` | n/a | yes |
| <a name="input_role_force_detach_policies"></a> [role\_force\_detach\_policies](#input\_role\_force\_detach\_policies) | Specifies to force detaching any policies the role has before destroying it. | `bool` | `false` | no |
| <a name="input_role_max_session_duration"></a> [role\_max\_session\_duration](#input\_role\_max\_session\_duration) | The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours. | `number` | `3600` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | The name of the role. It will forces new resource on change. | `string` | n/a | yes |
| <a name="input_role_path"></a> [role\_path](#input\_role\_path) | Path of IAM role | `string` | `"/"` | no |
| <a name="input_role_permissions_boundary_arn"></a> [role\_permissions\_boundary\_arn](#input\_role\_permissions\_boundary\_arn) | Permissions boundary ARN to use for IAM role | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tags. | `map(string)` | `{}` | no |
| <a name="input_trusted_role_arns"></a> [trusted\_role\_arns](#input\_trusted\_role\_arns) | ARNs of AWS entities who can assume these roles | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of generated IAM role |
| <a name="output_name"></a> [name](#output\_name) | The name of generated IAM role |
