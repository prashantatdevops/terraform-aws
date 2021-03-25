variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "project" {
  description = "Map of project names to configuration"
  type        = map(any)
  default = {
    project-alpha = {
      public_subnet_count  = 2,
      private_subnet_count = 2,
      instances_per_subnet = 2,
      instance_type        = "t2.micro",
      environment          = "dev"
    }
  }
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "instance_type" {
  description = "instance type"
  type        = string
  default     = "t2.nano"
}




