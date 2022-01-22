terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    dnsimple = {
      source = "terraform-providers/dnsimple"
    }
  }
  required_version = ">= 1.0"
}
