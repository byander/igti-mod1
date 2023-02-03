resource "aws_s3_bucket" "datalake" {

  bucket = "${var.base_bucket_name}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    curso = "igti"
  }
}

resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id
  key = "emr-code/pyspark/job_spark/job_spark"
  acl = "private"
  source = "../job_spark.py"
  etag = filemd5("../job_spark.py")
}
