# **Database Migration**
- Migrated MySQL database from EC2 instance to RDS MySQL using AWS Database Migration Service (DMS), ensuring seamless data transfer.
- Automated database configuration and sample database installation on the source EC2 instance via User Data scripts for improved efficiency.
- Configured security groups for source and target databases and the replication instance to enforce minimal communication and improve security.
- Leveraged EC2 Connect to configure and monitor the source database during migration and verified the target database post-migration to ensure a successful transition.
- Tested and validated User Data scripts locally on Amazon Linux 2, deployed on Hyper-V (Windows), ensuring correctness before deployment.
- Services : AWS DMS, RDS, EC2, MySQL, Hyper-V


---
## **Architecture**


---
## **Prerequisites**
|   **Service**    | **EC2** | **DMS** | **RDS** |
|------------------|---------|---------|---------|
| Free Tier Limits | <img width="270" alt="prequisite-ec2" src="https://github.com/user-attachments/assets/b49faa47-6bc9-464b-9438-a123b5decc0d" /> | <img width="293" alt="aws-dms" src="https://github.com/user-attachments/assets/125571f9-406f-4a43-8e5e-5eb511625b2c" /> | <img width="266" alt="prequisite-rds" src="https://github.com/user-attachments/assets/92876c17-402c-43ac-a7e9-8e817511cf80" /> |

---
## **Referrences/Links**
- Amazon Linux 2 on Prem / Locally | [GUIDE](https://docs.aws.amazon.com/linux/al2/ug/amazon-linux-2-virtual-machine.html) | [IMAGE-VM-LINK](https://cdn.amazonlinux.com/os-images/2.0.20241217.0/)
- Offical Migration Guide | [LINK](https://aws.amazon.com/tutorials/move-to-managed/migrate-my-sql-to-amazon-rds/)


<!--
testing
```sh
curl https://gitlab.com/sahal56/scripts/-/raw/main/ec2_user_data/amazon_linux_2_install_mysql8_sakila_db.sh -o script.sh
chmod +x script.sh
./script.sh
```

---
automation:
  ☑ install mysql 8 server and client
  ☑ configure 1st installation and root password
  ☑ add new user with all privileges
  ☑ download & instal sakila db


--- 
## **AL2 VM in Hyper V | Outside AWS**
use default seed.iso
user > ec2-user
password > amazon

utilities
  > ip address : ipconfig 
  > GUI file manager & text editor : sudo mc
  


connecting to EC2 VM from our laptop
  configure
    > sudo nano /etc/ssh/sshd_config
      > change some settings
      > PasswordAuthentication no => yes
      > ChallengeResponseAuthentication no => yes
    > sudo service sshd restart
ssh ec2-user@<ip>



---
Tested on Amazon Linux 2023


```sh
open -t "/opt/homebrew/etc/my.cnf"

# allow firewall
sudo ufw allow 3306
```


```sql
-- This script is to calculate size of your database
SELECT table_schema AS "Database", SUM(data_length + index_length) / 1024 / 1024 AS "Size (MB)" FROM information_schema.TABLES GROUP BY table_schema;



-- Althogh, binary logging is enabled by default on MSQL version 8 and above. It is good thing to confirm for performing migrate and replicate live transaction using AWS DMS.
-- To display MySQL logs
show binary logs;
-- to check location of log storage
show variables like '%log_bin%';
```

## Download Links
### Sample Database
- MySQL Sakira DB [LINK](https://dev.mysql.com/doc/sakila/en/sakila-installation.html) | [DOWNLOAD](https://downloads.mysql.com/docs/sakila-db.zip)



we are using Amazon EC2 Instance Connect endpoints for connecting to EC2instance where our Source MySQL DB is hosted
for ap-south-1 : `ec2-instance-connect.ap-south-1.amazonaws.com`
LINK : https://docs.aws.amazon.com/general/latest/gr/ec2-instance-connect.html



<!-- notes -->
<!--
Database Migration Project



TASKS

install mysql on ec2
add data in into db

SG
1. Source_DB_SG
2. Replication SG
3. Target_DB_SG

Availability zone : ap-south-1a
default nacl


mod
s_sg : inbound 0.0.0.0 3306
t_sg : inbound 0.0.0.0 3306

for testing


source : mysql
target : postgresql




—
troubleshooting
mysql conf path in homebrew : /opt/homebrew/etc/my.cnf
mysql Allow Remote Access : https://medium.com/@haydane/how-to-install-mysql-on-mac-and-allow-remote-access-b6c730aba09b

brew services restart mysql
brew services stop mysql


—

STEPS

Install MySQL in EC2
Allow remote connection by creating remote user, modifying conf file, configuring fire wall (test)



commands


terminal
— MySQL configuration file: 
sudo nano /etc/my.cnf # Amazon Linux
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf # Ubuntu

change to
bind-address = 0.0.0.0

restart
sudo systemctl restart mysqld # Amazon Linux
sudo systemctl restart mysql # Ubuntu

— allow any ip
bind-address = 0.0.0.0


sql
create user 'remoteuser'@'%' identified by 'remotePassword#1';
GRANT ALL PRIVILEGES ON *.* TO '<remoteuser>'@'%' WITH GRANT OPTION;
flush privileges;
— @'%' allows access from any IP address.

> select user from mysql.user;

test remote connection
mysql -u remoteuser -h <hostname/ip> -p
remotePassword#1





require 3 things

replication instances
endpoints
db migration tasks

but we can’t create in any order
For migration tasks, we require replication server
For endpoints, for testing endpoints, we need at least one replication server

so rep inst > endpoint > tasks


rep insta : contain data of source db, it will transfer it to target db

simple rds => rds | https://www.youtube.com/watch?v=01TBKMvAw0A


https://aws.amazon.com/tutorials/move-to-managed/migrate-my-sql-to-amazon-rds/


mysql in ec2 : https://muleif.medium.com/how-to-install-mysql-on-amazon-linux-2023-5d39afa5bf11
https://medium.com/@mudasirhaji/step-by-step-guide-on-how-to-install-mysql-8-server-on-aws-ec2linux-2-in-2024-72f3f14764b6




<!-- continue -->
<!--

migrate existing data and live changes requires MYSQL binary log avaialble at source db


Target DB SG temp inbound rule | require public IP
to allow 3305 from 0.0.0.0
checking from laptop and phone


--- 
last continue
sudo curl https://gitlab.com/sahal56/scripts/-/raw/main/wow/just-run.sh | sh
   
   
   
   
   source DB DNS: ec2-3-110-170-235.ap-south-1.compute.amazonaws.com
   ip: 3.110.170.235
   
   
   
   target dns: target-mysql-db.cf2aay2kcad1.ap-south-1.rds.amazonaws.com
   


   this works in al2

-->


---
## **Acknowledgements**
- [Amazon Web Services - AWS](https://aws.amazon.com/)
- [Microsoft Hyper-V](https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/about/)
