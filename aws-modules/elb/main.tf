resource "aws_elb" "this" {
  name    = format("%s-%s-%s", var.namespace, var.environment, var.name)
  subnets = var.subnets

  listener {
    instance_port      = var.listener_instance_port
    instance_protocol  = "tcp"
    lb_port            = 443
    lb_protocol        = "ssl"
    ssl_certificate_id = var.listener_ssl_certificate_id
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = var.health_check_timeout
    target              = var.health_check_target
    interval            = var.health_check_interval
  }

  instances       = var.instances
  security_groups = var.security_groups

  cross_zone_load_balancing   = var.cross_zone_load_balancing
  idle_timeout                = 60
  connection_draining         = false
  connection_draining_timeout = 300
  internal                    = false

  tags = var.tags
}
