# **Database Migration**
- Migrated MySQL database from EC2 instance to RDS MySQL using AWS Database Migration Service (DMS), ensuring seamless data transfer.
- Automated database configuration and sample database installation on the source EC2 instance via User Data scripts for improved efficiency.
- Configured security groups for source and target databases and the replication instance to enforce minimal communication and improve security.
- Leveraged EC2 Connect to configure and monitor the source database during migration and verified the target database post-migration to ensure a successful transition.
- Tested and validated User Data scripts locally on Amazon Linux 2, deployed on Hyper-V (Windows), ensuring correctness before deployment.
- Services : AWS DMS, RDS, EC2, MySQL, Hyper-V

---
## **Architecture**
![db-migrate-homogeneous](https://github.com/user-attachments/assets/e24d6419-0790-4ff5-ab49-300637823f1f)

**Terms**
- `Souce Endpoint` : It has connectivity details used by Replication Instance to connect to source database from where data is to be migrated
- `Target Endpoint` : It has connectivity details used by Replication Instance to connect to target database, where data is to be moved
- `DMS Replication Task` : The task/job defining what is to be migrated(which schema/database) and other migration related properties
- `DMS IAM Roles` : The IAM Roles which allow the DMS service to call AWS services on our behalf. i.e. administer the VPC, publish logs in CloudWatch

---
## **Output**

| **Target Database** |
|---------------------|
| **As you can see below, `sakila db` is fully migrated**|
| Admin > EC2 Connect > Source EC2 Server == mysql cli ==3306==> RDS MySQL |
| <img width="1036" alt="proj-6-db-migrate-op-4-result" src="https://github.com/user-attachments/assets/db80b1af-f57a-4d11-bcee-6c7894864394" /> |

<details>

<summary>
<b> Expand to see all SS </b>
</summary>

| **EC2 Source - MySQL** |
|----------------|
| ![proj-6-db-migrate-op-1-ec2-src-db-mysql](https://github.com/user-attachments/assets/fbb8a81a-a874-4258-9da3-fe051b53eb9d) |
| `my.conf` file to enabled remote login and binary logging for replication|
| <img width="878" alt="proj-6-db-migrate-op-1b-ec2-src-db-mysql-myconf" src="https://github.com/user-attachments/assets/9d3d8ace-59c1-489b-a278-c010aedde718" /> |


| **RDS Target - MySQL** |
|------------------------|
| <img width="1414" alt="proj-6-db-migrate-op-2-target-rds-mysql" src="https://github.com/user-attachments/assets/0f5ef1f3-5b72-4e8f-aa36-f3be0b19736a" /> |


| **Replication Instance** |
|--------------------------|
| <img width="1383" alt="proj-6-db-migrate-op-3a-dms-rep-instance" src="https://github.com/user-attachments/assets/d587a068-9fc7-4acb-81ff-2df2ede36353" /> |

| **DMS Endpoints** |
|-------------------|
|<img width="1408" alt="proj-6-db-migrate-op-3b-dms-ep" src="https://github.com/user-attachments/assets/88b010a4-ba3a-40a2-97e8-a0f6f6cb3ff4" /> |
| <img width="778" alt="proj-6-db-migrate-op-3b-dms-ep1" src="https://github.com/user-attachments/assets/a53774d5-5b2f-45d0-9f35-446d7ec5930e" /> |
| <img width="1098" alt="proj-6-db-migrate-op-3b-dms-ep2" src="https://github.com/user-attachments/assets/517e46b5-a769-4913-a902-a3b91c96c85a" /> |

| **DMS TASK** |
|--------------|
| <img width="788" alt="proj-6-db-migrate-op-3c-dms-taskA" src="https://github.com/user-attachments/assets/d2d443d0-7400-42de-97cc-6bb22d3c6808" /> |
| <img width="1390" alt="proj-6-db-migrate-op-3c-dms-taskB" src="https://github.com/user-attachments/assets/757c3f6e-d85e-4a1e-8ad7-fd1cf8e3e69d" /> |
| <img width="1399" alt="proj-6-db-migrate-op-3c-dms-taskC" src="https://github.com/user-attachments/assets/f0d5a878-ff78-4922-a176-1d01c54abf6d" /> |
| As you can see below : `Total time` = `Created - Stopped` = `1min 45s`  to migrate our `sakila` DB|
| <img width="1407" alt="proj-6-db-migrate-op-3d-dms-task" src="https://github.com/user-attachments/assets/c07c5131-c35f-4b13-957d-781771d4f20d" /> |

</details>

---
## **Prerequisites**
- This Project is eligible for free tier
- One should use resource wisely and after performing necessary Migration Planning assessment
- This is Project V1 is Homogeneous Migration i.e. Source and Target DB are same (MySQL)

|   **Service**    | **EC2** | **DMS** | **RDS** |
|------------------|---------|---------|---------|
| Free Tier Limits | <img width="270" alt="prequisite-ec2" src="https://github.com/user-attachments/assets/b49faa47-6bc9-464b-9438-a123b5decc0d" /> | <img width="293" alt="aws-dms" src="https://github.com/user-attachments/assets/125571f9-406f-4a43-8e5e-5eb511625b2c" /> | <img width="266" alt="prequisite-rds" src="https://github.com/user-attachments/assets/92876c17-402c-43ac-a7e9-8e817511cf80" /> |

---
## **Referrences**
- Amazon Linux 2 on Prem / Locally | [GUIDE](https://docs.aws.amazon.com/linux/al2/ug/amazon-linux-2-virtual-machine.html) | [IMAGE-VM-LINK](https://cdn.amazonlinux.com/os-images/2.0.20241217.0/)
- Offical Migration Guide | [LINK](https://aws.amazon.com/tutorials/move-to-managed/migrate-my-sql-to-amazon-rds/)
- Sample MySQL **Sakila** Database | [LINK](https://dev.mysql.com/doc/sakila/en/sakila-installation.html)
- Amazon EC2 Instance Connect endpoints regionwise| [LINK](https://docs.aws.amazon.com/general/latest/gr/ec2-instance-connect.html)
    - `ap-south-1` : `ec2-instance-connect.ap-south-1.amazonaws.com`


---
## **Credentials/Script**

<details>

<summary>
<b> 1. Database Credentials </b>
</summary>

```txt
(after)
ROOT_PASSWORD="rootPassword#0"

ADMIN_USER="admin"
ADMIN_PASSWORD="adminPassword#1"
```

</details>


<details>

<summary>
<b> 2. EC2 User Data (for Amazon Linux 2)</b>
</summary>

```sh
#!/bin/bash
# This script is intended for amazon linux 2
# Note: ec2 user data run as root(sudo). so not required to specify explicitly.

# Update the system
yum update -y
# amazon-linux-extras is already installed in system
amazon-linux-extras install epel -y

# Getting rpm package from MySQL
RPM_PKG_NAME="mysql80-community-release-el7-5.noarch.rpm"
rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022 # gpg key | year 2022
curl https://dev.mysql.com/$RPM_PKG_NAME -o $RPM_PKG_NAME
rpm -i $RPM_PKG_NAME # -ivh : verbose,hash

# Install MySQL server and client
yum install mysql-community-client mysql-community-server -y

# Start and enable MySQL service
systemctl enable mysqld
systemctl start mysqld

sleep 5

# Set root password and secure MySQL installation
TEMP_PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')
ROOT_PASSWORD="rootPassword#0"

mysql --connect-expired-password -u root -p"$TEMP_PASSWORD" <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}';
UNINSTALL COMPONENT "file://component_validate_password";
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test'
FLUSH PRIVILEGES;
EOF

# explanation of above :
#   - change root password
#   - remove password policy
#   - remove anonymous users
#   - remove test database
#   - remove privileges on test database

# Updating MySQL configuration to allow remote connections and enabling binary logging for replication
echo -e "\nbind-address=0.0.0.0\n\nlog_bin=mysql-bin\nserver-id=1\nbinlog_format=ROW\n" >> /etc/my.cnf

# Restart MySQL to apply configuration changes
systemctl restart mysqld

# sleep 2

ADMIN_USER="admin"
ADMIN_PASSWORD="adminPassword#1"

# Create a new admin user with remote access (% - from any ip)
mysql -u root -p"${ROOT_PASSWORD}" <<EOF
CREATE USER '${ADMIN_USER}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${ADMIN_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# Download and import the sample Sakila database
USER_HOME_DIR="/home/ec2-user"
curl "https://downloads.mysql.com/docs/sakila-db.zip" -o "${USER_HOME_DIR}/sakila-db.zip"
unzip $USER_HOME_DIR/sakila-db.zip
mysql -u "${ADMIN_USER}" -p"${ADMIN_PASSWORD}" -e "SOURCE ${USER_HOME_DIR}/sakila-db/sakila-schema.sql"
mysql -u "${ADMIN_USER}" -p"${ADMIN_PASSWORD}" -e "SOURCE ${USER_HOME_DIR}/sakila-db/sakila-data.sql"

# Completion
echo "MySQL installation, configuration, user creation, and Sakila database import completed."


# Testing
#   rpm -qa | grep "mysql" # list all rpm packages and filter mysql
#   rpm -K mysql80-community-release-el7-5.noarch.rpm # verify package
#   rpm -qa gpg-pubkey # list all installed gpg pub keys

```

</details>


<details>

<summary>
<b> 3. Amazon Linux 2 in Hyper-V (Locally) </b>
</summary>

Please Open in new tab
> Check this project in [amazon-linux-2-hyper-v](../amazon-linux-2-hyper-v/)

</details>

---
## **Explanation**
1. I have performed Homogeneous Migration, means both database engine are similar. In future, I will include Project v2 og heterogeneous Migration, utlizing AWS Schema conversion tool.
2. Instances used are (eligible for free tier)
    - Source DB on EC2: `t2.micro`
    - Replication Instance : `dms.t2.micro`
    - Target RDS DB : `db.t4g.micro`
3. Networking & Security : Only EC2 instance, which source Source DB has public IP connectivity. Additionaly Connection was made using EC2 connect endpoint removing the need of public/private keys to SSH into instance.
    - Region - AZ : `ap-south-1a` for all resources (to avoid inter-az charges)
    - VPC, Subnet, NACL : `default`
    - Security Groups :
        - Source DB SG : Allow from Replication SG, Target SG on port: `3306`, EC2 Connect Endpoint on `22`
        - Replication SG : Allow from Replication SG on `3306`, Source SG on `all ports`
        - Target DB SG : Allow from Replication SG on `3306`, Source SG on `all ports`
        - NOTE: The reason we have allowed traffic on all ports in Replication & Target DB SG from Source DB SG, so that in case of  troubleshooting, we can easily connect to them via Private IP as we have connected to only Source EC2 Instance(public IP) via EC2 Connect Endpoint
4. EC2 User Data Script **(Automation)** 
    - ☑ install mysql 8 server and client
    - ☑ configure 1st installation and root password
    - ☑ add new user with all privileges
    - ☑ download & instal sakila db


### **Steps : (To perform)**
0. Prequisite :
    - AWS Free Tier account (750 hours/month compute)
    - DMS : In order to use DMS, we have to create IAM roles to allow DMS to call AWS services/action on our behalf. The list is:
      | NO. | ROLE | POLICY | DESCRIPTION |
      |-----|------|--------|-------------|
      |  1  | `dms-vpc-role ` | `AmazonDMSVPCManagementRole` | A role that allows you to manage Amazon VPC |
      |  2  | `dms-cloudwatch-logs-role`  | `AmazonDMSCloudWatchLogsRole` | A role that allows you to publish logs to CloudWatch Logs |
    - MySQL DB should have allow access : one can configure in `/etc/my.conf`
        - `bind-address` : 0.0.0.0 | to allow connection from any ip
        - binary logging should be enabled: To use replication capabilities by DMS.
        - Dont worry, I have covered that part in User data script given above. It will automatically add this entries in /etc/my.conf file
        <img width="878" alt="proj-6-db-migrate-op-1b-ec2-src-db-mysql-myconf" src="https://github.com/user-attachments/assets/9d3d8ace-59c1-489b-a278-c010aedde718" /> 
1. Create & Configure Security Groups for each. you can create & use privat subnet for RDS & Replication Instance.
2. Create Source MySQL Database:
    - Launch EC2 instance with public IP
    - Use User Data Script given below to download provison and install sample database with all necessary requirement to be eligible for Migration.
    - Connect it using EC2 Connect Endpoint at AWS Management Consoleand verify if database, users and conf file are proper.
3. Create MySQL Database in RDS : use instance type of free tier with same credentials that are used in Source Database for simplicity
4. Configure DMS Service :
    1. Create Replication Instance : In same AZ. You will get frustrated as it takes so much time to be able to usable. You can perform this step in 1st place, which will save you a lot of time, but in ideal scenario source and target database are available before migration.
    2. Create Source & Target Endpoints
    3. Create DB Migration Task:
5. Post Migration :
    - Verify Target Database : As we have alread connected to source EC2 instance via Connect Endpoint. use mysql cli with target db endpoint identifer to connect and verify the databases and tables are migrated properly
    - The commands are :
      ```sh
      $ mysql -u admin -p"adminPassword#1 "-h <rds-mysql-endpoint>
      mysql > show databases;
      mysql > use sakila;
      mysql > show tables;
      mysql > -- This script is to calculate size of your database
      mysql > SELECT table_schema AS "Database", SUM(data_length + index_length) / 1024 / 1024 AS "Size (MB)" FROM information_schema.TABLES GROUP BY table_schema;
      ...(any query you want)
      ```
6. Clean Up : one should clean up all resources which are note required. Delete resources one by one (maintain this order)
    - Migration Task > Endpoints(Source & Target) > Replication Instance
    - RDS Target Database > Delete | (take snapshot if required)
    - Source EC2 Instance > Terminate | (Create AMI if u need in some project)
    - `Non-Default` VPC, Subnets, Security Groups, etc : if you have created
    - IAM Roles : Ideally you should remove any non-requried resource. But My Suggestion is not delete the 2 roles, as in future we might need for DB Migration. So keep them


---
## **Acknowledgements**
- [Amazon Web Services - AWS](https://aws.amazon.com/)
- [Microsoft Hyper-V](https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/about/)
