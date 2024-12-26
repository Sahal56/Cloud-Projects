resource "aws_iam_role" "ec2_role" {
  name        = "${var.project_name}-ec2-role"
  description = "Allows EC2 instances to call AWS services on your behalf"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${var.project_name} ec2-role"
  }

}
# Attaching Policies
resource "aws_iam_policy_attachment" "s3_readonly" {
  name       = "AmazonS3ReadOnlyAccess"
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

# IAM Instance Profile
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  depends_on = [aws_iam_role.ec2_role]
  name       = "${var.project_name}-ec2-role"
  role       = aws_iam_role.ec2_role.name
}
