terraform {
  required_providers {
    datadog = {
      source  = "DataDog/datadog"
      version = "2.25.0"
    }
  }
  required_version = ">= 1.0"
}
