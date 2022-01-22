### EC2 instance profile module

An instance profile is a container for an IAM role that you can use to pass role information to an EC2 instance when the instance starts. 

For more details see [Using Instance Profiles](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html).

This module requires IAM role name. This should be provided using IAM module.

Terragrunt example:

``` 
inputs = {
  profile_name = "my-instance-profile"
  role_name    = dependency.role-name.outputs.this_iam_role_name
}
```
