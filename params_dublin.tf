provider "aws" {
  alias  = "dublin"
  region = "eu-west-1"
}

resource "aws_ssm_parameter" "s3_bucket_eu1" {
  provider  = "aws.dublin"
  name      = "/terraform/backend/bucket"
  type      = "String"
  value     = "${aws_s3_bucket.terraform_state.id}"
  overwrite = true
}

resource "aws_ssm_parameter" "dynamodb_table_eu1" {
  provider  = "aws.dublin"
  name      = "/terraform/backend/dynamodb_table"
  type      = "String"
  value     = "${aws_dynamodb_table.terraform_statelock.id}"
  overwrite = true
}

resource "aws_ssm_parameter" "backend_region_eu1" {
  provider  = "aws.dublin"
  name      = "/terraform/backend/region"
  type      = "String"
  value     = "${data.aws_region.current.name}"
  overwrite = true
}
