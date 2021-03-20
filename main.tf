provider "aws" {
      region     = "${var.region}"
      access_key = "${var.access_key}"
      secret_key = "${var.secret_key}"
}


module "website_s3_bucket" {
  source = "./modules/aws-s3"

  bucket_name = "${var.bucket_name}"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
