variable "enabled" {
  description = "Whether or not to enable this module"
  type        = bool
  default     = true
}

variable "github_token" {
  description = "GitHub token used for API access. If not provided, can be sourced from the `GITHUB_TOKEN` environment variable"
  type        = string
  default     = ""
}

variable "github_organization" {
  description = "GitHub organization to use when creating webhooks"
  type        = string
}

variable "github_repositories" {
  description = "List of repository names which should be associated with the webhook"
  type        = list(string)
  default     = []
}

variable "webhook_url" {
  description = "Webhook URL"
  type        = string
}

variable "webhook_content_type" {
  description = "Webhook Content Type (e.g. `json`)"
  type        = string
  default     = "json"
}

variable "webhook_secret" {
  description = "Webhook secret"
  type        = string
  default     = ""
}

variable "webhook_insecure_ssl" {
  description = "Webhook Insecure SSL (e.g. trust self-signed certificates)"
  type        = bool
  default     = false
}

variable "active" {
  description = "Indicate of the webhook should receive events"
  type        = bool
  default     = true
}

variable "events" {
  # Full list of events available here: https://developer.github.com/v3/activity/events/types/
  default     = ["issue_comment", "pull_request", "pull_request_review", "pull_request_review_comment"]
  type        = list(string)
  description = "A list of events which should trigger the webhook."
}
