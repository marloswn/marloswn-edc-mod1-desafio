provider "aws" {
  region = "us-east-2"
}

# Centralizar o arquivo de controle de estado do Terraform
terraform {
  backend "s3" {
    bucket = "terraform-state-marlos"
    key    = "state/igti/edc/mod1/desafio/terraform.tfstate"
    region = "us-east-2"
  }
}
