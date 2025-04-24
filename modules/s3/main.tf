resource "aws_s3_bucket" "main" {
  bucket = "test-bucket-debrin--${var.region}"
}

