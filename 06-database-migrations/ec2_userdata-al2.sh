#!/bin/bash
# This scritp is intended for amazon linux 2
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
