terraform {
  backend "s3" {
    bucket         = "grekt-infra-remote-state"
    region         = "us-west-2"
    key            = "infra/terraform.tfstate"
    dynamodb_table = "tf-remote-state"
  }
}
