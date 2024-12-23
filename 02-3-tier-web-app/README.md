# **3-Tier Web Application**
- Architected & Deployed 3-Tier Web Application in AWS with Multi AZ support (3 Availability Zones).
- Utilized Load Balancing & Auto Scaling for both Web-tier & App-Tier for High Availability & Fault Tolerance.
- Secured the Infrastructure with help of Security Groups and isolated Subnets.
- Achived significant cost cut & simplified configuration management by utilizing **S3 Gateway Endpoint**, **EC2 Instance Connect Endpoint**.
- Implemented automatic infrastructure & services provising and maintenance using **Terraform (IaC)**.
- Tested manual failover of Aurora Multi-AZ database to standby instance using the AWS Management Console to ensure high availability and disaster recovery.
- Monitored the status of both Web & App Tier's Instances using **CloudWatch Alarms** to ensure optimal resource utilization and performance.


## **Architecture**

![architecture-3-tier-web-app](https://github.com/user-attachments/assets/cc132183-8473-49b3-bcdd-1bc0a11979d5)

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


> Note : In Aurora, I have not created the Read Replica due to costs. Few Credits left

---
## **Prerequisites**
- This project comprises some costs


---
## **Output**

#### **Screenshots - Laptop**
<img width="1401" alt="proj-3-tier-2-output-1" src="https://github.com/user-attachments/assets/8ff8d901-207e-444c-8b1e-12b86a6253bf" />

<img width="1439" alt="proj-3-tier-2-output-2" src="https://github.com/user-attachments/assets/704a922d-2397-4d0a-b686-01ba9416ec0f" />

<img width="1389" alt="proj-3-tier-2-output-3" src="https://github.com/user-attachments/assets/48ad83cc-8e83-45f8-9afb-59ba1f5479d0" />

 > For All Laptop & Mobile SS : [🎯Click-here🎯](./output-ss/output.md)


---




---
## **ACKNOWLEDGEMENTS**
- [aws-workshops](https://github.com/aws-samples/aws-three-tier-web-architecture-workshop)
