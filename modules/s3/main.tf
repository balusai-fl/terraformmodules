resource "aws_s3_bucket"  "terraform-v12-project" {
  bucket = "${var.bucketname}"
}

resource "aws_s3_bucket_public_access_block" "terraform-v12-project" {
  bucket = "${var.bucketname}"

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "terraform-v12-project_bucket" {
  bucket = "${var.bucketname}"
  acl    = "${var.acl}"
}
   
resource "aws_s3_bucket_versioning" "terraform-v12-project" {
  bucket = "${var.bucketname}"
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_intelligent_tiering_configuration" "itc1" {
  bucket = "${var.bucketname}"
  name = "itc1"
  tiering {
    access_tier = "DEEP_ARCHIVE_ACCESS"
    days = 180
  }
  tiering {
    access_tier = "ARCHIVE_ACCESS"
    days = 120
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "terraform-v12-project" {
  bucket = "${var.bucketname}"
  rule {
    id = "${var.id}"
    expiration {
      days = 90
    }
    status = "Enabled"
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }
  rule {
    filter {
      prefix = "*.jpeg"
    }
    id = "rule-2"
    expiration {
      days = 180
    }
    status = "Enabled"
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
  }
}


