output "aws_bucket_id" {
  value = aws_s3_bucket.blog-bucket.id
}
output "aws_bucket_arn" {
    value = aws_s3_bucket.blog-bucket.arn
}
output "aws_bucket_region" {
  value = aws_s3_bucket.blog-bucket.region
}