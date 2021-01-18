provider "aws" {
  region = var.region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.project_name

  cidr = var.network_cidr

  azs             = var.azs
  private_subnets = var.private_sn_cidrs
  public_subnets  = var.public_sn_cidrs

  enable_ipv6 = true

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "${var.project_name}-${var.env}-public-sn"
  }

  tags = {
    Owner       = var.owner
    Environment = var.env
  }

  vpc_tags = {
    Name = "${var.project_name}-${var.env}-vpc"
  }
}