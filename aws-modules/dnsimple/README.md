#### DNSimple module

This module adds a record (regular or NS) to DNSimple domain. 


Input should be in the following format:

```sh 
  enabled          = true
  dnsimple_domain  = "test-domain.com"
  record_subdomain = "my-subdomain"
  record_value     = "127.0.0.1"
  record_type      = "A"
  record_ttl       = 3600
```

DNSimple account ID and token are provided either via AWS SSM values or using env vars:

```sh 
TF_VAR_dnsimple_token= XXXXXXXXXXXXX
TF_VAR_dnsimple_account=12345
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| dnsimple\_account | The ID of the account associated with the token | `string` | `""` | no |
| dnsimple\_domain | Domain into which re record will be added | `string` | `""` | no |
| dnsimple\_token | The TTL of the record | `string` | `""` | no |
| enabled | A boolean to enable/disable resource creation | `bool` | `true` | no |
| environment | environment, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| name | Service name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | `string` | `""` | no |
| record\_priority | The priority of the record | `string` | `""` | no |
| record\_subdomain | The name of the record | `string` | `""` | no |
| record\_ttl | The TTL of the record | `string` | `"3600"` | no |
| record\_type | The type of the record | `string` | `""` | no |
| record\_value | The value of the record | `string` | `""` | no |
| ssm\_dnsimple\_token | The DNSimple API v2 token. It must be provided, but it can also be sourced from the DNSIMPLE\_TOKEN environment variable | `string` | `"/DNSimple/token"` | no |
| tags | Default tags | `map(string)` | <pre>{<br>  "Environment": "development",<br>  "Terraform": "true"<br>}<br></pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| record\_name\_a | Output A record if it exists |
| record\_name\_ns | Output NS record if it exists |

