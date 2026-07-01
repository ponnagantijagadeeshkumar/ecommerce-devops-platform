provider "aws" {
  region = "ap-south-1"
}

module "demo" {
  source = "./modules"
}