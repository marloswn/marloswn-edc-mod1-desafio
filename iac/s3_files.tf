resource "aws_s3_bucket_object" "job_spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark_from_tf.py"
  acl = "private"
  source = "../data/job_spark.py"
  etag   = filemd5("../data/job_spark.py")
}