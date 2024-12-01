# AWS Pricing Calculator

## Description
We will be exploring AWS pricing calculator to calculate cost of EC2 instances using savings plan for 3 years

- It allows us to Estimate the cost for our architecture solution.
- We can configure a cost estimate that fits our unique business or personal needs with AWS products and services.

LINK : [https://calculator.aws/](https://calculator.aws/)


## Exploration

### 1. Below is landing page of Calculator
![AWS Pricing Calculator](~/Learning/Projects/Cloud-Projects/aws-pricing-calculator/ss/pricing-calculator-1a.png "Landing Page" )

### 2. Overview
- It is 3 Step process:
    1. Add services, we wish to use e.g. EC2, Lamda, S3
    2. Configure the service e.g. RAM, vCPU, Plan Type: On-Demand, Savings, etc
    3. View Estimate cost per service, groups and totals. We can also export in PDF/CSVJSON or share live with link

### 3. List of Services
- we can search service for location i.e. regions, local zone
    - as we know that many services are regionally scoped i.e. some service are available in certain region
    - Also, Services configurations also varies by region. Not all ec2 instances type are avaialable in all regions
- Or we can directly search for particularly service
- There is also option for Bulk Import
    - we just have to download excel file, fill in manually, upload it again to calculate estimate costs

### 4. EC2 Service
- 4.1 are making estimate of EC2 instances
    - Region    : Mumbai | ap-south-1
    - Tenancy: Shared
    - OS: Linux
    - units     : 10

- 4.2 Configuration of our EC2 instances
    - Family    : m4
    - vCPU      : 4
    - RAM       : 16 Gib
    - etc

- 4.3 Payments options | Plans
    - We can have On-Demand plans with little high pricing, savings plan upto 72% discount with 1/3 Years reservations

    - As, we can see by using Savings Plan with partial Upfront payment, we reduce our spending over 3 years with monthly cost of $29.3 compared to $74.31 with compute savings plan (no-upfront)

    - Few another options for purchasing reserved instances: fixed as well as convertible with slight higher pricing

- 4.4 There are other additional configuartion for particular service. here EC2

    - enahance monitoring : CloudWatch
    Before

    After : cost will increase

### 5. Results | Estimate Cost
- We can finally see our estimate costs for our selected services, monthly, upfront cost
- we can also group estimate
- Also, we can export our estimate report in PDF/CSV/JSON

- Below is Screenshot of PDF report

---

# Thank YOU ❤️
Author: **[SAHAL PATHAN](https://github.com/sahal56)**

---