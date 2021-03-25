provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.66.0"

#  for_each = var.project

  cidr = var.vpc_cidr_block

  azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "app_security_group" {
  source  = "terraform-aws-modules/security-group/aws//modules/web"
  version = "3.17.0"

#  for_each = var.project

  name        = "web-server-sg-dev"
  description = "Security group for web-servers with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}


module "ec2_instances" {
  source = "./modules/aws-instance"

  for_each = var.project

  instance_count     = 1
  instance_type      = var.instance_type
  subnet_ids         = module.vpc.private_subnets[*]
#  security_group = [module.app_security_group.name]

  project_name = "test"
  environment  = "dev"
}


module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-s3-buckettest-alucumusbucket"
  acl    = "private"

  versioning = {
    enabled = true
  }

}
#module "ecs-fargate-task-definition" {
#  source  = "cn-terraform/ecs-fargate-task-definition/aws"
#  version = "1.0.22"
#  name_prefix= "test-ecs"
#  container_name = "ecsname"
#  container_image = "ecsimage"
#}

