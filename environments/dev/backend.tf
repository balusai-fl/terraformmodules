terraform {
  backend "s3" {
    bucket = "tf-balu-dev"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}