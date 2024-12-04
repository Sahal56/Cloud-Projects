Aim: Building Serverless Image thumbnail generator using Lamda
- use s3 buckets : source & destination
- lamda runtime is Python 3.12 & with addon layer of Pillow Library (check sources at bottom)
- Using Terraform to implement IaC

# Steps

1. Setup AWS S3 Bucket
Create two S3 buckets

2. Setup IAM Role for Lambda
we have to attach policies to this role
- AmazonS3FullAccess
- CloudWatchLogsFullAccess

3. Create Lambda Function
- we have to mention runtime with version
- layer with arn

4. Write the Lambda Function code
- then package into zip file

5. Add Trigger to the Lambda Function
- source bucket for trigger
- event: PUT
- prefix & suffix as options

6. Test the Setup

```shell
terraform init
terraform plan
terraform apply
```

In AWS S3 console, upload image/s in source bucket & see output in destination bucket

Also, Check CloudWatch Log Groups

Additionally, In AWS Lambda Console, we can test our Lambda
## Test Evenet:
```json
{
  "Records": [
    {
      "s3": {
        "bucket": {
          "name": "thumbnail-source-bucket-sahal"
        },
        "object": {
          "key": "dp.jpg"
        }
      }
    }
  ]
}
```


make file
<u> terraform.tfvars </u>
```
source_bucket      = "Your Source Bucket Name"
destination_bucket = "Your Destination Bucket Name"
```


Debugging & Error Fixing Sources :
https://derekurizar.medium.com/aws-lambda-python-pil-cannot-import-name-imaging-11b2377d31c4
https://github.com/keithrozario/Klayers/tree/master/deployments/python3.12