resource "aws_acmpca_certificate_authority" "main" {
  enabled = var.ca_enabled

  certificate_authority_configuration {
    key_algorithm     = var.key_algorithm
    signing_algorithm = var.signing_algorithm

    subject {
      common_name                  = var.common_name
      country                      = var.country
      distinguished_name_qualifier = var.distinguished_name_qualifier
      generation_qualifier         = var.generation_qualifier
      given_name                   = var.given_name
      initials                     = var.initials
      locality                     = var.locality
      organization                 = var.organization
      organizational_unit          = var.organizational_unit
      pseudonym                    = var.pseudonym
      state                        = var.state
      surname                      = var.surname
      title                        = var.title
    }
  }

  type                            = var.type
  permanent_deletion_time_in_days = var.permanent_deletion_time_in_days
  tags                            = var.tags

  revocation_configuration {
    crl_configuration {
      enabled            = var.crl_enabled
      custom_cname       = var.custom_cname
      expiration_in_days = var.expiration_in_days
      s3_bucket_name     = var.s3_bucket_name
    }
  }

}
