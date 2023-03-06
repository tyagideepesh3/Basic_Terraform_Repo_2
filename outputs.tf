output "aws_bucket_id" {
  value = module.s3-bucket-storage.s3_bucket_id
}
output "aws_bucket_arn" {
  value = module.s3-bucket-storage.s3_bucket_arn
}
output "aws_bucket_region" {
  value = module.s3-bucket-storage.s3_bucket_region
}