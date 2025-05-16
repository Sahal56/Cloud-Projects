# TASKS REMAINING

**Best Guides:**
- [S2S-Static-Routing](https://www.scalefactory.com/blog/2020/12/14/how-to-set-up-a-site-to-site-vpn-connection/)
- [S2S-Dynamic-Highly-Available-Cantril](https://www.youtube.com/watch?v=0dVVLKp4I18)
- [AWS-Official-S2S-VPN](https://docs.aws.amazon.com/vpn/latest/s2svpn/VPC_VPN.html)
> Note : Dont look anywhere, just follow AWS Official & Above Ones
> PS: It will save you time

```sh
terraform init
terraform init -upgrade
terraform plan
terraform apply -auto-approve
terraform destroy
```


tried with both tunnel
in console connection was up but pings were malforming dropping or working!

Libreswan doesn’t allow overlapping traffic selectors for multiple connections at the same time. i.e. same leftsubnet and rightsubnet

AL2023 X64
dnf update
dnf install libreswan
[root@ip-172-31-37-172 ec2-user]# ipsec --version
Libreswan 4.12


frr in ubuntu use snap package


NOTE:
Libreswan versions before 4.5 do not support keyexchange=ikev2 keyword.

Libreswan negotiates IKEv1 by default.

To use IKEv2 with Libreswan, you need a recent version and a different config style






---
make sure after s2s vpn
add static routes in vpn 192.168.0.0/16 in VPN Gateway in AWS VPC (10.0.0.0/16)

Disable Src/Dest Check StrongSwan

Route Tables:
On prem : 10.0.0.0/16 to StrongSwan-Instance ID i-dqdxax
AWS : 192.168.0.0/16 to VPN Gateway Attachment




---


1. Test Connectivity
2. Provision : After Strong Connection confirmation
  - 4 EC2
  - 1 RDS

https://medium.com/@tanmaybhandge/aws-site-to-site-vpn-connection-using-strongswan-fb2f2f1b1f44

---
Idea
as i dont have public IP from Home Router


I have to use simulated one


We will restrict AZ to use only one for less networking Costs : `ap-south-1a`

---

AWS
VPC : `10.0.0.0/16`
Public Subnet : `10.0.0.0/24`
Private Subnet : `10.0.1.0/24`

On Premises (Simulated):
VPC : `192.168.0.0/16`
Public Subnet : `192.168.0.0/24`
Private Subnet : `192.168.1.0/24`


what can i do instead of pinging
i can setup Web App in aws vpc and 
use from on-prem vpc

strongSwan instance:

- Assign an Elastic IP (EIP)
- Stop Change Source/Destination check


---
## **Implementation Workflow**

Steps:
1. Provision Infrastructure (VPCs) first
2. Provision/Established S2S Connection
3. Provision EC2 Instance to Test and Use


for Step 1
- provision infrastructure
- provision ensure secuity groups & NACLs

for Step 2
- we nee one Instance with Public IP in on-prem vpc in which will installed strong swan.
- we have to configure strongswan (automate using user data script)
- provision customer gateway, vpn gateway
- established s2s connection as usual

for Step 3:
- in on-prem vpc, provision a new instance (private ip prefered)
- im aws vpc, provision a new instance (private ip prefered)
- try pinging between them





---
cant ping allow icmp

in s2s connection you can't modify routing: static <-> dynamic (BGP). so make sure you check first what you need

use static here only

---

Referrences:
- [LINK](https://medium.com/@sruthianem89/project-10-implementing-a-site-to-site-vpn-in-aws-ef822e736277)
- [YT|NotPerfect](https://www.youtube.com/watch?v=I-aN7JyMugs)
- [Crazy](https://github.com/RhubarbSin/terraform-aws-vpn-ec2-libreswan-example/blob/main/modules/vpc/outputs.tf)