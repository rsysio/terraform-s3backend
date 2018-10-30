provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 0.11.8"
}

data "aws_region" "current" {}
