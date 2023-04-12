provider "aws"{
    region="ap-southeast-1"
}
terraform {
  required_providers {
    aws = {
        version = "~> 3.0"
        source="hashicorp/aws"
    }
  }
}
