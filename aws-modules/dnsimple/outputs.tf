# Output A record if it exists
output "record_name_a" {
  value = var.record_type != "NS" ? dnsimple_record.any[0].hostname : null
}

# Output NS record if it exists
output "record_name_ns" {
  value = var.record_type == "NS" ? dnsimple_record.ns[0].hostname : null
}
