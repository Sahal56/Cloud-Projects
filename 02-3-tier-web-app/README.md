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


## **Prerequisites**
- This project comprises some costs


---
## **Output**

#### **Screenshots - Laptop**
<img width="1401" alt="proj-3-tier-2-output-1" src="https://github.com/user-attachments/assets/8ff8d901-207e-444c-8b1e-12b86a6253bf" />

<img width="1439" alt="proj-3-tier-2-output-2" src="https://github.com/user-attachments/assets/704a922d-2397-4d0a-b686-01ba9416ec0f" />

<img width="1389" alt="proj-3-tier-2-output-3" src="https://github.com/user-attachments/assets/48ad83cc-8e83-45f8-9afb-59ba1f5479d0" />


CHECK ALL SCREEENSHOTS & Mobile SS here 

<!--
#### **Screenshots - Phone**

| Description | Screenshot |
|-------------|------------|
| HOME PAGE        |      ![proj-3-tier-2-output-6](https://github.com/user-attachments/assets/3a815189-6ee3-4563-ab98-64372242feae)      |
|       D      |       ![proj-3-tier-2-output-7](https://github.com/user-attachments/assets/72ea89b7-7b7a-483b-92cf-f17f780d975b)     |
|        D     |     ![proj-3-tier-2-output-8](https://github.com/user-attachments/assets/86e9aeea-616d-4db9-b324-4889d8f42a9d)       |



<img width="1401" alt="proj-3-tier-2-output-1" src="https://github.com/user-attachments/assets/8ff8d901-207e-444c-8b1e-12b86a6253bf" />

<img width="1439" alt="proj-3-tier-2-output-2" src="https://github.com/user-attachments/assets/704a922d-2397-4d0a-b686-01ba9416ec0f" />

<img width="1389" alt="proj-3-tier-2-output-3" src="https://github.com/user-attachments/assets/48ad83cc-8e83-45f8-9afb-59ba1f5479d0" />


<img width="1440" alt="proj-3-tier-2-output-4" src="https://github.com/user-attachments/assets/f2f3d187-c6ee-401d-b9be-9afa28ed92c0" />

<img width="1440" alt="proj-3-tier-2-output-5" src="https://github.com/user-attachments/assets/76c3dd77-957c-41d2-aa6b-12de1852b54d" />


![proj-3-tier-2-output-9](https://github.com/user-attachments/assets/e44518f8-cde7-45b7-a38b-6da0ebf739d7)

![proj-3-tier-2-output-10](https://github.com/user-attachments/assets/bad883cb-cd3f-47e0-8d5d-3553901b5dce)
![proj-3-tier-2-output-10](https://github.com/user-attachments/assets/bad883cb-cd3f-47e0-8d5d-3553901b5dce)
-->
---
# Flow
    - first of all creating vpc and components like cidr-range, subnets, ig, route tables, security groups, nacl, load balancers
    - application resoucces, react app, launch template, auto scalinh group for both web and app tier
    - database : with configurations

VPC in ap-south-1 zone
1 Internet Gateway
3 Public Subnets, one in each AZ
3 Private Subnets, one in each AZ
Route Table configurations (main and 2nd)


---
## **ACKNOWLEDGEMENTS**
- [aws-workshops](https://github.com/aws-samples/aws-three-tier-web-architecture-workshop)
