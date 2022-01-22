## AWS KMS module

This module create KMS in AWS.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alias | The display name of the alias. The name must start with the word `alias` followed by a forward slash | `string` | `""` | no |
| customer\_master\_key\_spec | (Optional) Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC\_DEFAULT, RSA\_2048, RSA\_3072, RSA\_4096, ECC\_NIST\_P256, ECC\_NIST\_P384, ECC\_NIST\_P521, or ECC\_SECG\_P256K1. Defaults to SYMMETRIC\_DEFAULT | `string` | `"SYMMETRIC_DEFAULT"` | no |
| deletion\_window\_in\_days | Duration in days after which the key is deleted after destruction of the resource | `number` | `10` | no |
| description | The description of the key as viewed in AWS console | `string` | `"Parameter Store KMS master key"` | no |
| enable\_key\_rotation | Specifies whether key rotation is enabled | `bool` | `true` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| environment | environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| is\_enabled | (Optional) Specifies whether the key is enabled. Defaults to true | `bool` | `true` | no |
| key\_name | Key specific name | `string` | `""` | no |
| key\_usage | (Optional) Specifies the intended use of the key. Valid values: ENCRYPT\_DECRYPT or SIGN\_VERIFY. Defaults to ENCRYPT\_DECRYPT | `string` | `"ENCRYPT_DECRYPT"` | no |
| name | Service name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| policy | A valid KMS policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy | `string` | `""` | no |
| tags | Default tags | `map(string)` | <pre>{<br>  "Environment": "development",<br>  "Terraform": "true"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| alias\_arn | Alias ARN |
| alias\_name | Alias name |
| key\_arn | Key ARN |
| key\_id | Key ID |

