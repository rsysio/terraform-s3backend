provider "aws" {
  alias  = "california"
  region = "us-west-1"
}

resource "aws_ssm_parameter" "s3_bucket_california" {
  provider  = "aws.california"
  name      = "${var.param_tfstate_s3_bucket}"
  type      = "String"
  value     = "${aws_s3_bucket.terraform_state.id}"
  overwrite = true
}

resource "aws_ssm_parameter" "s3_bucket_arn_california" {
  provider  = "aws.california"
  name      = "${var.param_tfstate_s3_bucket}/arn"
  type      = "String"
  value     = "${aws_s3_bucket.terraform_state.arn}"
  overwrite = true
}

resource "aws_ssm_parameter" "dynamodb_table_california" {
  provider  = "aws.california"
  name      = "${var.param_tfstate_dynamodb}"
  type      = "String"
  value     = "${aws_dynamodb_table.terraform_statelock.id}"
  overwrite = true
}

resource "aws_ssm_parameter" "dynamodb_table_arn_california" {
  provider  = "aws.california"
  name      = "${var.param_tfstate_dynamodb}/arn"
  type      = "String"
  value     = "${aws_dynamodb_table.terraform_statelock.arn}"
  overwrite = true
}

resource "aws_ssm_parameter" "backend_region_california" {
  provider  = "aws.california"
  name      = "${var.param_tfstate_region}"
  type      = "String"
  value     = "${data.aws_region.current.name}"
  overwrite = true
}
