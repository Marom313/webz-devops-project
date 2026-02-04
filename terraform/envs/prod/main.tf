provider "aws" {
  region = var.aws_region
}

########################
# VPC
########################
module "vpc" {
  source = "../../modules/vpc"

  name                 = var.name
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = var.tags
}

########################
# IAM
########################
module "iam" {
  source = "../../modules/iam"

  name = var.name
  tags = var.tags
}

########################
# EKS
########################
module "eks" {
  source = "../../modules/eks"

  name               = var.name
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids

  eks_cluster_role_arn = module.iam.eks_cluster_role_arn
  eks_node_role_arn    = module.iam.eks_node_role_arn

  node_desired_size = 3
  node_min_size     = 3
  node_max_size     = 3

  tags = var.tags
}

########################
# Jenkins EC2
########################
module "jenkins" {
  source = "../../modules/jenkins-ec2"

  name                  = var.name
  vpc_id                = module.vpc.vpc_id
  private_subnet_id     = module.vpc.private_subnet_ids[0]
  instance_profile_name = module.iam.jenkins_instance_profile_name

  allowed_ssh_cidr = "0.0.0.0/0"
  tags             = var.tags
}
