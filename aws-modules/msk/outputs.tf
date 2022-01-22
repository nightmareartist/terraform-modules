output "msk_cluster_zookeeper_connect_string" {
  value       = join("", aws_msk_cluster.default.*.zookeeper_connect_string)
  description = "A comma separated list of one or more IP:port pairs to use to connect to the Apache Zookeeper cluster"
}

output "msk_cluster_bootstrap_brokers" {
  value       = join("", aws_msk_cluster.default.*.bootstrap_brokers)
  description = "Plaintext connection host:port pairs"
}

output "msk_cluster_bootstrap_brokers_tls" {
  value       = join("", aws_msk_cluster.default.*.bootstrap_brokers_tls)
  description = "TLS connection host:port pairs"
}

output "kafka_brokers" {
  value       = join("", aws_msk_cluster.default.*.bootstrap_brokers_tls)
  description = "TLS connection host:port pairs"
}

output "kafka_brokers_plaintext" {
  value       = join("", aws_msk_cluster.default.*.bootstrap_brokers)
  description = "Plaintext connection host:port pairs"
}

output "msk_cluster_id" {
  value = join("", aws_msk_cluster.default.*.id)
}

output "msk_cluster_arn" {
  value = join("", aws_msk_cluster.default.*.arn)
}

output "msk_cluster_name" {
  value       = join("", aws_msk_cluster.default.*.cluster_name)
  description = "The name of the MSK cluster"
}

output "kafka_brokers_sasl" {
  value       = replace(replace(join("", aws_msk_cluster.default.*.zookeeper_connect_string), "2181", "9096"), "z-", "b-")
  description = "SASL connection host:port pairs"
}
