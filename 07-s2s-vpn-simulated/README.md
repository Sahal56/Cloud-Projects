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
|--------------------|
| <img width="874" alt="Image" src="https://github.com/user-attachments/assets/014895de-6493-4f5b-85ca-388c7244a6c7" /> |

| `IPSec Tunnels` |
|-----------------|
| <img width="826" alt="Image" src="https://github.com/user-attachments/assets/7bfd981b-e13a-4864-bdfd-c31d976ae47d" /> |

> Note: Above SS is of 2nd Iteration with 2 tunnels configured in Cloud init.
<details>
<!-- root expand -->
  
 <summary>
 <b> Expand to see all Screenshots 📸 </b>
 </summary>

 <br>

| `$ command`| Libreswan| AWS Instance |
|----|-------|-----------------|
| `ifconfig` | <img width="665" alt="Image" src="https://github.com/user-attachments/assets/6c3668ef-0c5e-43fc-9b62-60af8de15bf3" /> | <img width="645" alt="Image" src="https://github.com/user-attachments/assets/88b1aa48-7400-4b1f-b499-0d3bad6b7d39" /> |
| `ping` | <img width="664" alt="Image" src="https://github.com/user-attachments/assets/7c6ea417-de29-4feb-971f-a417d36b476c" /> | <img width="643" alt="Image" src="https://github.com/user-attachments/assets/a9c0af77-a701-45cb-8d26-b5a865b4761f" /> |

<details>
<!-- 1st level expand -->
  <summary>
    <b> 1. VPC - Subnets, Route Tables, Security Groups </b>
  </summary>

|                  ⚙️                 | VPC |
|-------------------------------------|-----|
| `VPCs`                              | <img width="1420" alt="Image" src="https://github.com/user-attachments/assets/94d3e9ab-cc80-4b3a-aefe-44dbcecd8d37" /> |
| `On Prem VPC`                       | <img width="1490" alt="Image" src="https://github.com/user-attachments/assets/aae737be-f2dc-4c24-b07e-27644cf1357e" /> |
| `AWS VPC`                           | <img width="1490" alt="Image" src="https://github.com/user-attachments/assets/6b8d01ec-09dc-40da-a1ba-e1ef3f2b5244" /> |

|                  ⚙️                 | Subnets |
|-------------------------------------|---------|
| `Subnets`                           | <img width="1425" alt="Image" src="https://github.com/user-attachments/assets/22094add-d22f-455f-ba24-e125b6812c4e" /> |
| `On Prem Public Subnet`             | <img width="1396" alt="Image" src="https://github.com/user-attachments/assets/e1a46306-69dd-444c-b268-87af496321c9" /> |
| `AWS Public Subnet`                 | <img width="1417" alt="Image" src="https://github.com/user-attachments/assets/07f7e8a3-ab05-4b44-a119-958cae07c326" /> |

|                  ⚙️                 | Security Groups |
|-------------------------------------|-----------------|
| `Security Groups`                   | <img width="1415" alt="Image" src="https://github.com/user-attachments/assets/267d90bb-4c00-430d-89cc-947913e9b2c3" /> |
| `On Prem SG Inbound`                | <img width="1422" alt="Image" src="https://github.com/user-attachments/assets/4467c55d-08dc-4539-b630-68c715073e8c" /> |
| `AWS SG Inbound`                    | <img width="1393" alt="Image" src="https://github.com/user-attachments/assets/69aec8b6-4233-4873-ad6a-389fa61caa93" /> |

|                  ⚙️                 | Route Tables |
|-------------------------------------|--------------|
| `Route Tables & On Prem RT `        | <img width="1424" alt="Image" src="https://github.com/user-attachments/assets/b9bbbc9f-611b-46f5-bb95-26bb1c976d99" /> |
| `AWS Public RT`                     | <img width="1411" alt="Image" src="https://github.com/user-attachments/assets/1c6fa9b6-adae-476d-b416-d36ad188b9d4" /> |
| `AWS Private RT`                    | <img width="1408" alt="Image" src="https://github.com/user-attachments/assets/bbfe28f3-383a-4bd6-b864-a5633f36b53f" /> |
| `AWS Public Route Propagation`      | <img width="1406" alt="Image" src="https://github.com/user-attachments/assets/d06ceac9-cda2-453d-94bc-0088073a3b84" /> |

