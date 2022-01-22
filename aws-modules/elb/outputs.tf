output "this_lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = concat(aws_elb.this.*.dns_name, [""])[0]
}
