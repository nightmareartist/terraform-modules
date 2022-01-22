## CloudFlare module

This module is used to insert records into CloudFlare via API. It requires that CloudFlare token is either in Parameter Store or that it's exported in the ENV using CLOUDFLARE_API_TOKEN. We are using TOKEN on purpose as it allows fine tuning security access.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudflare\_token | CloudFlare token | `string` | `""` | no |
| cloudflare\_zone\_id | Domain into which re record will be added | `string` | `""` | no |
| enabled | A boolean to enable/disable resource creation | `bool` | `true` | no |
| page\_rule | Setup page rule. For details see: https://www.terraform.io/docs/providers/cloudflare/r/page_rule.html | `any` | `[]` | no |
| proxied | Whether the record gets Cloudflare's origin protection | `bool` | `true` | no |
| record\_priority | The priority of the record | `number` | `null` | no |
| record\_subdomain | The name of the record | `string` | `""` | no |
| record\_ttl | The TTL of the record. Must be set to 1 for proxied to work | `string` | `"1"` | no |
| record\_type | The type of the record | `string` | `""` | no |
| record\_value | The value of the record | `string` | `""` | no |
| ssm\_cloudflare\_token | CloudFlare token from parameter store | `string` | `"/Cloudflare/token"` | no |

## Using Page rules

Our module currently supports two types of rules: SSL and forwarding URL. This is merely limitation of our current needs. This part of the code can easily be extended to support any other page rule when needed. Cf. https://www.terraform.io/docs/providers/cloudflare/r/page_rule.html

**Examples of page rules:**

Forwarding URL:

``` 
  page_rule = [
    {
      target = "www.mysite.com/*"
      forwarding_url = {
        url         = "https://mysite.com/$1"
        status_code = 301
      }
    }
  ]
```

SSL:

``` 
  page_rule = [
    {
      target = "mydomain.com/*"
      ssl    = "flexible"
    }
  ]
```

Module support multiple rules within the same `page_rule = []` block.

## Outputs

| Name | Description |
|------|-------------|
| record\_name\_a | Output A record if it exists |

