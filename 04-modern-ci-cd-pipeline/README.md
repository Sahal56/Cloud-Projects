# **Modern CI/CD Pipeline**


## **Architecture**
![arch](https://static.us-east-1.prod.workshops.aws/public/55755b07-34e5-43aa-90b3-3477fb95a29c/static/images/introduction/cicd_overview.png)



---
## **Explanation**

1. CodeConnection : Created AWS Connection integration with GitHub. We have utilised GitHub App
2. CI Pipeline for Front End : First of all, by using CodeBuild, implemented Build Stage for Unit Tests. Afterwards, add another buidl stage which containerize frontend to build Docker Images and pushes into Amazon Elastic Container Registry (ECR). Finally, used CodePipeline to orchestrate whole pipeline including both build stage.
3. CI/CD Pipeline for Back End : Implemented Pipeline for backend Node.js App with CodeBuild stage to provision infrastructure & resources using CloudFormation template
4. Continuous Deployment : Made use of CodePipeline filters(which triggers pipeline based on filters/conditions). Utilized AWS App Runer to host our app by configuring CloudFormation stack. Lastly, added Deploy Stage for our Frontend Pipeline.
5. Refining our Pipeline/s (Learnt): Learnt the use stage level gates and automatic rollbacks, which optimize our pipeline. Mastered the integration of Integration Tests in our Pipeline, its benefits and checked reports in AWS CodePipeline to ensure optimal working.
6. Troubleshooting : Acquired a lot knowledge while troubleshooting, ranging from lack of permission access of used IAM Role to opimizing and modifying buildspec file/s, commands, etc. Made use of CloudWatch logs for troubleshooting erros.

---
## **Output**

---
#### **Locally**

1. Forking repo in local machine
```sh
$ git clone https://github.com/aws-samples/modern-cicd-with-github-and-aws-codepipeline.git
```

2. install required packages
```sh
$ cd modern-cicd-with-github-and-aws-codepipeline/
$ npm i
```

3. Testing App locally
```sh
$ npm run start
```
4. Checking at [localhost:8081](http:localhost:8081/)
<!--image-->




<!--
---
####
****
```sh
```
-->
