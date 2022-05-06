terraform {
  backend "s3" {
    bucket = "terraformbuckets3pract12"
    key = "dev/terraform.tfstate"
    region = "us-east-2"
  }
}