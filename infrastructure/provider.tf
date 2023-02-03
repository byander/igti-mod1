provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "terraform-igti-890625003384"
    key    = "state/igti/mod1/terraform.tfstate"
    region = "us-east-2"
  }
}