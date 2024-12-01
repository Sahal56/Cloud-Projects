# AWS Pricing Calculator

## Description
We will be exploring AWS pricing calculator to calculate cost of EC2 instances using savings plan for 3 years

- It allows us to Estimate the cost for our architecture solution.
- We can configure a cost estimate that fits our unique business or personal needs with AWS products and services.

LINK : [https://calculator.aws/](https://calculator.aws/)


## Exploration

### 1. Below is landing page of Calculator

<img width="624" alt="pricing-calculator-1a" src="https://github.com/user-attachments/assets/462ac55a-bb49-4ea5-b875-cdc0ad5f6444">

---
### 2. Overview
- It is 3 Step process:
    1. Add services, we wish to use e.g. EC2, Lamda, S3
    2. Configure the service e.g. RAM, vCPU, Plan Type: On-Demand, Savings, etc
    3. View Estimate cost per service, groups and totals. We can also export in PDF/CSVJSON or share live with link

<img width="582" alt="pricing-calculator-1b" src="https://github.com/user-attachments/assets/cdeb0768-fda2-488a-8638-75fc595ee87f">

---
### 3. List of Services

<img width="1092" alt="pricing-calculator-1c" src="https://github.com/user-attachments/assets/fd5f7658-2930-4480-ad0a-9abf9b7d05da">

- we can search service for location i.e. regions, local zone
    - as we know that many services are regionally scoped i.e. some service are available in certain region
    - Also, Services configurations also varies by region. Not all ec2 instances type are avaialable in all regions
- Or we can directly search for particularly service
- There is also option for Bulk Import
    - we just have to download excel file, fill in manually, upload it again to calculate estimate costs

---
### 4. EC2 Service

<img width="1093" alt="pricing-calculator-2a" src="https://github.com/user-attachments/assets/27f913fd-e461-4212-8115-3d7df62224e9">

- 4.1 We are making estimate of EC2 instances
    - Region    : Mumbai | ap-south-1
    - Tenancy: Shared
    - OS: Linux
    - units     : 10


---
<img width="1048" alt="pricing-calculator-2b" src="https://github.com/user-attachments/assets/07bfb148-a72b-4553-bfef-a0416aa85ce5">

- 4.2 Configuration of our EC2 instances
    - Family    : m4
    - vCPU      : 4
    - RAM       : 16 Gib
    - etc

---
<img width="1361" alt="pricing-calculator-2c" src="https://github.com/user-attachments/assets/7957d1a7-42bf-4085-a22c-30d3b6b74d8d">

- 4.3 Payments options | Plans
    - We can have On-Demand plans with little high pricing, savings plan upto 72% discount with 1/3 Years reservations
 
      <img width="603" alt="pricing-calculator-2d" src="https://github.com/user-attachments/assets/dc58fdcc-fc53-4005-82cf-12a80eba2744">
    - As, we can see above, by using Savings Plan with partial Upfront payment, we reduce our spending over 3 years with monthly cost of $29.3 compared to $74.31 with compute savings plan (no-upfront)
      
      <img width="631" alt="pricing-calculator-2e" src="https://github.com/user-attachments/assets/ee9188d2-7eb0-43f9-8d1f-9ef4899c0221">
    - Few another options for purchasing reserved instances: fixed as well as convertible with slight higher pricing

---
- 4.4 There are other additional configuartion for particular service. here EC2
    - e.g. additional ebs storage, detailed monitoring with CloudWatch, data transfer between AZ/Regions, Additional costs
      <img width="390" alt="pricing-calculator-3c" src="https://github.com/user-attachments/assets/78bcb832-6ce9-4869-9439-ebeab544077c">
    
    - enahance monitoring : CloudWatch
      | **Before** | **After (cost will increase)** |
      |------------|--------------------------------|
      | <img width="271" alt="pricing-calculator-3a-monitoring" src="https://github.com/user-attachments/assets/2b79fc08-b972-43d8-9555-f66fd7db02e7"> | <img width="268" alt="pricing-calculator-3b-monitoring" src="https://github.com/user-attachments/assets/f3223f66-6b2e-48a0-a014-bcc612689ff7">  |

---
### 5. Results | Estimate Cost

<img width="1350" alt="pricing-calculator-4a-result" src="https://github.com/user-attachments/assets/a6a0574b-8d8e-46f7-9dcb-517d7533bb13">

- We can finally see our estimate costs for our selected services, monthly, upfront cost
- we can also group our multiple estimates
  
  <img width="130" alt="pricing-calculator-4b-result" src="https://github.com/user-attachments/assets/10a81064-640e-457c-a257-cab8e86fe786">
- Also, we can export our estimate report in PDF/CSV/JSON


- Below is Screenshot of PDF report
<img width="874" alt="pricing-calculator-4c-result" src="https://github.com/user-attachments/assets/a6fbaa44-3192-4bbe-88cf-200daba78d05">

---
# Thank YOU ❤️
Author: **[SAHAL PATHAN](https://github.com/sahal56)**

---
