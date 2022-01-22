# Output A record if it exists
output "record_name_a" {
  value = cloudflare_record.default[0].hostname
}
