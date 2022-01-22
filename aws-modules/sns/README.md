## SNS module

This is a simple module for SNS topic creation. If no policy stated AWS will create a default policy that allows access to root user.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create\_sns\_topic | Whether to create new SNS topic | `bool` | `true` | no |
| delivery\_policy | (Optional) The SNS delivery policy. More on: https://docs.aws.amazon.com/sns/latest/dg/DeliveryPolicies.html | `string` | `""` | no |
| display\_name | The display name for the SNS topic | `string` | `""` | yes |
| environment | environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| kms\_master\_key\_id | The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK | `string` | `""` | no |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| policy | (Optional) The fully-formed AWS policy as JSON. For more information about building AWS IAM policy documents with Terraform, see: https://learn.hashicorp.com/terraform/aws/iam-policy | `string` | `""` | no |
| sns\_topic\_name | The name of SNS topic to create or reference | `string` | `""` | yes |
| tags | Default VPC tags. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| sns\_topic\_arn | The ARN of the SNS topic |

