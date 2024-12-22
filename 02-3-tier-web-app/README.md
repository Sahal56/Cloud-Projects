# **Three Tier Web Application**


## How to set ENV
```sh
$ source ./path/set_env.sh
```

## **Architecture**
![3-tier-web-app](https://github.com/user-attachments/assets/14ff9066-3b77-4ad8-8362-8272eafb25cd)

---
# Flow
    - first of all creating vpc and components like cidr-range, subnets, ig, route tables, security groups, nacl, load balancers
    - application resoucces, react app, launch template, auto scalinh group for both web and app tier
    - database : with configurations

VPC in ap-south-1 zone
1 Internet Gateway
3 Public Subnets, one in each AZ
3 Private Subnets, one in each AZ
Route Table configurations (main and 2nd)


### To run DB script
1. Login & create a database

```sh
$ mysql -u {username} -p -h {hostname}
{give password}...
mysql > CREATE DATABASE {database-name}
mysql > exit
```

2. Run Script by mentioning database name
```sh
$ mysql -u {username} -p -h {hostname} -D {database-name} < {~/path/}run_to_insert_in_database.sql
```
> Note: database-name: webappdb


---
## **ACKNOWLEDGEMENTS**
- [aws-workshops](https://github.com/aws-samples/aws-three-tier-web-architecture-workshop)
- [vpc](https://spacelift.io/blog/terraform-aws-vpc)
- [env](https://spacelift.io/blog/terraform-environment-variables)
- [subnets](https://www.packetswitch.co.uk/terraform-how-to-associate-multiple-subnets-to-route-table/)
- []()
- []()
- []()