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


#####################################
# EKS Cluster (Root Module)
#####################################

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids

  #####################################
  # API Access
  #####################################
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  #####################################
  # Security & IAM
  #####################################
  enable_irsa = true

  #####################################
  # Managed Node Group
  #####################################
  eks_managed_node_groups = {
    default = {
      instance_types = var.instance_types

      min_size     = var.node_min_size
      max_size     = var.node_max_size
      desired_size = var.node_desired_size

      subnet_ids = module.vpc.private_subnet_ids
    }
  }

  #####################################
  # Tags
  #####################################
  tags = {
    Environment = var.env
    Terraform   = "true"
  }
}