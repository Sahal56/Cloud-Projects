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

#### **Hotel App hosted at App Runner**
<img width="1112" alt="proj-ci-cd-pipeline-result-1" src="https://github.com/user-attachments/assets/b7804dc0-877a-4625-8cb6-621eb4884246" />
<img width="1112" alt="proj-ci-cd-pipeline-result-2-crud" src="https://github.com/user-attachments/assets/9011750c-c622-4f35-bbb4-e9692e059bc1" />

#### **CodePipeline**
<img width="1421" alt="proj-ci-cd-pipeline-result-3-codepipeline" src="https://github.com/user-attachments/assets/41dbea48-1bf6-4c60-8955-1cb28e4a1a40" />

#### **CodeBuild**
<img width="1426" alt="proj-ci-cd-pipeline-result-4-codebuild" src="https://github.com/user-attachments/assets/c66057af-b3f4-4b7f-b532-a3d88da1b7d9" />

#### **Testing Locally**
<img width="1107" alt="proj-ci-cd-pipeline-result-5-locally" src="https://github.com/user-attachments/assets/0b31a9b7-9e7d-4586-95c2-a93548887783" />

---
END
---


<!--
---
####
****
```sh
```
-->
