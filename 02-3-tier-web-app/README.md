# **Three Tier Web Application**

## **Architecture**
![3-tier-web-app](https://github.com/user-attachments/assets/14ff9066-3b77-4ad8-8362-8272eafb25cd)

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