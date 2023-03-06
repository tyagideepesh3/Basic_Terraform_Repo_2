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
#module "first-dynamodb-table-tf-module" {
#  source  = "terraform-aws-modules/dynamodb-table/aws"
#  version = "3.1.2"
#
#  name     = "My_First_Table"
#  hash_key = "UserId"
#  
# attributes = [
#    {
#        name = "UserId",
#        type = "S"
#    }
#  ]
#  tags = {
#    Terraform = "true"
#    Environment = "staging"
#  }
#}
resource "aws_dynamodb_table" "res-dynamodb-table-tf-rec" {
  name = "User-Table"
  billing_mode = "PROVISIONED"
  read_capacity = 5
  write_capacity = 5
  attribute {
    name = "UserId"
    type = "S"
  }
  hash_key = "UserId"
  tags = {
    name        = "Demo Dynamo Db"
    Environment = "testing"
  }
}
resource "aws_dynamodb_table_item" "item1" {
  depends_on = [
    aws_dynamodb_table.res-dynamodb-table-tf-rec
  ]
  table_name = aws_dynamodb_table.res-dynamodb-table-tf-rec
  hash_key   = aws_dynamodb_table.res-dynamodb-table-tf-rec.hash_key
  item = <<ITEM
  {
    "UserId" : {"S":"001"},
    "UserName" : {"S":"Devu"},
    "Phone Number" : {"N":9272111100},
    "UserAddress" : {"S": "874/2-1 , dev prayag , UTTARAKHAND"}
  }
  ITEM
}
resource "aws_dynamodb_table_item" "item2" {
  depends_on = [
    aws_dynamodb_table.res-dynamodb-table-tf-rec
  ]
  table_name = aws_dynamodb_table.res-dynamodb-table-tf-rec
  hash_key   = aws_dynamodb_table.res-dynamodb-table-tf-rec.hash_key
  item = <<ITEM
  {
    "UserId" : {"S":"002"},
    "UserName" : {"S":"Deepu"},
    "Phone Number" : {"N":9272111101},
    "UserAddress" : {"S": "874/2-2 , dev prayag , UTTARAKHAND"}
  }
  ITEM
}
resource "aws_dynamodb_table_item" "item3" {
  depends_on = [
    aws_dynamodb_table.res-dynamodb-table-tf-rec
  ]
  table_name = aws_dynamodb_table.res-dynamodb-table-tf-rec
  hash_key   = aws_dynamodb_table.res-dynamodb-table-tf-rec.hash_key
  item = <<ITEM
  {
    "UserId" : {"S":"001"},
    "UserName" : {"S":"Ayush"},
    "Phone Number" : {"N":9272111102},
    "UserAddress" : {"S": "874/3-3 , dev prayag , UTTARAKHAND"}
  }
  ITEM
}