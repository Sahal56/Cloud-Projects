resource "aws_lambda_function" "generate_thumbnail" {
  filename         = "./src/lambda_function.zip" # Path to the Lambda zip file
  function_name    = var.lambda_function_name
  role             = aws_iam_role.lambda_exec_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.12"
  source_code_hash = filebase64sha256("./src/lambda_function.zip")

  layers = [
    "arn:aws:lambda:ap-south-1:770693421928:layer:Klayers-p312-pillow:1"
  ]
  # pillow lib is not available
  # we have to use 3rd party source
  # see in README which has link to githuhb repo of maintainer to get arn of layers region/runtime wise
  # :)

  environment {
    variables = {
      DESTINATION_BUCKET = var.destination_bucket
    }
  }
}
