## S3 Module

This module is used to create S3 buckets on AWS.

#### Notice

Be aware that `aws_s3_bucket_public_access_block` will result in `apply` to fail on the first run. That is due to time needed for these rules to be applied. Just re-run the job and it will pass OK.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| acceleration\_status | (Optional) Sets the accelerate configuration of an existing bucket. Can be Enabled or Suspended. | `string` | n/a | yes |
| acl | (Optional) The canned ACL to apply. Defaults to 'private'. | `string` | `"private"` | no |
| attach\_elb\_log\_delivery\_policy | Controls if S3 bucket should have ELB log delivery policy attached | `bool` | `false` | no |
| attach\_policy | Controls if S3 bucket should have bucket policy attached (set to `true` to use value of `policy` as bucket policy) | `bool` | `false` | no |
| block\_public\_acls | Whether Amazon S3 should block public ACLs for this bucket. When set to true: PUT Bucket acl and PUT Object acl calls will fail if the specified ACL allows public access. PUT Object calls will fail if the request includes an object ACL | `bool` | `true` | no |
| block\_public\_policy | Whether Amazon S3 should block public bucket policies for this bucket. When set to true: Reject calls to PUT Bucket policy if the specified bucket policy allows public access. | `bool` | `true` | no |
| bucket | (Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name. | `string` | n/a | yes |
| bucket\_prefix | (Optional, Forces new resource) Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. | `string` | n/a | yes |
| cors\_rule | Map containing a rule of Cross-Origin Resource Sharing. | `any` | `{}` | no |
| create\_bucket | Controls if S3 bucket should be created | `bool` | `true` | no |
| environment | environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| force\_destroy | (Optional, Default:false ) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | `bool` | `false` | no |
| ignore\_public\_acls | Whether Amazon S3 should ignore public ACLs for this bucket. When set to true: Ignore public ACLs on this bucket and any objects that it contains. | `bool` | `true` | no |
| lifecycle\_rule | List of maps containing configuration of object lifecycle management. | `any` | `[]` | no |
| logging | Map containing access bucket logging configuration. | `map(string)` | `{}` | no |
| name | Service name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| object\_lock\_configuration | Map containing S3 object locking configuration. | `any` | `{}` | no |
| policy | (Optional) A valid bucket policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide. | `string` | n/a | yes |
| region | (Optional) If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee. | `string` | n/a | yes |
| replication\_configuration | Map containing cross-region replication configuration. | `any` | `{}` | no |
| request\_payer | (Optional) Specifies who should bear the cost of Amazon S3 data transfer. Can be either BucketOwner or Requester. By default, the owner of the S3 bucket would incur the costs of any data transfer. See Requester Pays Buckets developer guide for more information. | `string` | n/a | yes |
| restrict\_public\_buckets | Whether Amazon S3 should restrict public bucket policies for this bucket. When set to true: Only the bucket owner and AWS Services can access this buckets if it has a public policy. | `bool` | `true` | no |
| server\_side\_encryption\_configuration | Map containing server-side encryption configuration. | `any` | `{}` | no |
| tags | Default tags | `map(string)` | <pre>{<br>  "Environment": "development",<br>  "Terraform": "true"<br>}<br></pre> | no |
| versioning | Map containing versioning configuration. | `map(string)` | `{}` | no |
| website | Map containing static web-site hosting or redirect configuration. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_s3\_bucket\_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| this\_s3\_bucket\_bucket\_domain\_name | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| this\_s3\_bucket\_bucket\_regional\_domain\_name | The bucket region-specific domain name. The bucket domain name including the region name, please refer here for format. Note: The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL. |
| this\_s3\_bucket\_hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region. |
| this\_s3\_bucket\_id | The name of the bucket. |
| this\_s3\_bucket\_region | The AWS region this bucket resides in. |
| this\_s3\_bucket\_website\_domain | The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records. |
| this\_s3\_bucket\_website\_endpoint | The website endpoint, if the bucket is configured with a website. If not, this will be an empty string. |

