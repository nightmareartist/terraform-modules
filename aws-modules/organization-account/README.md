### Organizations Account Module

This module provides a resource to create a member account in the current organization.

**Note:** Account management must be done from the organization's master account.

**WARNING:** Deleting this Terraform resource will only remove an AWS account from an organization. Terraform will not close the account. The member account must be prepared to be a standalone account beforehand. See the [AWS Organizations documentation](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html) for more information.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| email | (Required) The email address of the owner to assign to the new member account. This email address must not already be associated with another AWS account | `string` | `""` | yes |
| iam\_user\_access\_to\_billing  | (Optional) If set to ALLOW, the new account enables IAM users to access account billing information if they have the required permissions. If set to DENY, then only the root user of the new account can access account billing information | `string` | `"DENY"` | no |
| name | (Required) A friendly name for the member account | `string` | `""` | yes |
| role\_name  | (Optional) The name of an IAM role that Organizations automatically preconfigures in the new member account. This role trusts the master account, allowing users in the master account to assume the role, as permitted by the master account administrator. The role has administrator permissions in the new member account. The Organizations API provides no method for reading this information after account creation, so Terraform cannot perform drift detection on its value and will always show a difference for a configured value after import unless ignore\_changes is used | `string` | `""` | no |
| tags | Default tags | `map(string)` | <pre>{<br>  "Environment": "development",<br>  "Terraform": "true"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| organization-arn | Organization ARN |
| organization-id | Organization ID |

