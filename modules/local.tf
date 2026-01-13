locals {
  identifier       = "${var.identifier}-${var.env}"
  vpc_id           = module.vpc.vpc_id
}


locals {
  vpc_name = "${var.identifier}-${var.env}-vpc"
  default_tags = {
  }
}