# **Site2Site VPN**
- Implemented a Site-to-Site VPN between an AWS VPC and a simulated on-premises VPC using Libreswan for secure IPsec tunneling.
- Provisioned modular AWS infrastructure (VPCs, subnets, security groups, EC2 instances) utilizing Infrastructure as Code (IaC).
- Automated end-to-end IPsec VPN configuration using Cloud Init—covering key exchange, tunnel setup, and route injection—reducing configuration time by 90%.
- Configured static routing to direct traffic between networks and validated secure connectivity using ping.

---
## **Architecture**


---
## **Output**


<details>

<summary>
<b> Expand to see all SS </b>
</summary>
</details>

## **Implementation**



### **Prerequisites**
| **Service**    | **EC2** |
|----------------|---------|
|Free Tier Limits||Free Tier Limits|

> Note : 
> 1. This project comprises costs. In my case, I got around `$0.06` for 1-2 hours
> 2. Whichever OS you wish to use, confirm the software is available (Libreswan/Openswan/Ciso....), ensure latest version and check equivalent Docs for setting up Cloud init file.
> 3. Let's say you want to utilize BGP for dynamic routing (FRR open source software), its not available in Amazon Linux 2023.


### **Commands**
```sh
terraform init
terraform init -upgrade
terraform plan
terraform apply -auto-approve
terraform destroy
```

---
## **ACKNOWLEDGEMENTS**
- [S2S-Static-Routing](https://www.scalefactory.com/blog/2020/12/14/how-to-set-up-a-site-to-site-vpn-connection/)
- [YT | NotPerfect](https://www.youtube.com/watch?v=I-aN7JyMugs)
- [AWS-Official-S2S-VPN-DOCS](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html)
