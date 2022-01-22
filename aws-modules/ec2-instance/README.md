## EC2 instance module

This is a generic EC2 instance module for any type of instance. We will be using it for bastion creation in most scenarios.

Bare minimum for input variables:

```sh
  name                        = "hostname"
  key_name                    = "key-name"
  subnet_id                   = subnet-0
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami | AMI instance | `string` | `""` | no |
| associate\_public\_ip\_address | Setup public IP for this instance | `bool` | `true` | no |
| availability\_zone | (Optional) The AZ to start the instance in | `string` | `""` | no |
| aws\_instance\_count | Number of instances | `number` | `1` | no |
| credit\_specification | Customize the credit specification of the instance | `any` | `[]` | no |
| disable\_api\_termination | Turn on termination protection | `bool` | `true` | no |
| ebs\_block\_device | Additional EBS block devices to attach to the instance | `list(map(string))` | `[]` | no |
| ebs\_optimized | If true, the launched EC2 instance will be EBS-optimized. Note that if this is not set on an instance type that is optimized by default then this will show as disabled but if the instance type is optimized by default then there is no need to set this and there is no effect to disabling it | `bool` | `false` | no |
| environment | environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| hibernation | (Optional) If true, the launched EC2 instance will support hibernation | `bool` | `false` | no |
| iam\_instance\_profile | The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. Ensure your credentials have the correct permission to assign the instance profile according to the EC2 documentation, notably iam:PassRole | `string` | `""` | no |
| instance\_type | Instance type to be used | `string` | `"t2.micro"` | no |
| key\_name | Key name to be used for accessing this instance | `string` | `""` | no |
| monitoring | If true, the launched EC2 instance will have detailed monitoring enabled | `bool` | `false` | no |
| name | Service name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| root\_block\_device | Customize details about the root block device of the instance | `list(map(string))` | `[]` | no |
| source\_dest\_check | Turn on source dest check | `bool` | `true` | no |
| subnet\_id | Subnet in which this instance should run | `string` | `""` | no |
| tags | Default tags | `map(string)` | `{}` | no |
| user\_data | The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user\_data\_base64 instead. | `string` | `""` | no |
| vpc\_security\_groups\_ids | Security groups this instance should be associated with | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_id | EC2 instance id |
| instance\_ip | EC2 instance IP |
| instance\_public\_dns | EC2 instance public DNS |

