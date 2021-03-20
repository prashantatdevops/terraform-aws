provider "aws" {
      region     = "us-east-1"
      access_key = "AKIAU5CNGJB3IOZXQ5ER"
      secret_key = "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"
}


module "website_s3_bucket" {
  source = "./modules/aws-s3"

  bucket_name = "${var.bucket_name}"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
