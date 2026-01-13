#####################
# VPCs
#####################
module "vpc" {
  source = "../modules/vpc"

  vpc_name                = var.vpc_configs.vpc_name
  cidr                    = var.vpc_configs.cidr
  azs                     = var.vpc_configs.azs
  public_subnets          = var.vpc_configs.public_subnets
  private_subnets         = var.vpc_configs.private_subnets
  enable_dns_hostnames    = var.vpc_configs.enable_dns_hostnames
  enable_dns_support      = var.vpc_configs.enable_dns_support
  enable_ipv6             = var.vpc_configs.enable_ipv6
  create_vpc              = var.vpc_configs.create_vpc
  create_igw              = var.vpc_configs.create_igw
  single_nat_gateway      = var.vpc_configs.single_nat_gateway
  one_nat_gateway_per_az  = var.vpc_configs.one_nat_gateway_per_az
  map_public_ip_on_launch = var.vpc_configs.map_public_ip_on_launch
  enable_nat_gateway      = var.vpc_configs.enable_nat_gateway
  tags = local.default_tags
}