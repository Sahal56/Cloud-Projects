# **Amazon Linux 2 VM in Hyper V | Outside AWS**

- [GUIDE](https://docs.aws.amazon.com/linux/al2/ug/amazon-linux-2-virtual-machine.html)
- [VM-IMAGES](https://cdn.amazonlinux.com/os-images/2.0.20241217.0/)
- use default seed.iso

#### **Steps**

<details>
<summary> <b> expand </b> </summary>
</details>


## **Credentials**
```sh
user > ec2-user
password > amazon
```

## *Connecting to VM from laptop (same or differnt laptop on same network)**
1. Configure VM
```sh
# change settings
$ sudo nano /etc/ssh/sshd_config
   > PasswordAuthentication no => yes
   > ChallengeResponseAuthentication no => yes

# restart daemon
$ sudo service sshd restart

# save ip address of VM in the local network
$ ipconfig
  eth0: <ip>
  or
  en0: <ip>
```

2. SSH from laptop:
```
# password is given above in Credentials
$ ssh ec2-user@<VM-ip>
  > give password
```
utilities
  > ip address : ipconfig 
  > GUI file manager & text editor : sudo mc
  
