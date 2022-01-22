### Cloudwatch Log metric filter

This module is used to create filtered metrics from logs.


### Usage

This module requires the following bare minimum to work:

``` 
    log_group_name = "this-log-group-name"
    metric_transformation_name = [
        "ThisIsAMetricCount1",
        "ThisIsAMetricCount2"
  ]
    pattern        = [
         "{ ($.errorCode = \"*ThisOperation\") || ($.errorCode = \"ThisError*\") }",
         "{ ($.errorCode = \"*ThisOperation2\") || ($.errorCode = \"ThisError*\") }"
  ]
    metric_transformation_value     = "1"
    metric_transformation_namespace = "MyCustomFilter"
```

This code will create two separate filters under a single namespace.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | `""` | no |
| label\_order | The naming order of the id output and Name tag | `list(string)` | `[]` | no |
| log\_group\_name | Log group to use for this filter | `string` | n/a | yes |
| metric\_name | Custom name for the metric | `string` | `""` | yes |
| metric\_transformation\_default\_value | The value to emit when a filter pattern does not match a log event | `string` | `""` | no |
| metric\_transformation\_name | The name of the CloudWatch metric to which the monitored log information should be published (e.g. ErrorCount) | `list(string)` | `[]` | yes |
| metric\_transformation\_namespace | The destination namespace of the CloudWatch metric | `string` | `""` | yes |
| metric\_transformation\_value | What to publish to the metric. For example, if you're counting the occurrences of a particular term like Error, the value will be 1 for each occurrence. If you're counting the bytes transferred the published value will be the value in the log event | `string` | n/a | yes |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `""` | no |
| pattern | Pattern used for filtering | `list(string)` | `[]` | yes |
| regex\_replace\_chars | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`. By default only hyphens, letters and digits are allowed, all other chars are removed | `string` | `"/[^a-zA-Z0-9-]/"` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `""` | no |
| tags | Default tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| metric\_filter\_id | The name of the metric filter. |
| metric\_transformation\_name | Metric transformation name(s). |
| metric\_transformation\_namespace | Metric transformation namespace. |
