terraform {
  backend "s3" {
    bucket = "tf-balu-stg"
    key = "staging/terraform.tfstate"
    region = "us-east-1"
  }
}