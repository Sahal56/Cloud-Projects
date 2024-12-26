# Here
# - we will create one S3 bucket
# - S3 Gatweway endpoint
# - connect it to Public and Private Subnet's Route Tables

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name = "${var.project_name} s3-bucket"
  }

}

resource "aws_s3_bucket_ownership_controls" "my_bucket_own_controls" {
  bucket = aws_s3_bucket.my_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "my_bucket_private_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.my_bucket_own_controls]

  bucket = aws_s3_bucket.my_bucket.id
  acl    = "private"
}

# S3 Bucket Policy
resource "aws_s3_bucket_policy" "my_bucket_policy" {
  depends_on = [aws_s3_bucket.my_bucket]
  bucket     = aws_s3_bucket.my_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "AllowReadWriteDelete",
        Effect = "Allow",
        Principal = {
          AWS = [
            var.user_arn,
            var.ec2_role_arn
          ]
        },
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        Resource = "${aws_s3_bucket.my_bucket.arn}/*"
      }
    ]
  })
}

# Create S3 Gateway Endpoint
resource "aws_vpc_endpoint" "s3_gateway" {
  depends_on        = [var.vpc_id]
  vpc_id            = var.vpc_id
  vpc_endpoint_type = "Gateway"
  service_name      = "com.amazonaws.${var.region}.s3"
  route_table_ids   = [var.rt_public_id, var.rt_private_id]

  tags = {
    Name = "${var.project_name} s3-gateway-endpoint"
  }
}
