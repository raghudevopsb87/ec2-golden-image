provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-b87"
    key    = "ec2-golden-image/terraform.tfstate"
    region = "us-east-1"
  }
}


