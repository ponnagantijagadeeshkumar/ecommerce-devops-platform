terraform {
  backend "s3" {
    bucket         = "devops-799918206960-tfstate"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
  }

}