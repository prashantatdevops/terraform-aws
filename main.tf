provider "aws" {
  access_key = "AKIAU5CNGJB3IOZXQ5ER"
  secret_key = "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"
  region = "us-east-1"
}

module "my_vpc" {
  source      = ".//modules/vpc"
  vpc_cidr    = "192.168.0.0/16"
  tenancy     = "default"
  vpc_id      = "${module.my_vpc.vpc_id}"
  subnet_cidr = "192.168.1.0/24"
}

module "my_ec2" {
  source        = ".//modules/ec2"
  ec2_count     = 1
  ami_id        = "ami-5a8da735"
  instance_type = "t2.micro"
  subnet_id     = "${module.my_vpc.subnet_id}"
}
