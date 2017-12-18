provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}

resource "aws_ssm_parameter" "s3_bucket_mumbai" {
  provider  = "aws.mumbai"
  name      = "${var.param_tfstate_s3_bucket}"
  type      = "String"
  value     = "${aws_s3_bucket.terraform_state.id}"
  overwrite = true
  tags      = "${var.tags}"
}

resource "aws_ssm_parameter" "dynamodb_table_mumbai" {
  provider  = "aws.mumbai"
  name      = "${var.param_tfstate_dynamodb}"
  type      = "String"
  value     = "${aws_dynamodb_table.terraform_statelock.id}"
  overwrite = true
  tags      = "${var.tags}"
}

resource "aws_ssm_parameter" "backend_region_mumbai" {
  provider  = "aws.mumbai"
  name      = "${var.param_tfstate_region}"
  type      = "String"
  value     = "${data.aws_region.current.name}"
  overwrite = true
  tags      = "${var.tags}"
}
