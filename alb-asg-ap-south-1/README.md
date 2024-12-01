# Project: Load Balancing with Auto Scaling in Multi-AZ

## Key Takeaways
- Deployed Application load balancer with target groups pointing to Auto scaling group in Multi-AZ
- Configured security groups of ALB & ASG: 
    - ALB : Allowing inbound from internet
    - ASG : Allowing inbound from ALB’s Security Group only.
- Enabled auto scaling target tracking policy to auto scale out and in with appropriate min, max & desired
no. of instances.

## Screenshots
- check out pdf or [ss/]()

