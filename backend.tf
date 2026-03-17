terraform {
  backend "s3" {
    bucket = "terra-bucketsasi"
    key    = "vpc/terraform.tfstate"
    region = "ap-south-1"
  }
}