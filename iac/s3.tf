resource "aws_s3_bucket" "datalake" {
  bucket = "${var.base_bucket_name}-${var.environment}-${var.account}"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }
<<<<<<< HEAD:iac/s3.tf
} 
=======
} 

resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark_from_tf.py"
  source = "../data/job_spark.py"
  etag   = filemd5("../data/job_spark.py")
}

provider "aws" {
  region = "us-east-2"
}
>>>>>>> 9d4f01a19da6b8491c5527babb9132a6b558d660:iac/main.tf
