resource "aws_s3_bucket" "terraform_state" {
  bucket_prefix = "tfstate-"
  acl           = "private"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = "${var.tags}"
}
