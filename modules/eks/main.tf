module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.31"

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnet_ids   

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      instance_types = ["t2.micro"]
      min_size       = 1
      max_size       = 3
      desired_size   = 2

      subnet_ids = var.private_subnet_ids
    }
  }

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}
