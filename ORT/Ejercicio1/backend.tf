terraform {
  backend "s3" {
    bucket = "mys3bucketterraform"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt = true
  }
}
