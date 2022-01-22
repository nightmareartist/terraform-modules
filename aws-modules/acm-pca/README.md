### AWS ACM Private Certificate Authority

Provides a resource to manage AWS Certificate Manager Private Certificate Authorities (ACM PCA Certificate Authorities).

**NOTE**

Creating this resource will leave the certificate authority in a PENDING_CERTIFICATE status, which means it cannot yet issue certificates. To complete this setup, you must fully sign the certificate authority CSR available in the certificate_signing_request attribute and import the signed certificate outside of Terraform. Terraform can support another resource to manage that workflow automatically in the future.


## Inputs

| Name | Description | Type | Default             | Required |
|------|-------------|------|---------------------|:--------:|
| ca\_enabled | (Optional) Whether the certificate authority is enabled or disabled. Defaults to true. | `bool` | `true`              | no |
| common\_name | (Optional) Fully qualified domain name (FQDN) associated with the certificate subject. Must be less than or equal to 64 characters in length. | `string` | `""`                | no |
| country | (Optional) Two digit code that specifies the country in which the certificate subject located. Must be less than or equal to 2 characters in length. | `string` | `"SE"`              | no |
| crl\_enabled | (Optional) Boolean value that specifies whether certificate revocation lists (CRLs) are enabled. Defaults to false. | `bool` | `false`             | no |
| custom\_cname | (Optional) Name inserted into the certificate CRL Distribution Points extension that enables the use of an alias for the CRL distribution point. Use this value if you don't want the name of your S3 bucket to be public. Must be less than or equal to 253 characters in length. | `string` | `""`                | no |
| distinguished\_name\_qualifier | (Optional) Disambiguating information for the certificate subject. Must be less than or equal to 64 characters in length. | `string` | `""`                | no |
| expiration\_in\_days | (Required) Number of days until a certificate expires. Must be between 1 and 5000. | `number` | `10`                | no |
| generation\_qualifier | (Optional) Typically a qualifier appended to the name of an individual. Examples include Jr. for junior, Sr. for senior, and III for third. Must be less than or equal to 3 characters in length. | `string` | `""`                | no |
| given\_name | (Optional) First name. Must be less than or equal to 16 characters in length. | `string` | `""`                | no |
| initials | (Optional) Concatenation that typically contains the first letter of the given\_name, the first letter of the middle name if one exists, and the first letter of the surname. Must be less than or equal to 5 characters in length. | `string` | `""`                | no |
| key\_algorithm | (Required) Type of the public key algorithm and size, in bits, of the key pair that your key pair creates when it issues a certificate. Valid values can be found in the: https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CertificateAuthorityConfiguration.html | `string` | `"EC_secp384r1"`    | yes |
| locality | (Optional) The locality (such as a city or town) in which the certificate subject is located. Must be less than or equal to 128 characters in length. | `string` | `"Stockholm"`       | no |
| organization | (Optional) Legal name of the organization with which the certificate subject is affiliated. Must be less than or equal to 64 characters in length. | `string` | `"Organization"`    | no |
| organizational\_unit | (Optional) A subdivision or unit of the organization (such as sales or finance) with which the certificate subject is affiliated. Must be less than or equal to 64 characters in length. | `string` | `""`                | no |
| permanent\_deletion\_time\_in\_days | (Optional) The number of days to make a CA restorable after it has been deleted, must be between 7 to 30 days, with default to 30 days. | `number` | `7`                 | no |
| pseudonym | (Optional) Typically a shortened version of a longer given\_name. For example, Jonathan is often shortened to John. Elizabeth is often shortened to Beth, Liz, or Eliza. Must be less than or equal to 128 characters in length. | `string` | `""`                | no |
| s3\_bucket\_name | (Optional) Name of the S3 bucket that contains the CRL. If you do not provide a value for the custom\_cname argument, the name of your S3 bucket is placed into the CRL Distribution Points extension of the issued certificate. You must specify a bucket policy that allows ACM PCA to write the CRL to your bucket. Must be less than or equal to 255 characters in length. | `string` | `""`                | no |
| signing\_algorithm | (Required) Name of the algorithm your private CA uses to sign certificate requests. Valid values can be found in the: https://docs.aws.amazon.com/acm-pca/latest/APIReference/API_CertificateAuthorityConfiguration.html | `string` | `"SHA512WITHECDSA"` | yes |
| state | (Optional) State in which the subject of the certificate is located. Must be less than or equal to 128 characters in length. | `string` | `""`                | no |
| surname | (Optional) Family name. In the US and the UK for example, the surname of an individual is ordered last. In Asian cultures the surname is typically ordered first. Must be less than or equal to 40 characters in length. | `string` | `""`                | no |
| tags | Default tags. | `map(string)` | `{}`                | no |
| title | (Optional) A title such as Mr. or Ms. which is pre-pended to the name to refer formally to the certificate subject. Must be less than or equal to 64 characters in length. | `string` | `""`                | no |
| type | (Optional) The type of the certificate authority. Defaults to SUBORDINATE. Valid values: ROOT and SUBORDINATE | `string` | `"ROOT"`            | no |

## Outputs

| Name | Description |
|------|-------------|
| ca-arn | ARN of ACM PCA |
| certificate-signing-request | The base64 PEM-encoded certificate signing request (CSR) for your private CA certificate. |

