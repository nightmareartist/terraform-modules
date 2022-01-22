### AWS Cloudtrail module

This module is used to create trails in Cloudtrail. The module accepts an encrypted S3 bucket with versioning to store CloudTrail logs. The bucket could be from the same AWS account or from a different account.

#### Usage

``` 
module "cloudtrail" {
      source                        = "path/to/source"
      namespace                     = "eg"
      stage                         = "dev"
      name                          = "cluster"
      enable_log_file_validation    = true
      include_global_service_events = true
      is_multi_region_trail         = false
      enable_logging                = true
      s3_bucket_name                = "my-cloudtrail-logs-bucket"
      kms_key_arn                   = "arn:aws:kms:eu-central-1:1234567890:key/56hjf8-106p-4f5d-232d-b4fbf7d234cb"
    }
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| cloud\_watch\_logs\_group\_arn | Specifies a log group name using an Amazon Resource Name (ARN), that represents the log group to which CloudTrail logs will be delivered | `string` | `""` | no |
| cloud\_watch\_logs\_role\_arn | Specifies the role for the CloudWatch Logs endpoint to assume to write to a user’s log group | `string` | `""` | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| enable\_log\_file\_validation | Specifies whether log file integrity validation is enabled. Creates signed digest for validated contents of logs | `bool` | `true` | no |
| enable\_logging | Enable logging for the trail | `bool` | `true` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | `""` | no |
| event\_selector | Specifies an event selector for enabling data event logging. See: https://www.terraform.io/docs/providers/aws/r/cloudtrail.html for details on this variable | <pre>list(object({<br>    include_management_events = bool<br>    read_write_type           = string<br><br>    data_resource = list(object({<br>      type   = string<br>      values = list(string)<br>    }))<br>  }))</pre> | `[]` | no |
| include\_global\_service\_events | Specifies whether the trail is publishing events from global services such as IAM to the log files | `bool` | `false` | no |
| is\_multi\_region\_trail | Specifies whether the trail is created in the current region or in all regions | `bool` | `false` | no |
| is\_organization\_trail | The trail is an AWS Organizations trail | `bool` | `false` | no |
| kms\_key\_arn | Specifies the KMS key ARN to use to encrypt the logs delivered by CloudTrail | `string` | `""` | no |
| label\_order | The naming order of the id output and Name tag | `list(string)` | `[]` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `""` | yes |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `""` | no |
| regex\_replace\_chars | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`. By default only hyphens, letters and digits are allowed, all other chars are removed | `string` | `"/[^a-zA-Z0-9-]/"` | no |
| s3\_bucket\_name | S3 bucket name for CloudTrail logs | `string` | n/a | yes |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `""` | no |
| tags | Default tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| cloudtrail\_arn | The Amazon Resource Name of the trail |
| cloudtrail\_home\_region | The region in which the trail was created |
| cloudtrail\_id | The name of the trail |

