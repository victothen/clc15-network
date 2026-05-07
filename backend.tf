terraform {
  backend "s3" {
    bucket = "clc15-victor-terraform"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}