<!-- 1st level expand -->
</details>

<details>
<!-- 1st level expand -->
  <summary>
    <b> 2. S2S </b>
  </summary>

|                  ⚙️             | S2S |
|---------------------------------|-----|
| `Customer Gateway`              | <img width="1414" alt="Image" src="https://github.com/user-attachments/assets/1fc9268b-ab9f-4724-adb2-213c132644be" /> |
| `Virtual Private Gateway`       | <img width="1423" alt="Image" src="https://github.com/user-attachments/assets/860d460d-6618-44af-b98d-a78ba99e235e" /> |
| `Site-to-Site VPN Connection`   | <img width="1427" alt="Image" src="https://github.com/user-attachments/assets/04863004-f54f-4ae1-abdb-b1c384fac1ba" /> |
| `VP GW Tunnels`                 | <img width="1415" alt="Image" src="https://github.com/user-attachments/assets/5c0b2fe3-1c5d-4641-954b-d923bec82103" /> |
| `VP GW Static Routes`           | <img width="1402" alt="Image" src="https://github.com/user-attachments/assets/03522aa6-99bc-46ed-8bcc-ac4858c17976" /> |

<!-- 1st level expand -->
</details>

<details>
<!-- 1st level expand -->
  <summary>
    <b> 3. EC2 </b>
  </summary>

|                  ⚙️             | EC2 |
|---------------------------------|-----|
| `Elastic IP`                    | <img width="1414" alt="Image" src="https://github.com/user-attachments/assets/19d3e2d4-acba-423a-82b1-c5c37f76e4ed" /> |
| `EC2 Instances`                 | <img width="1419" alt="Image" src="https://github.com/user-attachments/assets/c0d46e58-6e3e-4874-900a-b9bcbf23e091" /> |
| `On Prem Libreswan Instance`    | <img width="1414" alt="Image" src="https://github.com/user-attachments/assets/bcfa491c-00e5-40ab-bd33-0f5f7183b602" /> |
| `AWS Instance`                  | <img width="1408" alt="Image" src="https://github.com/user-attachments/assets/131b14fa-1d06-4690-af4e-7b80b06a7fbb" /> |

<!-- 1st level expand -->
</details>

<details>
<!-- 1st level expand -->
  <summary>
    <b> X. Delete Resources </b>
  </summary>

|                 ☁️              | Clean Up 🚀 save 💲💲 |
|--------------------------|-----|
| `Ohh Yeahhh !!!`         | <img width="636" alt="Image" src="https://github.com/user-attachments/assets/127b4381-a15f-4632-971f-920224e95b20" /> |
| `Finally Relaxed..😌`    | <img width="831" alt="Image" src="https://github.com/user-attachments/assets/cfa9a2aa-5c56-4e1f-88a6-da670366e8a0" /> |
| `VP GW`                  | <img width="1253" alt="Image" src="https://github.com/user-attachments/assets/d4585d5e-9825-4afb-9e25-0be9ac533575" /> |
| `Customer GW`            | <img width="1224" alt="Image" src="https://github.com/user-attachments/assets/04cf0d0b-140d-4e1b-a9d1-526a5308dd06" /> |
| `S2S VPN`                | <img width="1293" alt="Image" src="https://github.com/user-attachments/assets/8f857f59-b28a-4e74-b961-584550046f2a" /> |

<!-- 1st level expand -->
</details>

<!-- root expand -->
</details>

---
## **Implementation**

### **Prerequisites**
| Service    | EC2 | Public IP | S2S VPN | Data Transer |
|------------|-----|-----------|-------------|----------|
| `Free Tier Limits / Costs`| <img width="663" alt="Image" src="https://github.com/user-attachments/assets/cc6d058a-43f9-47ec-9cf4-e39019ed89a2" /> | <img width="270" alt="Image" src="https://github.com/user-attachments/assets/c4923681-8eb3-4d9e-a70f-767182dcdb42" /> | <img width="335" alt="Image" src="https://github.com/user-attachments/assets/f6e3053b-1d36-4de4-bc87-870311b4f8dd" /> | <img width="870" alt="Image" src="https://github.com/user-attachments/assets/c9fc736b-a99b-4ad0-872e-fae3d4d28491" /> |

