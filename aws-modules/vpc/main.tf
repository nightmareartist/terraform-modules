module "vpc" {
  source                  = "./source"
  name                    = var.name
  cidr                    = var.cidr
  azs                     = var.availability_zones
  private_subnets         = var.private_subnets
  public_subnets          = var.public_subnets
  database_subnets        = var.database_subnets
  enable_nat_gateway      = var.enable_nat_gateway
  enable_vpn_gateway      = var.enable_vpn_gateway
  enable_dns_support      = var.enable_dns_support
  enable_dns_hostnames    = var.enable_dns_hostnames
  map_public_ip_on_launch = var.map_public_ip_on_launch
  one_nat_gateway_per_az  = var.one_nat_gateway_per_az
  single_nat_gateway      = var.single_nat_gateway
  enable_ipv6             = var.enable_ipv6
  tags                    = var.tags
  public_subnet_tags      = var.public_subnet_tags
  private_subnet_tags     = var.private_subnet_tags
}

# Alter default security group, give it readable name and block all traffic by default
resource "aws_default_security_group" "default" {
  vpc_id = module.vpc.vpc_id

  ingress = var.aws_default_security_group_ingress
  egress  = var.aws_default_security_group_egress

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-default"
    }
  )
}
