# **Serverless Image Thumbnail Generator**

- It generates 128 x 128 thumbnail, whenever an image is uploaded in source bucket.
- Lambda functiion downloads image frome source bucket, process & transforms it using Python PIL package, stores/uploads output in destination bucket.
- 
- Terraform is used to automate infrastructure provisioning & maintenance. Thus promoting Infrastructure as Code (IaC).
- Technologies used : **AWS S3, AWS Lambda, Terraform**

#### **Configuration**
- S3 buckets :
    - source : Where the objects/files (images) will be uploaded
    - destination : Where the transformed images/ thumbnail will stored (in `thumnails/` folder)
- Lamda
    - Runtime : Python 3.12
    - Layers : Pillow Library, for ap-south-1 | Mumbai : `arn:aws:lambda:ap-south-1:770693421928:layer:Klayers-p312-pillow:1` | [Check this LINK](https://github.com/keithrozario/Klayers)


**NOTE**
1. The reason we have created two buckets, is due to use of S3 event notifications as a trigger to Lambda function. As using the same bucket, it will unnessarily call Lambda function & we have to add logic to stop if thumbnail is already created for a particular image.
2. In future, we will implement thumnail generation for multiple/additional file formats like **PDF, Video files(mp4)**, etc.. We will implement **AWS SNS & SES** to send email/notify the owner/user about any failed operation of Lambda.
3. Additionally, we can implement **Amazon Eventbridge** along with **SQS** as buffer and Dead Letter Queue for enhance scalability & Fault Tolerance.


## **Architecture**
![arch-serverless-thumbnail-generator](https://github.com/user-attachments/assets/74c60f0f-6f71-4cbc-9fcd-b2182fe633ce)

---
### **Screenshots**

| Detail | Output |
|--------|--------|
|Buckets Created| <img width="548" alt="s3-1-buckets" src="https://github.com/user-attachments/assets/53f61b42-fb86-4432-bab3-6a949267ec32"> |
|Source Bucket Contents| <img width="499" alt="s3-2-source-bucket" src="https://github.com/user-attachments/assets/cca7ae07-21df-42e5-b7d8-8c453e051ab6"> |
|Destination Bucket Contents| <img width="515" alt="s3-3a-destination-bucket" src="https://github.com/user-attachments/assets/b4c9e338-015b-4ce9-acbd-b57d22c2f3e7"> |
|Destination Bucket Folder| <img width="433" alt="s3-3b-destination-bucket-thumbnails" src="https://github.com/user-attachments/assets/73ecc948-6039-46a2-804e-5d2e0450f4d5"> |
|Final Thumbnail| ![s3-5-ouput-dp](https://github.com/user-attachments/assets/f612077d-8320-42d5-a351-decdc88c7bab) |












---
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
