module "dispatch-ami" {
  source      = "git::https://github.com/raghudevopsb61/terraform-ami.git"
  COMPONENT   = "dispatch"
  APP_VERSION = var.APP_VERSION
}

variable "APP_VERSION" {}

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-b61"
    key    = "ami/dispatch/terraform.tfstate"
    region = "us-east-1"
  }
}

