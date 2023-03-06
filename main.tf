data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }


  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

resource "aws_s3_bucket" "blog-bucket" {
  bucket = "terraform-bucket-06032023-2"
  tags = {
    Name        = "Blog Bucket"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_acl" "blog-bucket-acl" {
  bucket = aws_s3_bucket.blog-bucket.id
  acl = "public-read-write"
}
resource "aws_s3_bucket_versioning" "blog-bucket-versioning" {
  bucket = aws_s3_bucket.blog-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
module "first-dynamodb-table-tf-module" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "3.1.2"

  name     = "My_First_Table"
  hash_key = "UserId"
  
  attributes = [
    {
        name = "UserId",
        type = "S"
    }
  ]

    local_secondary_indexes = [
        {
            name = "test"
        }
    ]

  tags = {
    Terraform = "true"
    Environment = "staging"
  }
}