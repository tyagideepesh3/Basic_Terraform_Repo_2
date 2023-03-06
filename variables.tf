variable "aws_credentials" {
  description = "This consists up of AWS credentials"

  type = object({
    aws_access_key = string
    aws_secret_key = string
    aws_region_section = string
  })

  value = {
    aws_access_key = "AKIAYBMN5MBDSWB3GB2C"
    aws_secret_key = "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"
    aws_region_section = "ap-south-1"
  }
}