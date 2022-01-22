## AWS Application and Network Load Balancer (ALB & NLB) module

Terraform module which creates Application and Network Load Balancer resources on AWS.

These types of resources are supported:

    Load Balancer
    Load Balancer Listener
    Load Balancer Listener Certificate
    Target Group
    Load Balancer Listener default actions
    Load Balancer Listener Rule
    Target Group Attachment


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| access\_logs | Map containing access logging configuration for load balancer. | `map(string)` | `{}` | no |
| create\_lb | Controls if the Load Balancer should be created | `bool` | `true` | no |
| enable\_cross\_zone\_load\_balancing | Indicates whether cross zone load balancing should be enabled in application load balancers. | `bool` | `false` | no |
| enable\_deletion\_protection | If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false. | `bool` | `false` | no |
| enable\_http2 | Indicates whether HTTP/2 is enabled in application load balancers. | `bool` | `true` | no |
| environment | environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| extra\_ssl\_certs | A list of maps describing any extra SSL certificates to apply to the HTTPS listeners. Required key/values: certificate\_arn, https\_listener\_index (the index of the listener within https\_listeners which the cert applies toward). | `list(map(string))` | `[]` | no |
| http\_listener\_rule | Additional rules for HTTP listener. Required:  Optional key/values: target\_group\_index (defaults to 0) | `any` | `[]` | no |
| http\_tcp\_listeners | A list of maps describing the HTTP listeners for this ALB. Required key/values: port, protocol. Optional key/values: target\_group\_index (defaults to 0) | `any` | `[]` | no |
| https\_listener\_rule | Additional rules for HTTP listener. Required:  Optional key/values: target\_group\_index (defaults to 0) | `any` | `[]` | no |
| https\_tcp\_listeners | A list of maps describing the HTTPS listeners for this ALB. Required key/values: port, certificate\_arn. Optional key/values: ssl\_policy (defaults to ELBSecurityPolicy-2016-08), target\_group\_index (defaults to 0) | `any` | `[]` | no |
| idle\_timeout | The time in seconds that the connection is allowed to be idle. | `number` | `60` | no |
| internal | Boolean determining if the load balancer is internal or externally facing. | `bool` | `false` | no |
| ip\_address\_type | The type of IP addresses used by the subnets for your load balancer. The possible values are ipv4 and dualstack. | `string` | `"ipv4"` | no |
| listener\_ssl\_policy\_default | The security policy if using HTTPS externally on the load balancer. [See](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-policy-table.html). | `string` | `"ELBSecurityPolicy-2016-08"` | no |
| load\_balancer\_create\_timeout | Timeout value when creating the ALB. | `string` | `"10m"` | no |
| load\_balancer\_delete\_timeout | Timeout value when deleting the ALB. | `string` | `"10m"` | no |
| load\_balancer\_type | The type of load balancer to create. Possible values are application or network. | `string` | `"application"` | no |
| load\_balancer\_update\_timeout | Timeout value when updating the ALB. | `string` | `"10m"` | no |
| log\_location\_prefix | S3 prefix within the log\_bucket\_name under which logs are stored. | `string` | `""` | no |
| name | Service name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| name\_prefix | The resource name prefix and Name tag of the load balancer. | `string` | n/a | yes |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| security\_groups | The security groups to attach to the load balancer. e.g. ["sg-edcd9784","sg-edcd9785"] | `list(string)` | `[]` | no |
| subnet\_mapping | A list of subnet mapping blocks describing subnets to attach to network load balancer | `list(map(string))` | `[]` | no |
| subnets | A list of subnets to associate with the load balancer. e.g. ['subnet-1a2b3c4d','subnet-1a2b3c4e','subnet-1a2b3c4f'] | `list(string)` | n/a | yes |
| tags | Default tags. | `map(string)` | <pre>{<br>  "Environment": "development",<br>  "Terraform": "true"<br>}<br></pre> | no |
| target\_group\_attachment | Target group attachment specs. Optional key/values: target\_group\_index (defaults to 0) | `list(map(string))` | `[]` | no |
| target\_groups | A list of maps containing key/value pairs that define the target groups to be created. Order of these maps is important and the index of these are to be referenced in listener definitions. Required key/values: name, backend\_protocol, backend\_port. Optional key/values are in the target\_groups\_defaults variable. | `any` | `[]` | no |
| type | Type of action to be performed | `string` | `"forward"` | no |
| vpc\_id | VPC id where the load balancer and other resources will be deployed. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| http\_tcp\_listener\_arns | The ARN of the TCP and HTTP load balancer listeners created. |
| http\_tcp\_listener\_ids | The IDs of the TCP and HTTP load balancer listeners created. |
| https\_listener\_arns | The ARNs of the HTTPS load balancer listeners created. |
| https\_listener\_ids | The IDs of the load balancer listeners created. |
| target\_group\_arn\_suffixes | ARN suffixes of our target groups - can be used with CloudWatch. |
| target\_group\_arns | ARNs of the target groups. Useful for passing to your Auto Scaling group. |
| target\_group\_names | Name of the target group. Useful for passing to your CodeDeploy Deployment Group. |
| this\_lb\_arn | The ID and ARN of the load balancer we created. |
| this\_lb\_arn\_suffix | ARN suffix of our load balancer - can be used with CloudWatch. |
| this\_lb\_dns\_name | The DNS name of the load balancer. |
| this\_lb\_id | The ID and ARN of the load balancer we created. |
| this\_lb\_zone\_id | The zone\_id of the load balancer to assist with creating DNS records. |

