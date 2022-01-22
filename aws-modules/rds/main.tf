### Get password from SSM
data "aws_ssm_parameter" "password" {
  name = var.ssm_name
}

### Main module that sets up RDS instance
module "rds" {
  source = "./source"

  identifier                            = var.name
  engine                                = var.engine
  engine_version                        = var.engine_version
  instance_class                        = var.instance_class
  allocated_storage                     = var.allocated_storage
  storage_encrypted                     = var.storage_encrypted
  name                                  = var.name
  username                              = var.username
  password                              = data.aws_ssm_parameter.password.value
  port                                  = var.port
  multi_az                              = var.multi_az
  vpc_security_group_ids                = var.vpc_security_group_ids
  maintenance_window                    = var.maintenance_window
  backup_window                         = var.backup_window
  backup_retention_period               = var.backup_retention_period
  enabled_cloudwatch_logs_exports       = var.enabled_cloudwatch_logs_exports
  subnet_ids                            = var.subnet_ids
  family                                = var.family
  major_engine_version                  = var.major_engine_version
  final_snapshot_identifier             = var.final_snapshot_identifier
  deletion_protection                   = var.deletion_protection
  parameters                            = var.parameters
  tags                                  = var.tags
  auto_minor_version_upgrade            = var.auto_minor_version_upgrade
  performance_insights_enabled          = var.performance_insights_enabled
  max_allocated_storage                 = var.max_allocated_storage
  monitoring_interval                   = var.monitoring_interval
  performance_insights_retention_period = var.performance_insights_retention_period
  additional_tags                       = var.additional_tags
}
