#!/bin/bash

# Author        : Sahal Pathan | github.com/sahal56
# Descirption   : This script is to automatically install MySQL Version 8 on Amazon Linux 2023


# Download MySQL Yum repository
sud wget https://dev.mysql.com/get/mysql80-community-release-el9-3.noarch.rpm

# Update Al2023 Packages
sudo dnf update -y

# Install MySQL 8 on Amazon Linux 2023
sudo dnf install mysql-community-server

# enabling start up at boot & starting the daemon service
sudo systemctl enable mysqld
sudo systemctl start mysqld

# wait for 3 seconds
sleep 3

# verify it is running
sudo systemctl status mysqld



# temporary password
sudo grep 'temporary password' /var/log/mysqld.log

# Update the System Packages
# sudo yum update -y && amazon-linux-extras install epel -y
# sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022

# # Add the MySQL Yum Repository
# sudo yum install https://dev.mysql.com/get/mysql80-community-release-el7-5.noarch.rpm 

# # Install MySQL Server
# sudo yum install --nogpgcheck mysql-community-server -y


# Start and Enable MySQL Service
# sudo systemctl start mysqld && systemctl enable mysqld


# sleep 2

# verify it is running
# sudo systemctl status mysqld

# temporary password
sudo cat /var/log/mysqld.log | grep "A temporary password"

echo " > note down the temporary password for 1st login."
echo " > enter any key to continue"
read $1

ROOT_DB_PASSWORD="rootPassword#0"
echo " > use new password: ${ROOT_DB_PASSWORD} after 1st login."
echo " > NOTE: Save this for future use"

# Secure MySQL Installation
sudo mysql_secure_installation


# If you encounter problems related to GPG keys, such as with the package mysql-community-client-8.0.28-1.el7.x86_64 and the GPG keys configured as file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql, you can temporarily disable the GPG key check in YUM.
# While bypassing GPG verification is generally not advisable due to security risks, it can be done if you trust the source and integrity of the packages.
# To disable the GPG check for the MySQL repository:
# Edit the Repository Configuration: Open the MySQL repository file in /etc/yum.repos.d/ and set gpgcheck=0 for the MySQL repository section.
# Clean YUM Cache and Retry: Clear the YUM cache and try the installation again to bypass the GPG key check temporarily.

# Log in to MySQL

echo " > lets login to mysql as root user | password : ${ROOT_DB_PASSWORD}"

mysql -u root -p
