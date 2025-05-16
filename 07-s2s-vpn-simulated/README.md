# **Site2Site VPN**
- Implemented a Site-to-Site VPN between an AWS VPC and a simulated on-premises VPC using Libreswan for secure IPsec tunneling.
- Provisioned modular AWS infrastructure (VPCs, subnets, security groups, EC2 instances) utilizing Infrastructure as Code (IaC).
- Automated end-to-end IPsec VPN configuration using Cloud Init—covering key exchange, tunnel setup, and route injection—reducing configuration time by 90%.
- Configured static routing to direct traffic between networks and validated secure connectivity using ping.

---
## **Architecture**
![Image](https://github.com/user-attachments/assets/22aaef0f-bd17-421f-ae04-aed357106b2e)

---
## **Output**

| `SSH into Libreswan EC2 Instance` |
|-----------------------------------|
| <img width="787" alt="Image" src="https://github.com/user-attachments/assets/f8f0ae58-760d-467d-b6c9-fa2d23d171e3" /> |

| **Path** | **Validating IPSec Connectivity using `ping`** |
|-------------------|-------------------------|
| **`On Prem => AWS`** | <img width="664" alt="Image" src="https://github.com/user-attachments/assets/7c6ea417-de29-4feb-971f-a417d36b476c" /> |
| **`AWS =>  On Prem`** | <img width="643" alt="Image" src="https://github.com/user-attachments/assets/a9c0af77-a701-45cb-8d26-b5a865b4761f" /> |

| `Terraform Output` |
|-----------------------------------|
| <img width="874" alt="Image" src="https://github.com/user-attachments/assets/014895de-6493-4f5b-85ca-388c7244a6c7" /> |

<details>
<!-- root expand -->
  
 <summary>
 <b> Expand to see all SS </b>
 </summary>

 <br>

| No.| Libreswan| AWS Instance |
|----|-------|-----------------|
| `ifconfig` | <img width="665" alt="Image" src="https://github.com/user-attachments/assets/6c3668ef-0c5e-43fc-9b62-60af8de15bf3" /> | <img width="645" alt="Image" src="https://github.com/user-attachments/assets/88b1aa48-7400-4b1f-b499-0d3bad6b7d39" /> |
| `ping` | <img width="664" alt="Image" src="https://github.com/user-attachments/assets/7c6ea417-de29-4feb-971f-a417d36b476c" /> | <img width="643" alt="Image" src="https://github.com/user-attachments/assets/a9c0af77-a701-45cb-8d26-b5a865b4761f" /> |

<details>
<!-- 1st level expand -->
  <summary>
    <b> 1. VPC </b>
  </summary>
<!-- 1st level expand -->
</details>

<details>
<!-- 1st level expand -->
  <summary>
    <b> 2. S2S </b>
  </summary>
<!-- 1st level expand -->
</details>

<details>
<!-- 1st level expand -->
  <summary>
    <b> 3. EC2 </b>
  </summary>
<!-- 1st level expand -->
</details>

<details>
<!-- 1st level expand -->
  <summary>
    <b> X. Delete Resources </b>
  </summary>
<!-- 1st level expand -->
</details>

<!-- root expand -->
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
