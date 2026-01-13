

variable "aws_region" {}

################################################################################
# VPC
################################################################################
variable "tags" {}

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