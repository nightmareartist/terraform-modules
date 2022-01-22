### AWS Kinesis Firehose module

This module is bare minimum setup needed for AWS WAF. It covers only one scenario: Firehose --> S3 for WAF and nothing else.

## Resources

| Name |
|------|
| [aws_kinesis_firehose_delivery_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| bucket\_arn | (Required) The ARN of the S3 bucket. | `string` | `""` | yes |
| buffer\_interval | (Optional) Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination. The default value is 300. | `number` | `300` | no |
| buffer\_size | (Optional) Buffer incoming data to the specified size, in MBs, before delivering it to the destination. The default value is 5. We recommend setting SizeInMBs to a value greater than the amount of data you typically ingest into the delivery stream in 10 seconds. For example, if you typically ingest data at 1 MB/sec set SizeInMBs to be 10 MB or higher. | `number` | `5` | no |
| cloudwatch\_logging\_enabled | (Optional) Enables or disables the logging. Defaults to false. | `bool` | `false` | no |
| compression\_format | (Optional) The compression format. If no value is specified, the default is UNCOMPRESSED. Other supported values are GZIP, ZIP & Snappy. If the destination is redshift you cannot use ZIP or Snappy. | `string` | `"UNCOMPRESSED"` | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| destination | (Required) This is the destination to where the data is delivered. The only options are s3 (Deprecated, use extended\_s3 instead), extended\_s3, redshift, elasticsearch, splunk, and http\_endpoint. | `string` | `""` | yes |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | `""` | no |
| key\_arn | (Optional) Amazon Resource Name (ARN) of the encryption key. Required when key\_type is CUSTOMER\_MANAGED\_CMK. | `string` | `""` | no |
| key\_type | (Optional) Type of encryption key. Default is AWS\_OWNED\_CMK. Valid values are AWS\_OWNED\_CMK and CUSTOMER\_MANAGED\_CMK. | `string` | `"AWS_OWNED_CMK"` | no |
| label\_order | The naming order of the id output and Name tag | `list(string)` | `[]` | no |
| log\_group\_name | (Optional) The CloudWatch group name for logging. This value is required if enabled is true. | `string` | `""` | no |
| log\_stream\_name | (Optional) The CloudWatch log stream name for logging. This value is required if enabled is true. | `string` | `""` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `""` | yes |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `""` | no |
| null\_label\_enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| regex\_replace\_chars | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`. By default only hyphens, letters and digits are allowed, all other chars are removed | `string` | `"/[^a-zA-Z0-9-]/"` | no |
| role\_arn | (Required) The ARN of the AWS credentials. | `string` | `""` | yes |
| s3\_backup\_mode | (Optional) The Amazon S3 backup mode. Valid values are Disabled and Enabled. Default value is Disabled. | `string` | `"Disabled"` | no |
| s3\_kms\_key\_arn | (Optional) Specifies the KMS key ARN the stream will use to encrypt data. If not set, no encryption will be used. | `string` | `""` | no |
| ssm\_enabled | (Optional) Encrypt at rest options. Server-side encryption should not be enabled when a kinesis stream is configured as the source of the firehose delivery stream. | `bool` | `false` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `""` | no |
| tags | Default tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| stream\_arn | AWS Kinesis Stream ARN. |
