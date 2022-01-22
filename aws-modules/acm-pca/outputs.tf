output "ca-arn" {
  description = "ARN of ACM PCA"
  value       = aws_acmpca_certificate_authority.main.arn
}

output "certificate-signing-request" {
  description = "The base64 PEM-encoded certificate signing request (CSR) for your private CA certificate."
  value       = aws_acmpca_certificate_authority.main.certificate_signing_request
}


