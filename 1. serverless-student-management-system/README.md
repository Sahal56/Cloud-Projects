# **Serverless Student Management System**

- A serverless student management system is a cloud-based application that enables the management of student data (CRUD operations) without the need to manage or provision traditional servers, leveraging AWS Serverless services
- We can add/edit/delete details of Student like name, roll no./id, email, contact number.

- Technologies used : **AWS Amplify, Amazon API Gateway, AWS Lambda, Amazon DynamoDB**.

# **Prerequisites**
- This is project eligible for Free tier

|     Service      | DynamoDB | Lambda | API Gateway | Amplify |
|------------------|----------|--------|-------------|---------|
| Free Tier Limits | <img width="288" alt="prequisite-1-dynamodb" src="https://github.com/user-attachments/assets/b657e148-3bd7-43f8-9f7b-ccf2ae5d5fbf"> | <img width="284" alt="prequisite-2-lambda" src="https://github.com/user-attachments/assets/9f08e0ff-a061-45d9-9ddf-828a0ef868a9"> | <img width="287" alt="prequisite-3-api-gw" src="https://github.com/user-attachments/assets/beb82c19-c7f4-42e6-a2fc-91738efcba25"> | <img width="292" alt="prequisite-4-amplify" src="https://github.com/user-attachments/assets/48b4a3d5-bfb0-4ac8-b66d-204cf4240b0e"> |

---
## **Results**

### **Video**
https://github.com/user-attachments/assets/d833c678-395c-4464-b1ed-2e860a45ac49

### **Screenshots**
<img width="735" alt="result-serverless-stud" src="https://github.com/user-attachments/assets/c0352012-bb62-4114-8c39-4849a8288451">

#### **Postman Testing**

|     GetAll      | Get |
|-----------------|-----|
| <img width="409" alt="postman-1-getall" src="https://github.com/user-attachments/assets/f98b26c7-dd98-47c3-82ce-60504c6f9c9d"> | <img width="518" alt="postman-2-get" src="https://github.com/user-attachments/assets/da656925-88de-4342-a62d-d28d6445543b"> |

| Post |
|------|
| <img width="778" alt="postman-3-post" src="https://github.com/user-attachments/assets/ec53b493-106c-4e2b-8cae-38cb6a82f20d"> |

| Put | Delete |
|-----|--------|
| <img width="360" alt="postman-4-put" src="https://github.com/user-attachments/assets/44927463-bcea-47a1-bbd9-4df6cced576f"> | <img width="431" alt="postman-5-delete" src="https://github.com/user-attachments/assets/80265441-f4b5-4362-b16f-0ebc859899aa"> |



---
## **Explanation**

> NOTE: Refer architecture diagram given above

1. To store student details/data, we have used DynamoDB:
    - we have created two tables `crud-dynamodb-sahal-v1` and `CounterTable`.
    - 1st table will store actual data, while 2nd table, `CounterTable` is used to store counter of no. of items in 1st table, for implementing auto-increment functionality.
2. To perform CRUD, backend is implemented utilising Lambda, Function as a Code:
    - To allow our function to communicate with Database, we have to give permission:
        - we have created IAM Role : `crud-role-sahal-v1`
        - Above role is attached IAM policy:
            1. Inline Policy: Allowing ScanItem, Read, Put, Write, etc, with resource as two tables only, following **Principle of Least Privilege**.
            2. Policy: auto created to write logs in CloudWatch.
    - Configuration:
        - Runtime   : **Python 3.13**
        - Arch      : **ARM**
        - Library   : **boto** for working with AWS services, **Decimal** for conversion between DynamoDB Decimal <=> int/float.
    - Internal Logic is similar to any management system, performing CRUD, but in *POST* method, create operation:
        - we first read & increment counter value from `CounterTable` and store in `student_id`
        - we then use `student_id` as id (primary/partition key) to add item in main table `crud-dynamodb-sahal-v1`
    - Refer : `./src/lambda_function.py`
3. To host our API, we have leveraged API Gateway:
    - `REST API` with `Regional` Endpoint is used.
    - Enabled `CORS` in all methods, Lambda proxy integration, which is forwarding all data to lambda i.e. **API G/W** ==[data, method, headers, path, query string, body, etc.]==> **Lambda fn()**. 
    - Resource and Methods are as follows:
        | Path           | Method | Description                   |
        |----------------|--------|-------------------------------|
        | /students      | GET    | return a list of all students |
        | /students      | POST   | create a new student          |
        | /students/{id} | GET    | return a student              |
        | /students/{id} | PUT    | update a student              |
        | /students/{id} | DELETE | delete a student              |
4. For Hosting Front End we have used AWS Amplify:
    - A single HTML file, containing JS with API endpoint is manually deployed using build.zip file
    - Although we can used VSC repository like Github, Gitlab, CodeCommit, etc, for sake of simplicity we have directly deployed zip file (index.html & arch-image JPEG).
5. Results:
    - Postman: we have tested all APIs with Postman web console
    - Amplify Hosted: `https://dev.dssny3wnuvblt.amplifyapp.com` (resource deleted now)
        - few data already added using AWS Management Console in both DynamoDB Tables
        - we can seamlessly perform SAVE(create), edit(update), delete operation
        - Additionally, there is button **Architecture**, which on pressed, pops up an image of `System Architecture Diagram`.


## **Difficulties & Solutions**
1. Where is ARN of 😡DyanamoDB Tables? to put in policy of of IAM ROLE
    - GSearch: where to find arn of dynamo db table?
    - ARN is easily constructed from your account and table details it's arn:aws:dynamodb:{region}:{userID}:table/{tableName}
    - Sol: It is available, on pressing Additional Info just below,
    - 😂 Impatient Me!!!

2. Due to wrong configuration of API Path in API Gw, I fixed it, but still the same error
    - Sol: Deploy API again in API GW. >> Forgot to redeploy 😗

3. Why i cant access my data in Web browser, index.html file, in postman it works!!
    - Sol: CORS error
    - Although, enabled CORS in API gateway, we have to return CORS header in Lambda function.
    - doesn't know, worked for me🙃

## **Authors**
- [@sahal56](https://www.github.com/sahal56)


## **Acknowledgements**

 - Offical Guide: [AWS DOCS](https://docs.aws.amazon.com/apigateway/latest/developerguide/http-api-dynamo-db.html)
 - Markdown Tables: [Link](https://www.tablesgenerator.com/markdown_tables)
 - Diagram : [Draw.io](https://draw.io/)
 - YT Video for referrence: [Link](https://www.youtube.com/watch?v=7bgUF6YESxA)

---
# ❤️ THANK YOU ❤️
- Hit 🎯 star button if you liked my work
