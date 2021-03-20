# Specify the provider and access details
provider "aws" {
  access_key = "AKIAU5CNGJB3IOZXQ5ER"
  secret_key = "IrFJD3H8/zQ1IHj6wjloIleZmj/A85X6GdQyys6z"
  region = "us-east-1"
}

resource "aws_instance" "terra-sample0" {
  	ami 		= "ami-0533f2ba8a1995cf9"
  	instance_type	= "t2.micro"
}
