# modify variables as per you

DB_IDENTIFIER="localhost"

ROOT_DB_USER="root"
ROOT_DB_PASSWORD="rootPassword#0"

DB_USER="admin"
DB_PASSWORD="adminPassword#1"

echo "\n-------------------Credentials--(modify manually)-------------"
echo "DB_IDENTIFIER: ${DB_IDENTIFIER}"
echo "ROOT_DB_USER: ${ROOT_DB_USER} | ROOT_DB_PASSWORD: ${ROOT_DB_PASSWORD}"
echo "DB_USER: ${DB_USER} | DB_PASSWORD: ${DB_PASSWORD}"
echo "----------------------------------------------------------------\n"


DB_STATUS_COMMANDS=" \
SELECT USER FROM MYSQL.USER; \
SELECT table_schema AS 'Database', SUM(data_length + index_length) / 1024 / 1024 AS 'Size (MB)' FROM information_schema.TABLES GROUP BY table_schema; \
USE sakila; \
SHOW FULL TABLES; \
"

mysql -u "${DB_USER}" -p$"${DB_PASSWORD}" -e "${DB_STATUS_COMMANDS}"

if [ $? -eq 0 ]; then
    echo " > byee ..."
else
    echo " > Error Try Again !!!"
    exit 1
fi

# SELECT table_schema AS "Database", SUM(data_length + index_length) / 1024 / 1024 AS "Size (MB)" FROM information_schema.TABLES GROUP BY table_schema;
# SELECT USER FROM MYSQL.USER;
# SHOW DATABASES;
# SHOW TABLES;
# USE sakila;
# SHOW FULL TABLES;
# DROP USER IF EXISTS admin;
# DROP DATABASE IF EXISTS sakila;