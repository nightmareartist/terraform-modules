# CloudWatch Export
Export logs from CloudWatch to S3

## NOTE
This module requires `curl` be available on the machine running terraform so that it can download the lambda zip.

## Example

    module "cloudwatch-logs-exporter" {
      source           = "path/to/module"
      version          = "0.0.4"

      name             = "vpc-flow-logs"
      log_group        = "/prd/vpc_flow_logs"
      s3_bucket        = "my-s3-bucket"
      s3_prefix        = "cloudwatch/prd/vpc_flow_logs"
    }
