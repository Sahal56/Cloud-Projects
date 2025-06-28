<h1 align="center">
  <b> Amazon Linux 2 VM in Hyper V | Outside AWS </b>
</h1>

- [OFFICIAL GUIDE](https://docs.aws.amazon.com/linux/al2/ug/amazon-linux-2-virtual-machine.html)
- [VM-IMAGES](https://cdn.amazonlinux.com/os-images/2.0.20241217.0/)
- use default `seed.iso`

#### **Steps:**

<details>
   <summary> <b> 0. Create External Virtual Switch (optional) </b> </summary>
   
   | `Create the virtual switch if you machine does not have` |
   |----------------------------------------------------------|
   | ![proj-al2-hyper-v-0a-create-switch](https://github.com/user-attachments/assets/7599f5d2-4798-447e-b2e8-a4ea1ebc2b21) |
   | ![proj-al2-hyper-v-0b](https://github.com/user-attachments/assets/a8389fef-9b91-4552-961e-0bad48242d87) |
   | ![proj-al2-hyper-v-0c](https://github.com/user-attachments/assets/637cb456-7441-4596-a3bc-ff292df67a93) |
   | `selelct your WLAN interface` |
   | ![proj-al2-hyper-v-0d](https://github.com/user-attachments/assets/1c692d06-c3ff-46d8-b18f-6ffe7dd5f57e) |

</details>

<details>
   <summary> <b> 1. Create the VM </b> </summary>

   | `Hyper-V : Creating VM` |
   |-----------------------|
   | ![proj-al2-hyper-v-1a-create-vm](https://github.com/user-attachments/assets/fd473e10-0ea6-4675-ae2e-ed7fc5706107) |
   | ![proj-al2-hyper-v-1b](https://github.com/user-attachments/assets/283f048f-70f6-45fc-97cc-a1bcd51d7d29) |
   | ![proj-al2-hyper-v-1c](https://github.com/user-attachments/assets/8aed979d-9d15-4a91-bacc-6e1df6ca5e74) |
   | ![proj-al2-hyper-v-1d](https://github.com/user-attachments/assets/c21534f8-4b37-4896-a75a-d6987c97c089) |
   | ![proj-al2-hyper-v-1e](https://github.com/user-attachments/assets/26201925-a5eb-4ea7-9bb3-63ecb368d25c) |
   | ![proj-al2-hyper-v-1f](https://github.com/user-attachments/assets/3c606250-1e69-491f-9cd2-3d47b190e9a1) |

   | `Hyper-V : Editing VM` |
   |-----------------------|
   | ![proj-al2-hyper-v-2a-edit-vm](https://github.com/user-attachments/assets/d35092b3-3b94-4501-88cc-3042b076b498) |
   | ![proj-al2-hyper-v-2b](https://github.com/user-attachments/assets/1d843e78-ff2a-475f-bf71-af7166107ac2) |
   | ![proj-al2-hyper-v-2c](https://github.com/user-attachments/assets/6ad29918-f0fc-4f85-b867-2a04851ae5b7) |
   | ![proj-al2-hyper-v-2d](https://github.com/user-attachments/assets/2ec70fc3-d8b5-4c00-a19d-b33aa846879e) |
   | ![proj-al2-hyper-v-2e](https://github.com/user-attachments/assets/c331f7e5-e70d-4425-83a4-3319dc1a5422) |
   | ![proj-al2-hyper-v-2f](https://github.com/user-attachments/assets/c8336a82-5fae-4ec0-be7d-6ea8910aea1a) |
   | ![proj-al2-hyper-v-2g](https://github.com/user-attachments/assets/3b7f10e9-6d83-4011-beea-82c9ba458d73) |
   | ![proj-al2-hyper-v-2h](https://github.com/user-attachments/assets/c6072661-1641-4630-bd91-7cbd0100d72f) |
   | ![proj-al2-hyper-v-2i](https://github.com/user-attachments/assets/ed4b9af3-4c75-4e4c-9b1e-153574c677c5) |

</details>

<details>
   <summary> <b> 2. Turn ON VM </b> </summary>
   
   | `Using VM Amazon Linux 2` |
   |-------------------------|
   | ![proj-al2-hyper-v-3a-turn-on-vm](https://github.com/user-attachments/assets/feb2100e-d102-439a-886f-c4e8315fad97) |
   | ![proj-al2-hyper-v-3b](https://github.com/user-attachments/assets/910ae5bd-c150-4631-9b00-37f92898feb8) |
   | ![proj-al2-hyper-v-3c](https://github.com/user-attachments/assets/ebcf9734-e9ed-46e5-ab61-3032dfce0126) |
   | ![proj-al2-hyper-v-3d](https://github.com/user-attachments/assets/16e1a45e-4a45-4e84-b696-d18ba399d2d1) |
   | ![proj-al2-hyper-v-3e](https://github.com/user-attachments/assets/26357bd7-fd37-4122-bf99-426d3d96cacf) |
   | ![proj-al2-hyper-v-3f](https://github.com/user-attachments/assets/098d508c-3dc5-48ae-a748-30b6fd36a67a) |
   
</details>

<details>
   <summary> <b> 3. SSH into VM </b> </summary>

   | `Let's SSH into our VM` |
   |:-------------------------:|
   | `1st > make sure VM allows SSH` |
   | ![proj-al2-hyper-v-4b](https://github.com/user-attachments/assets/a8c47728-7a23-4b39-84a6-fac945736b37) |
   | ![proj-al2-hyper-v-4c](https://github.com/user-attachments/assets/0b0ffc8b-edb8-47ae-8adc-b7fa628ded54) |
   | ![proj-al2-hyper-v-4d](https://github.com/user-attachments/assets/43507545-8d7a-4603-b956-56484ef1c00f) |
   | ![proj-al2-hyper-v-4e](https://github.com/user-attachments/assets/6beb3f6a-67b7-41b5-8514-4b6fdec539c6) |
   | `2nd > get IP of our VM` |
   | ![proj-al2-hyper-v-4a-ssh-into-vm](https://github.com/user-attachments/assets/68ad8082-8e4f-4f90-af0f-b69a1957148b) |
   | `3rd > Check if connection is OK` |
   | ![proj-al2-hyper-v-4f](https://github.com/user-attachments/assets/6df1dcef-3d4e-4e11-8891-6270851748f6) |
   | `4th > SSH from same/another PC-Laptop` |
   | ![proj-al2-hyper-v-4g](https://github.com/user-attachments/assets/94f6e42b-2459-4dca-a78e-b08c328e9649) |
   | ![proj-al2-hyper-v-4h](https://github.com/user-attachments/assets/178b9103-7fcd-48e8-a1a1-3d58a42c1202) |

   
</details>

<details>
   <summary> <b> 4. Turn OFF VM </b> </summary>

   | `Make sure you Shut Down` |
   |:-------------------------:|
   ![proj-al2-hyper-v-5-turn-off](https://github.com/user-attachments/assets/a26b8112-5d05-43fe-b1ec-31ab41d2cb5b)

</details>


## **Credentials**
```sh
# default username & password for Amazon Linux 2
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

Enjoy !!!
```

---
utilities
- ip address : `ipconfig` 
- GUI file manager & text editor : `sudo mc`
  
