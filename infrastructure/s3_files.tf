resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark/job_spark"
  acl    = "private"
  source = "../job_spark.py"
  etag   = filemd5("../job_spark.py")
}
