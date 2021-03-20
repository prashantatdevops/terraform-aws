# Specify the provider and access details
provider "aws" {
  access_key = "AKIAU5CNGJB3E6OWEPKG"
  secret_key = "Or9vNbSQBSI3FPFC8mYAfsxC5O5APZTLp4XBojsS"
  region = "us-east-1"
}

resource "aws_instance" "terra-sample0" {
  	ami 		= "ami-04169656fea786776"
  	instance_type	= "t2.nano"
}
