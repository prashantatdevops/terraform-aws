# Specify the provider and access details
provider "aws" {
  access_key = "Enter Your access Key"
  secret_key = "Enter Your Secret Key"
  region = "us-east-1"
}

resource "aws_instance" "terra-sample0" {
  	ami 		= "ami-0533f2ba8a1995cf9"
  	instance_type	= "t2.micro"
}
