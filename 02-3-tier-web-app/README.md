# **3-Tier Web Application**
- Architected & Deployed 3-Tier Web Application in AWS with Multi AZ support (3 Availability Zones).
- Utilized Load Balancing & Auto Scaling for both Web-tier & App-Tier for High Availability & Fault Tolerance.
- Secured the Infrastructure with help of Security Groups and isolated Subnets.
- Achived significant cost cut & simplified configuration management by utilizing **S3 Gateway Endpoint**, **EC2 Instance Connect Endpoint**.
- Implemented automatic infrastructure & services provising and maintenance using **Terraform (IaC)**.
- Tested manual failover of Aurora Multi-AZ database to standby instance using the AWS Management Console to ensure high availability and disaster recovery.
- Monitored the status of both Web & App Tier's Instances using **CloudWatch Alarms** to ensure optimal resource utilization and performance.


## **Architecture**

![architecture-3-tier-web-app](https://github.com/user-attachments/assets/a3150b6f-1704-44a9-8f7e-fe9624bfe056)

Overview :
- As shown above, in our 3-Tier architecture comprising of Web Tier, App Tier and Database Tier, public facing Application Load Balancer forwards serves as endpoint for clients.
- ALB forwards client's request to Web Tier Instances which are running Nginx reverse proxy that serves React.js website (Front-end)
- Front end redirects our API calls to App Tier's Internal Application Load Balancer
- Internal ALB, which iin turns forwards traffic to App Tier's Instances which is configurred to run Node.js app service (Back-end)
- Back end manipulates data in an Aurora (MySQL compatible) Multi-AZ Database and returns it to Web Tier.

Other Details :
- security :
    - configured security group to recieve incoming traffic from specified security group only. i.e web tier instances SG onnly allow HTTP traffic from ALB SG and so on
    - default NACL is utilised as of now. (will improve in future versions)
    - S3 bucket has restrictive Policy which allows acces to only specified Role following prinicple of least privilege
    - IAM Role and Instance Profile for our EC2 instance.
- Application code files, web-tier, app-tier & nginx.conf file is stored in S3 bucket. In addition to this, S3 Gatewat Endpoint is utilised to allow EC2 instances or any resources in VPC to access our bucket with less networking costs.
- For creating AMI : (used AWS Management Console)
    - Web Tier : Temporary Instance launched in Public Subnet. EC2 instance connect is used to connect Launch Instance. Installed necessary packages & code files, configuring Nginx to redirect request to Internal ALB
    - App Tier : Temporary Instance launched in Private Subnet. We have deployed **EC2 Instance Connect Endpoint (launched in June 2023)** in our Private Subnet which allows hassle free ssh access to our intsancess just by modifying security group rules
    - Region : us-east-1 | N.Virginia


> Note : In Aurora, I have not created the Read Replica due to extra 💸 costs for each new replica/instance. We will include in Future version of this project with better 🧑‍💻 Web Application 💯.

> **👇👇👇DETAILED EXPLANATION GIVEN BELOW👇👇👇**

---
## **Prerequisites**
- This project comprises some costs. (Used AWS Credits)
- For an estimate running of 3 hours, it should be < $3.
- We have used region : `us-east-1`, so prices of some services are on basis of that region.

| **Service**    | **EC2** | **EBS** | **ELB** | **CloudWatch** | **RDS** |
|----------------|---------|---------|---------|----------------|---------|
|Free Tier Limits| <img width="270" alt="prequisite-ec2" src="https://github.com/user-attachments/assets/b49faa47-6bc9-464b-9438-a123b5decc0d" /> | <img width="263" alt="prequisite-elastic-block-storage" src="https://github.com/user-attachments/assets/459027d7-0a0c-42ca-8008-0ba205082be4" /> | <img width="262" alt="prequisite-elastic-load-balancing" src="https://github.com/user-attachments/assets/994b382c-1e5b-41ff-a758-385b692ea98d" /> | <img width="263" alt="prequisite-cloudwatch" src="https://github.com/user-attachments/assets/f9673388-e152-4e92-82f8-3891080bdae6" /> | <img width="266" alt="prequisite-rds" src="https://github.com/user-attachments/assets/92876c17-402c-43ac-a7e9-8e817511cf80" /> |

- Although RDS come under free tier, but we have utilised Aurora, along with Multi-AZ. So will be charged for 2 Instances: Primary and Standby
- Some services used in this project not covered under free tier
- Region : `N.Virginia | us-east-1`

| **Service**    | **NAT Gateway** | **Elastic-IP for NAT** | **Auroura** |
|----------------|-----------------|------------------------|-------------|
| Charges        | <img width="610" alt="pricing-nat-gw-us-east-1" src="https://github.com/user-attachments/assets/1ca2424e-b05a-475a-9bf3-5229446d89c4" /> | <img width="663" alt="pricing-public-ip" src="https://github.com/user-attachments/assets/4aab1ff5-4212-4657-bac6-407efa1e8a88" /> |<img width="752" alt="pricing-aurora-us-east-1" src="https://github.com/user-attachments/assets/b9884d08-6c62-4757-9163-7575949ba120" /> |



---
## **Output**
![proj-3-tier-recording-2-short-crud](https://github.com/user-attachments/assets/1898625b-0a2c-41ed-a03d-09349696456a)

#### **Video - Web App**
Check out at Drive : [Link](https://drive.google.com/file/d/1ZTtZSYkkQ2KowFhqZti1SnSH_pdNzdaB/view?usp=drive_link)

#### **Video - Aurora DB Failover**
https://github.com/user-attachments/assets/3f860210-9560-4c7a-a394-7c164316bcbc

#### **Screenshots - Laptop**
<img width="1401" alt="proj-3-tier-2-output-1" src="https://github.com/user-attachments/assets/8ff8d901-207e-444c-8b1e-12b86a6253bf" />

<img width="1439" alt="proj-3-tier-2-output-2" src="https://github.com/user-attachments/assets/704a922d-2397-4d0a-b686-01ba9416ec0f" />

<img width="1389" alt="proj-3-tier-2-output-3" src="https://github.com/user-attachments/assets/48ad83cc-8e83-45f8-9afb-59ba1f5479d0" />

> For All Laptop & Mobile SS : [🎯Click-here🎯](./results/README.md)

> ALso, there is slight mistake from my side in Output SS, Arch Diagram has `us-south-1c`, it should be `us-east-1c` which I have corrected after.

---
## **Explanation**

1. **Networking & Security**:
    1. Virtual Private Cloud (VPC) is created in AWS Region `us-east-1` or N.Virginia, with CIDR `10.0.0.0/16` (Max Size allowed in AWS for VPC, Addresses: 65,536).
    2. Three Avaialability Zones (AZ) are used `us-east-1a`, `us-east-1b`. `us-east-1c`.
    3. Subnets : Total: `9` Subnets | for each Tier : `3`, Subnets, `256` Addresses
        - Web Tier : `10.0.0.1/24`, `10.0.0.2/24`, `10.0.0.3/24`
        - App Tier : `10.0.0.4/24`, `10.0.0.5/24`, `10.0.0.6/24`
        - Database Tier: `10.0.0.7/24`, `10.0.0.8/24`, `10.0.0.9/24`
    4. Internet Gateway attached to our VPC.
    5. Route Tables :
        1. Route Table for Public Subnets : Allows outbound '0.0.0.0/0' to Internet via Internet Gateway.
        2. Route Table for Private Subnets : Allow communication inside our VPC CIDR. Temporary Route Entry with target as NAT Gateway for Internet Access, while creating AMI for App-Tier instances.
        3. Route Table for Database Subnets : Allow communication inside our VPC CIDR.
        4. Route Table created by Default when VPC is created, kept as it is.
    6. Security Groups :
        1. ALB SG : Allows inbound from anywhere (internet).
        2. Web Tier SG : Allows inbound from ALB SG only.
        3. Internal ALB SG : Allows inbound from Web Tier SG only. Tempoary Inbound Access given to `launch wizard 2` SG, while creation of Web Tier AMI, for backend testing purpose.
        4. App Tier SG : Allows inbound from Internal SG only.
        5. DB Tier SG : Allows inbound from App Tier SG only. Tempoary Access given to EC2 SG, while cretion of App Tier AMI, for testing purpose.
        6. Other SGs (temporary for creating AMIs & connectivity purposes):
            - Web Tier (1) : `launch wizard 2` SG for EC2. SSH + Allow HTTP for EC2 Instance Connect.
            - App Tier (2) : `sg-ec2-instance` SG for EC2 & `sg-ec2-connect-endpoint `SG for EC2 Instance Connect Endpoint for connectivity purpose.
        7. SG created by Default when VPC is created, kept as it is.
2. **IAM** :
    - IAM ROLE :
        - It is created for EC2 instances for both Web & App Tier respectively.
        - IAM Policy : Allows `AmazonS3ReadOnlyAccess`
    - EC2 Instance Profile : It is Based on above IAM Role
3. **Database** :
    - DB Subnet Groups : It includes three AZs. Refer `1. Networking & Security > Subnets > Database Tier` above.
    - DB : Aurora Multi AZ MySQL compatible database
        - Version : Aurora 3.05.2 (compatible with MySQL 8.0). (MySQL old will charge more as per RDS Extended Support)
        - Instance : `db.t4g.medium`, burstable, standard, dev/test
    - NOTE :
        - In Multi AZ, there is one Standby Replica Only. Although we can create Read Replica in AZ `us-east-1b`, for extra cost we have not created it. In future better Web Application we will use it, for SURE 💯
        - Database is stopped temporarily for 1 day! (further Project continued in 2nd day, due to wedding season😅 I have to attend one)
4. **S3** :
    - **S3 Bucket** : It is created in `us-east-1` region, name : `proj-3-tier-bucket-sahal`, with Private Access Control List (ACL), attached policy attached which has restrictive access to EC2's `IAM Role` & `Account User` with only `GetObject, PutObject, DeleteObject` actions, following `**principle of least privilege (PoLP)**`
    - **S3 Gateway Endpoint** : Although EC2 instance, while creating AMIs, can access & read data from our buket, there will be networking costs associated it with(S3 data transfer will go through internet/less secure). So, to avoid we have deployed this endpoint in region and only in Web Tier & App Tier Subnets only. **Benefits** : `Secure Data Transfer | $0 Data transfer cost`
    - Data : It is uploaded via AWS S3 Management Console for simplicity
5. **EC2 Instance Connect Endpoint** :
    - It is new service by AWS (June 2023), which allows to connect (SSH/RDP) to Private EC2 Instance, removing complexity associated with connecting to resources in Private Subnets.
    - So, No to `( Bastion Hosts | Systems Manager SSM)` required to connect to EC2 Instances in Private Subnets (No Public IP).
    - We just have to use & configured Security Groups.
6. **Compute** :
    1. Amazon Machine Image :
        - The process of creating AMI is same for both Tiers with slight difference of `Allocate Public IP` on in Web Tier.
        - Instances eligible for free tier : `amazon linux 2` is being utilized
        - IAM instance profile is created & use as per EC2 Role which has ReadOnlyS3 Access.
        - Standard General Purpose SSD GP3 with 8GB is used
    2. Application Load Balancer (ALB) :
        - Public Facing ALB : It serves as endpoint for Internet Clients. It forwards requests to Web Tier ASG's Instances on `port 80`, where NGINX server is configured to serve React Front-End.
        - Internal ALB : It server as endpoint for Web Tier Instances. It forwards traffic to App Tier ASG's Instances on `port 4000`, where Node.js Service is listening on, to serve Back-End.
        - Target Groups : Both Tiers ALB TG are configured similarly, with session maintenance on Internal is removed
        - Listener Rules : For Both Tier ALB LR, It listens on `port: 80` only HTTP as of now, and forwards traffic/requests to respective target groups.
    3. Auto Scaling Groups (ASG) :
        - There are ASG for both Web Tier and App Tier with capacity `min: 0`, `max: 3` `desired: 1`
        - Same configurations are there for both Tiers with Scaling based on `TargetTrackingScaling` with `ASGAverageCPUUtilization` and threshold as `min: 20%` & `max: 70%` respectively.
        - Launch Template : For both Tiers LT is configure to have respective AMI and VPC Security Groups


<!--
---
## **Setup In-Depth**

- Most of the services are provision using Terraform (Infrastructure as Code), while some paid service like Aurora are provision using AWS Management Console.
- We have used AWS Management Console:
    - For uploading app files to S3 bucket
    - For Creating AMI
    - For Deploying EC2 Connect Endpoint in Private Subnet
    - Temporary Security Group & Temporary In/Outbound Rules modification for testing front-end with back-end and database

#### 1. Basic Environment Setup
- Create a shell file : `set-env.sh` and replace your AWS access key & secret key
> Don't share this file anywhere : post or github
> Use Gitignore to restrict tracking this file

```sh
$ touch set-env.sh
```
```
#!/bin/bash

# Define environment variables
export TF_VAR_region=us-east-1
export TF_VAR_access_key={your access key here}
export TF_VAR_secret_key={your secret key here}
```

Make it executable
```sh
$ chmod +x set-env.sh
```

- every time you use terraform, make sure env variables are set. by running, shown as below
```sh
$ source set-env.sh
```

- Create a varibles file `terraform.tfvars` & replace with your credentials. You can modify CIDR IP Range, Regions, AZ if you want
```sh
user_name    = "your AWS username"
project_name = "your project name"

# VPC
netw_cidr            = "10.0.0.0/16"
vpc_azs              = ["us-east-1a", "us-east-1b", "us-east-1c"]
subnet_public_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
subnet_private_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
subnet_db_cidrs      = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]

s3_bucket_name = "your S3 bucket name"

```

2. Let's provision infrastruture
- we will be provisioning step by step
    1. First of all, in `main.tf` comment out every modules exept `vpc`, `route_tables`, `security_groups`

**Initialize**
```sh
$ terraform init
```

**Plan the Infrastructure**
```sh
$ terraform plan
```
**Apply the Infrastructure**
```sh
$ terraform apply
```
> Enter `yes`, if all appears okay. Alternatively use `-auto-approve` to avoid everytime entering yes

- Isolated Network with following components will be created
    - VPC
    - Subnets
    - Route Tables
    - Internet Gateway
    - Security Groups

-->
---
## **ACKNOWLEDGEMENTS**
- [aws-workshops](https://github.com/aws-samples/aws-three-tier-web-architecture-workshop)
