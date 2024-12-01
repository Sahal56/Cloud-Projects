# Project: Load Balancing with Auto Scaling in Multi-AZ

## Key Takeaways
- Deployed Application load balancer with target groups pointing to Auto scaling group in Multi-AZ
- Configured security groups of ALB & ASG: 
    - ALB : Allowing inbound from internet
    - ASG : Allowing inbound from ALB’s Security Group only.
- Enabled auto scaling target tracking policy to auto scale out and in with appropriate min, max & desired
no. of instances.

---
## Architecture
![Load Balacing Mumbai](https://github.com/user-attachments/assets/67e806ac-2b65-4409-a62b-4274e54d4c5e)

---
## Screenshots
- check out pdf or [ss/]()

<img width="1128" alt="output" src="https://github.com/user-attachments/assets/a0e9d690-c871-4cde-93f2-c9af1c86beb5">
