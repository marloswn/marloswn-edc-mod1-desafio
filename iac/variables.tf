# Variables
variable "base_bucket_name" {
  default = "datalake-marlos-tf"
}

variable "environment" {
  default = "producao"
}

variable "account" {
  default = "693916676536"
}

variable "lambda_function_name" {
  default = "ExecutaEMR"
}