# Create AWS managed certificate
resource "aws_acm_certificate" "this_cert_us_east_1" {
  count = var.cloudfront_certificate ? 1 : 0

  provider                  = aws.us-east-1
  domain_name               = var.domain
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method
  tags                      = var.tags

  lifecycle {
    create_before_destroy = true
  }

  options {
    certificate_transparency_logging_preference = var.certificate_transparency_logging_preference
  }
}

# Create AWS managed certificate
resource "aws_acm_certificate" "this_cert" {
  count = var.cloudfront_certificate ? 0 : 1

  domain_name               = var.domain
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method
  tags                      = var.tags

  lifecycle {
    create_before_destroy = true
  }

  options {
    certificate_transparency_logging_preference = var.certificate_transparency_logging_preference
  }
}
