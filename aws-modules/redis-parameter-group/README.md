## Resources

| Name | Type |
|------|------|
| [aws_elasticache_parameter_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | A boolean to enable/disable resource creation | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | `""` | no |
| <a name="input_family"></a> [family](#input\_family) | The family of the ElastiCache parameter group () | `string` | `"redis5.0"` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The naming order of the id output and Name tag | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Solution name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `""` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | A list of ElastiCache parameters to apply. | `any` | `[]` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`. By default only hyphens, letters and digits are allowed, all other chars are removed | `string` | `"/[^a-zA-Z0-9-]/"` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | Redis parameter group name. |
