#!/bin/bash

# Author        : Sahal Pathan | github.com/sahal56
# Description   : MySQL Database => 1) Add a user with all privileges. 2) Installing & Populating Sample sakila DB


##################################################################### VARIABLES #####################################################################

echo -e "\n > preferrence for var assignment: (1) static (2) runtime"
read -p "enter your choice: " user_choice

echo -e "\n"

# hostname or IP : localhost | 92.91.92.128 | aws.rds.eceni.db
# Required only if you use it | Note: we have used 'user'@'%' to allow from any IP

if [ $user_choice -eq 1 ]; then

    DB_IDENTIFIER="localhost"
    ROOT_DB_USER="root"
    ROOT_DB_PASSWORD="rootPassword#0"
    DB_USER="admin"
    DB_PASSWORD="adminPassword#1"
    
elif [ $user_choice -eq 2 ]; then

    read -p "db root username: " ROOT_DB_USER
    read -p "db root user password: " ROOT_DB_PASSWORD
    read -p "db username: " DB_USER
    read -p "db user password: " DB_PASSWORD
    read -p "db identifier (hostname/ip): " DB_IDENTIFIER

else
    echo -e "\n > select proper choicec !!!"
    echo "exiting... Try Again"
    exit 1
fi

CURRENT_PATH=$(pwd)

##################################################################### PART - I #####################################################################

echo -e "\n===> 1: Creating a New User in our MySQL Database with All Privileges"

echo -e "\n > modifying my.cnf file to allow remote connection from any IP address"
echo " > change bind-address : 127.0.0.1 ==> 0.0.0.0"
echo " > save file and close"

echo -e "\n > opening text editor in 3 seconds"
sleep 3

echo -e "\n > enter sudo password ::"

# modify my.cnf path accordingly
case $(uname) in
    "Darwin")
        sudo open -t "/opt/homebrew/etc/my.cnf" # for mac
    ;;
    
    "Linux")
        sudo nano "/etc/my.cnf" # for linux
    ;;
esac

echo -e "\n > enter any key to continue"
read $1

DB_INS_USER_COMMANDS=" \
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'; \
GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' WITH GRANT OPTION; \
FLUSH PRIVILEGES; \
"

echo -e "\n"
mysql -u "$ROOT_DB_USER" -p"${ROOT_DB_PASSWORD}" -e "$DB_INS_USER_COMMANDS"

echo -e "\n"
if [ $? -eq 0 ]; then
    echo " > User: ${DB_USER} created successfully with all privileges."
else
    echo "Try Again !!!"
    exit 1
fi

##################################################################### PART - II #####################################################################

echo -e "\n===> 2: Installing sample sakila database & populating data"

CURRENT_PATH=$(pwd)
DIR_NAME="database_data"

# Create a dir if not exists
if [ ! -d "${CURRENT_PATH}/${DIR_NAME}" ]; then
  # Create the directory if it doesn't exist
  mkdir -p "${DIR_NAME}"
  echo -e "\n > Directory '${DIR_NAME}' created successfully."
else
  echo -e "\n > Directory '${DIR_NAME}' already exists."
fi

# changing current directory | ./scripts/database_data/
cd ./${DIR_NAME}


CURRENT_PATH=$(pwd)
SAKILA_DB="sakila-db"

# Download DB file if not exists
if [ -f "${CURRENT_PATH}/${SAKILA_DB}.zip" ]; then
    echo -e "\n > sakila db zip file exists"
else
    echo -e "\n > downloading sakila db zip file ..."

    curl --http2 -o sakila-db.zip https://downloads.mysql.com/docs/sakila-db.zip

    echo " > downloaded sakila db"
fi

echo -e "\n > unzipping zip file ...\n"

# unzipping downloaded file
unzip ${SAKILA_DB}.zip

# changing current directory | ./scripts/database_data/sakila-db/
cd sakila-db/

CURRENT_PATH=$(pwd)
DB_INS_SAKILA_DB_COMMANDS=" \
SOURCE ${CURRENT_PATH}/sakila-schema.sql; \
SOURCE ${CURRENT_PATH}/sakila-data.sql; \
"

echo -e "\n"

mysql -u "${DB_USER}" -p$"${DB_PASSWORD}" -e "${DB_INS_SAKILA_DB_COMMANDS}"


if [ $? -eq 0 ]; then
    echo -e "\n > sakila db populated with data successfully"
else
    echo " > Error Try Again !!!"
    exit 1
fi

# changing dir to parent dir | ./scripts/
cd ../../

echo -e " > byee ...\n"

##################################################################### END #####################################################################