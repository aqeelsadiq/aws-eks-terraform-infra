

variable "aws_region" {}

################################################################################
# VPC
################################################################################
# variable "tags" {}

variable "vpc_configs" {
  description = "Map of VPC configurations"
  type = object({
    vpc_name = string
    cidr                    = string
    azs                     = list(string)
    public_subnets          = list(string)
    private_subnets         = list(string)
    enable_dns_hostnames    = bool
    enable_dns_support      = bool
    enable_ipv6             = bool
    create_vpc              = bool
    create_igw              = bool
    single_nat_gateway      = bool
    one_nat_gateway_per_az  = bool
    map_public_ip_on_launch = bool
    enable_nat_gateway      = bool
  })
}

variable "identifier" {}
variable "env" {}



# variable "region" {
#   description = "AWS region"
#   type        = string
# }

# variable "environment" {
#   description = "Environment name"
#   type        = string
# }

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.29"
}

# variable "vpc_id" {
#   description = "Existing VPC ID"
#   type        = string
# }

# variable "private_subnet_ids" {
#   description = "Private subnet IDs for EKS"
#   type        = list(string)
# }

variable "instance_types" {
  description = "EC2 instance types for worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_min_size" {
  type    = number
  default = 1
}

variable "node_max_size" {
  type    = number
  default = 3
}

variable "node_desired_size" {
  type    = number
  default = 2
}
