/*
provider "aws" {
  #alias  = "local"
  region = var.region
}

provider "aws" {
  alias  = "peer"
  region = "us-west-1"
}



terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "~> 1.0"
}
*/