OS : `Amazon Linux 2023 x64`
Software : `Libreswan 4.12`

> Note : 
> 1. This project comprises costs. In my case, I got around `$0.06` for 1-2 hours.
> 2. Whichever OS you wish to use, confirm the software is available (Libreswan/Openswan/Ciso....), ensure latest version and check equivalent Docs for setting up Cloud init file.
> 3. Let's say you want to utilize BGP for dynamic routing (FRR open source software), its not available in Amazon Linux 2023.

### **Commands**
```sh
terraform init
terraform plan
terraform apply -auto-approve
terraform destroy

sudo systemctl enable ipsec
sudo systemctl stop ipse
sudo systemctl restart ipsec
ipsec status
```

|           Network         | VPC              | Public Subnet    | Private Subnet   |
|---------------------------|------------------|------------------|------------------|
| `AWS`                     | `10.0.0.0/16`    | `10.0.0.0/24`    | `10.0.1.0/24`    |
| `On Prem VPC (Simulated)` | `192.168.0.0/16` | `192.168.0.0/24` | `192.168.1.0/24` |

### **Explanation**
1. VPC : Our On Premises Environement is simulated via AWS VPC itslef. So we have two VPC: `AWS` & On `Prem`. Check above Table for network CIDRs. There is one public & private Subnet per VPC.
2. Security Group: It allows all traffic from On Prem, AWS and User Home IP range. (For Personal Project/Testing). In production environment precise traffic control measures should be taken. Also, for S2S VPN Port `500` & `4500 UDP` should be allowed on both Security Group as well Instance Firewall (if setup).
3. NACL : For sake of simplicity and to avoid any issues, we have allowed all traffic to flow into subnets.
4. S2S :
    1. Customer Gateway : Ensure Elastic IP is allocated before proceeding. Create Customer GW with details.
    2. Create VPN Gateway in `AWS VPC` (not in `On Prem VPC`)
    3. Create VPN Connection by selecting above created gateways, proceed with defaults. (If you edit make sure you check Cloud init configuration yaml file & ensure it will work). It will take some time to provision.
5. EC2 : ( Refer yaml files : [./srcipts](./srcipts) yaml files & [./utilities](./utilities) )
    - It will automatically download required packages `libreswan` and configure itself by modifying files :
      - `/etc/sysctl.d/50-libreswan.conf`
      - `/etc/ipsec.d/aws.conf` tunnel configuration file
      - `/etc/ipsec.d/aws.secrets` authentication file
    - Source/Dest check should be disabled at Libreswan to allow forward packets destined to AWS VPC
6. Routing : As we have utilize static routing (given explicitly) and route propagationon enabled in `AWS VPC's RT`, routes will be propagted to Route Table when Tunnels are `UP` (connected), from VPN Gateway to each Route Table (propagation enabled ones).
    - Public Subnet/Table has internet connectivity with Internet Gateway as well as local connectivity while Private Subnet/Table has local connectivity only
    - On Prem to AWS : via Elastic Network Interface (ENI) of `Libreswan Instance` i.e. traffic will flow to libreswan and then it will forward through encrypted IPSec Tunnel.
    - AWS to On Prem : via VPN Gateway

Why Libreswan?
- We have chosen it instead of other like strongswan & openswan as it more popular now & supported by Amazon Linux 2023 (primary point)
- It is open source & widely available in no. of Linux Distros

Why Simulated VPC?
- As i Dont have static public IP (at Home Router), So I have to get Static (Elastic IP) and simulated the environment in th Cloud.
- If your ISP provides static IP allocation, then you may proceed with that. It would be great to make.

---
## **ACKNOWLEDGEMENTS**
- [S2S-Static-Routing](https://www.scalefactory.com/blog/2020/12/14/how-to-set-up-a-site-to-site-vpn-connection/)
- [YT | NotPerfect](https://www.youtube.com/watch?v=I-aN7JyMugs)
- [AWS-Official-S2S-VPN-DOCS](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html)
