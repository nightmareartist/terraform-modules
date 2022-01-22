# AWS WAF v2

Creates AWS WAFv2 ACL and supports the following:

* AWS Managed Rule Sets
* Associating with Application Load Balancers (ALB)
* Blocking IP Sets
* Global IP Rate limiting
* Custom IP rate limiting for different URLs

## Resources

| Name |
|------|
| [aws_wafv2_web_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl) |
| [aws_wafv2_web_acl_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_association) |
| [aws_wafv2_web_acl_logging_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_logging_configuration) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alb\_arn | ARN of the ALB to be associated with the WAFv2 ACL. | `string` | `""` | no |
| associate\_alb | Whether to associate an ALB with the WAFv2 ACL. | `bool` | `false` | no |
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| cloudwatch\_metrics\_enabled | (Required) A boolean indicating whether the associated resource sends metrics to CloudWatch. For the list of available metrics, see AWS WAF Metrics. | `bool` | `true` | no |
| create\_waf\_acl | Whether to create WAF ACL or not. | `bool` | `false` | yes |
| default\_action | WAF default action | `string` | `"block"` | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| enable\_logging | Enable WAF logging. | `bool` | `false` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | `""` | no |
| file\_upload\_rule | A rule to block uploading files of certain size(bypassing AWS managed rule limit of 4K). | <pre>list(object({<br>    name                = string<br>    priority            = number<br>    comparison_operator = string<br>    size                = number<br>  }))</pre> | `[]` | no |
| ip\_sets\_rule | A rule to detect web requests coming from particular IP addresses or address ranges. | <pre>list(object({<br>    name       = string<br>    priority   = number<br>    ip_set_arn = string<br>    action     = string<br>  }))</pre> | `[]` | no |
| label\_order | The naming order of the id output and Name tag | `list(string)` | `[]` | no |
| log\_destination\_configs | (Required) The Amazon Kinesis Data Firehose Amazon Resource Name (ARNs) that you want to associate with the web ACL. Currently, only 1 ARN is supported. | `list(string)` | `[]` | no |
| managed\_rules | List of Managed WAF rules. | <pre>list(object({<br>    name            = string<br>    priority        = number<br>    override_action = string<br>    excluded_rules  = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "excluded_rules": [],<br>    "name": "AWSManagedRulesCommonRuleSet",<br>    "override_action": "none",<br>    "priority": 10<br>  },<br>  {<br>    "excluded_rules": [],<br>    "name": "AWSManagedRulesAmazonIpReputationList",<br>    "override_action": "none",<br>    "priority": 20<br>  },<br>  {<br>    "excluded_rules": [],<br>    "name": "AWSManagedRulesKnownBadInputsRuleSet",<br>    "override_action": "none",<br>    "priority": 30<br>  },<br>  {<br>    "excluded_rules": [],<br>    "name": "AWSManagedRulesSQLiRuleSet",<br>    "override_action": "none",<br>    "priority": 40<br>  },<br>  {<br>    "excluded_rules": [],<br>    "name": "AWSManagedRulesLinuxRuleSet",<br>    "override_action": "none",<br>    "priority": 50<br>  },<br>  {<br>    "excluded_rules": [],<br>    "name": "AWSManagedRulesUnixRuleSet",<br>    "override_action": "none",<br>    "priority": 60<br>  }<br>]</pre> | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `""` | no |
| null\_label\_enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| path\_ipset\_rule | A rule to regulate access to certain paths from IP sets. | <pre>list(object({<br>    name                       = string<br>    priority                   = number<br>    action                     = string<br>    ip_set_arn                 = string<br>    positional_constraint      = string<br>    search_string              = string<br>    cloudwatch_metrics_enabled = bool<br>  }))</pre> | `[]` | no |
| path\_rule | A rule to regulate access to certain paths from any IP. | <pre>list(object({<br>    name                       = string<br>    priority                   = number<br>    action                     = string<br>    positional_constraint      = string<br>    search_string              = string<br>    cloudwatch_metrics_enabled = bool<br>  }))</pre> | `[]` | no |
| regex\_replace\_chars | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`. By default only hyphens, letters and digits are allowed, all other chars are removed | `string` | `"/[^a-zA-Z0-9-]/"` | no |
| sampled\_requests\_enabled | (Required) A boolean indicating whether AWS WAF should store a sampling of the web requests that match the rules. You can view the sampled requests through the AWS WAF console. | `bool` | `true` | no |
| scope | The scope of this Web ACL. Valid options: CLOUDFRONT, REGIONAL. | `string` | `"REGIONAL"` | no |
| single\_header\_name | (Optional) The name of the query header to redact. This setting must be provided as lower case characters. | `string` | `""` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `""` | no |
| tags | Default tags | `map(string)` | `{}` | no |
| web\_acl\_description | WAF ACL description. | `string` | `"This is a WAF ACL."` | no |

## Outputs

| Name | Description |
|------|-------------|
| web\_acl\_arn | The ARN of the WAF WebACL. |
