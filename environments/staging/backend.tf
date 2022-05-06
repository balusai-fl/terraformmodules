terraform {
  backend "s3" {
    bucket = "terraformbuckets3pract12"
    key = "staging/terraform.tfstate"
    region = "us-east-2"
  }
}