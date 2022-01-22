### AWS Kinesis Stream

This module creates Kinesis stream.

## Resources

| Name |
|------|
| [aws_kinesis_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_stream) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| encryption\_type | (Optional) The encryption type to use. The only acceptable values are NONE or KMS. The default value is NONE. | `string` | `"NONE"` | no |
| enforce\_consumer\_deletion | (Optional) A boolean that indicates all registered consumers should be deregistered from the stream so that the stream can be destroyed without error. The default value is false. | `bool` | `false` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | `""` | no |
| kms\_key\_id | (Optional) The GUID for the customer-managed KMS key to use for encryption. You can also use a Kinesis-owned master key by specifying the alias alias/aws/kinesis. | `string` | `""` | no |
| label\_order | The naming order of the id output and Name tag | `list(string)` | `[]` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `""` | no |
| null\_label\_enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| regex\_replace\_chars | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`. By default only hyphens, letters and digits are allowed, all other chars are removed | `string` | `"/[^a-zA-Z0-9-]/"` | no |
| retention\_period | (Optional) Length of time data records are accessible after they are added to the stream. The maximum value of a stream's retention period is 8760 hours. Minimum value is 24. Default is 24. | `number` | `24` | no |
| shard\_count | (Required) The number of shards that the stream will use. Amazon has guidelines for specifying the Stream size that should be referenced when creating a Kinesis stream. See: https://docs.aws.amazon.com/kinesis/latest/dev/amazon-kinesis-streams.html | `number` | `1` | no |
| shard\_level\_metrics | (Optional) A list of shard-level CloudWatch metrics which can be enabled for the stream. See https://docs.aws.amazon.com/streams/latest/dev/monitoring-with-cloudwatch.html for more. Note that the value ALL should not be used; instead you should provide an explicit list of metrics you wish to enable. | `list(string)` | `[]` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `""` | no |
| tags | Default tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| stream\_arn | AWS Kinesis Stream ARN. |
