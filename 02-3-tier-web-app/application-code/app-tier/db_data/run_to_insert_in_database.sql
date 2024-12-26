-- SHOW DATABASES;
-- CREATE DATABASE IF NOT EXISTS webappdb;
-- DROP DATABASE webappdb;
-- USE webappdb;

-- CREATE TABLE IF NOT EXISTS transactions(id INT NOT NULL AUTO_INCREMENT, amount DECIMAL(10,2), description VARCHAR(100), PRIMARY KEY(id));
-- DROP TABLE transactions;
-- TRUNCTATE transactions;

-- SELECT * FROM transactions;

-- INSERT INTO transactions (amount,description) VALUES ('400','groceries');

-- --------------------------------------------------------------------------------------------------------------------------------------------
-- RUN THIS TO CREATE DB, TABLE & INSERT DATA

CREATE DATABASE IF NOT EXISTS webappdb;
USE webappdb;

CREATE TABLE IF NOT EXISTS transactions(id INT NOT NULL AUTO_INCREMENT, amount DECIMAL(10,2), description VARCHAR(100), PRIMARY KEY(id));

INSERT INTO transactions (amount,description)
VALUES
('400','DMart Groceries'),
('20','Parle Munch'),
('100','Juice'),
('50','Fuel'),
('40','Pani Puri'),
('10000','Gold'),
('424244','HOUSE'),
('500000','BMW');


-- To run above script
-- $ mysql -u {username} -p -h {hostname} -D {database-name} < run_to_insert_in_database.sql
