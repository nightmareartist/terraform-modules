resource "aws_organizations_account" "account" {
  name                       = var.name
  email                      = var.email
  iam_user_access_to_billing = var.iam_user_access_to_billing
  role_name                  = var.role_name
  tags                       = var.tags

  # There is no AWS Organizations API for reading role_name
  lifecycle {
    ignore_changes = [role_name]
  }
}
