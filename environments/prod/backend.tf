terraform {
  backend "s3" {
    bucket = "tf-balu-prod"
    key = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}