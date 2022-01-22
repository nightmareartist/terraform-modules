## GitHub Repository Webhooks module

Terraform module to provision webhooks on a set of GitHub repositories. This is useful if you need to register a webhook en masse across dozens of repositories.

```
module "github_webhooks" {
  source               = "path_to_this_repo"
  github_organization  = "xxxxx"
  github_token         = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  github_repositories  = ["service"]
  webhook_url          = webhook_url (if Codepipeline is used use its URL)
  webhook_content_type = "application/json"
  events               = ["push"]
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| active | Indicate of the webhook should receive events | bool | `true` | no |
| enabled | Whether or not to enable this module | bool | `true` | no |
| events | A list of events which should trigger the webhook. | list(string) | `<list>` | no |
| github_organization | GitHub organization to use when creating webhooks | string | - | yes |
| github_repositories | List of repository names which should be associated with the webhook | list(string) | `<list>` | no |
| github_token | GitHub token used for API access. If not provided, can be sourced from the `GITHUB_TOKEN` environment variable | string | `` | no |
| webhook_content_type | Webhook Content Type (e.g. `json`) | string | `json` | no |
| webhook_insecure_ssl | Webhook Insecure SSL (e.g. trust self-signed certificates) | bool | `false` | no |
| webhook_secret | Webhook secret | string | `` | no |
| webhook_url | Webhook URL | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| webhook_url | Webhook URL |
