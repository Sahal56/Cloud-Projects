# **Modern CI/CD Pipeline**
- Implemented & Deployed multi-staged CI/CD pipeline using AWS CodePipeline, integrating frontend and backend workflows with unit tests and deployment stages.
- Automated deployment of containerized applications to App Runner, using AWS Elastic Container Registry (ECR) and CloudFormation for infrastructure as code.
- Optimized workflow by enabling GitHub based code integration with webhooks and automated triggers, streamlining branch deployments and reducing manual intervention.
- Utilized CodePipeline filters for triggering specific build and deployment stages based on branch patterns and commit tags, ensuring efficient and targeted CI/CD workflows.

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

> For a complete workflow check at [workflow](./workflow.md)

---
## **Learning**

#### 1. Types of repository
![mono-multi-repo](https://static.us-east-1.prod.workshops.aws/public/55755b07-34e5-43aa-90b3-3477fb95a29c/static/images/introduction/monorepo.png)

- monorepo (aka monolithic repository) : It is software dev practice to have single source repo for multiple projects, components e.g. front-end, backend
- multirepo/pollyrepo: It is opposite of monorepo, different components have separte source repo. i.e. frontend, backend, other services, etc


#### 2. Branching Strategy
- Overview : It is set of guidelines/workflows used by dev teams to manage, collabrate on and release code efficiently within VCS.
- Types: 
    1. Github Workflow: simplified, single long lived branch focus on Continuos Integration & Continuos Delivery. Suitable for fast paced devlopement, SaaS apps.
    2. Trunk-Based Development: Dev frequently merges small(incremental) change to main branch, suitable for SaaS apps.
    3. Release Branching: Differnt version of product have separata reelease branches, for manintaining software apps, Long term support, complex apps
    4. Forking Workflow: Mostly used in Open Source. Dev forks the main repo, submits PR(pull request) for review. One main repo, and multiple contributors/devlopers has own repo.
 
| Github Workflow | Trunk Based Development Flow | Release Branching | Forking Workflow |
|-----------------|------------------------------|-------------------|------------------|
| ![Github Workflow](https://static.us-east-1.prod.workshops.aws/public/55755b07-34e5-43aa-90b3-3477fb95a29c/static/images/introduction/Branching_detail-GithubFlow.png) | ![Trunk Based Development Flow](https://static.us-east-1.prod.workshops.aws/public/55755b07-34e5-43aa-90b3-3477fb95a29c/static/images/introduction/Branching_detail-TrunkBased.png) | ![Release Branching](https://static.us-east-1.prod.workshops.aws/public/55755b07-34e5-43aa-90b3-3477fb95a29c/static/images/introduction/Branching_detail-ReleaseBranching.png) | ![Forking Workflow](https://static.us-east-1.prod.workshops.aws/public/55755b07-34e5-43aa-90b3-3477fb95a29c/static/images/introduction/Branching_detail-Forking.png) |

#### 3. What is CI/CD?
- CI/CD: Continuous Integration and Continuous Delivery/Deployment
- Final Approval for deployment in Production environment:
    - Automatic : Deployment
    - Manual    : Delivery
- Definition: It is a set of practices and processes in modern software development that focuses on automating the stages of application building, testing & deployment.
- Biggest advantages we get are:
    - frequent & reliable software update releases (within a year many compared to very few)
    - reduce manual effort
    - aims to improve code quality
    - Faster Time to Market
    - Improved Developer Productivity

![CI-CD](https://static.us-east-1.prod.workshops.aws/public/55755b07-34e5-43aa-90b3-3477fb95a29c/static/images/introduction/cicd_diagram.png)

- Continuous Integration (CI): Continuous Integration is the practice of automatically integrating code changes from multiple developers into a shared repository, usually multiple times a day. As soon as new code is merged into the repository, an automated build and testing process begins to ensure that the codebase remains stable and functional.
- Continuous Delivery (CD): Continuous Delivery is the next step after Continuous Integration. It ensures that the integrated and tested code is always ready for release into a production-like environment. With Continuous Delivery, all changes are automatically deployed to a staging or pre-production environment after passing automated tests. However, the final decision to push code to production is still a manual trigger.
- Continuous Deployment (CD): Continuous Deployment is a further step from Continuous Delivery. In this approach, any change that passes the CI pipeline's automated tests is automatically deployed to the production environment without any manual intervention.




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
