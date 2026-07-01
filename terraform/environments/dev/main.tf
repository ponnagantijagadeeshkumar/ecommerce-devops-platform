module "vpc" {
  source = "../../modules/vpc"

  environment     = var.environment
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "ecr" {
  source = "../../modules/ecr"

  repository_name = "ecommerce-dev"
  environment     = var.environment
}

module "eks" {
  source = "../../modules/eks"

  environment  = var.environment
  cluster_name = "ecommerce-dev-cluster"

  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids

  node_instance_type = var.node_instance_type

  desired_size = var.desired_size
  min_size     = var.min_size
  max_size     = var.max_size
}

module "jenkins" {
  source      = "../../modules/jenkins"
  environment = var.environment

  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_ids[0]
}

