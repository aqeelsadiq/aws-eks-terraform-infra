aws_region = "us-east-1"

vpc_configs = {
    vpc_name = "vpc-a"
    cidr                    = "10.0.0.0/16"
    azs                     = ["us-east-1a", "us-east-1b"]
    public_subnets          = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnets         = ["10.0.101.0/24", "10.0.102.0/24"]
    enable_dns_hostnames    = true
    enable_dns_support      = true
    enable_ipv6             = false
    create_vpc              = true
    create_igw              = true
    single_nat_gateway      = false
    one_nat_gateway_per_az  = false
    map_public_ip_on_launch = true
    enable_nat_gateway      = true
}

env = "dev"
identifier = "demoproject"


# region      = "us-east-1"

cluster_name = "dev-eks-cluster"


instance_types = ["t3.medium"]

node_min_size     = 1
node_max_size     = 3
node_desired_size = 2
