provider "aws" {
  access_key = var.aws_credentials.aws_access_key
  secret_key = var.aws_credentials.aws_secret_key
  region = var.aws_credentials.aws_region_section
}

module "s3-bucket-storage" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.7.0"

  bucket = "my-s3-bucket-terraform-06032023"
  acl    = "public"
  versioning = {
    enabled = true
  }
}