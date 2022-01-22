output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.rds.this_db_instance_address
}

output "db_instance_name" {
  description = "The database name"
  value       = module.rds.this_db_instance_name
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = var.username
}

output "db_instance_id" {
  description = "The database instance id"
  value       = module.rds.this_db_instance_id
}
