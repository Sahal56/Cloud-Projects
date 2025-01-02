# **Container Games on Amazon ECS**
- Containerized four web-based games using Docker, ensuring compatibility with AWS Fargate on the Linux x86_64 architecture
- Pushed the Docker images to Amazon Elastic Container Registry (ECR) for secure and scalable image management.
- Deployed the containerized games on Amazon Elastic Container Service (ECS), ensuring seamless operation in a cloud-native environment.
- Implemented auto-scalin g and load balancing to handle varying traffic loads efficiently and maintain high availability.
- Explored blue-green deployment strategies by manually deploying a new updated service, enhancing deployment practices for minimizing downtime and risks.
- Services : AWS ECS, ECR, ALB, Docker

<details>
 <summary> <b> ECS GUIDE</b> </summary>

 ## **Key Components of Amazon ECS**
### Introduction to Amazon ECS
- Amazon Elastic Container Service (ECS) is a fully managed container orchestration service provided by AWS that makes it easy to deploy, manage, and scale containerized applications.
- ECS supports Docker containers and allows you to run and manage containers on a cluster of EC2 instances or using AWS Fargate, a serverless compute engine.

1. Clusters:
- A logical grouping of container instances or tasks.
- Clusters can run on EC2 instances, AWS Fargate, or a mix of both.

2. Task Definitions:
- Blueprint for your application.
- Specifies parameters for the container, such as Docker image, CPU, memory, port mappings, and environment variables.
- Defines multiple containers within a single task if needed.

3. Tasks and Services:
- Tasks: A running instance of a task definition. It is the smallest unit of work in ECS.
- Services: Maintain the desired number of task instances. Can be associated with load balancers to distribute traffic across tasks.

4. Container Instances:
- EC2 instances registered to the ECS cluster.
- Run the ECS agent, which manages the tasks.

5. ECS Agent:
- A container running on each container instance that communicates with the ECS control plane to manage tasks.

6. Launch Types:
- EC2 Launch Type: Deploys tasks on a cluster of Amazon EC2 instances managed by the user.
- Fargate Launch Type: Deploys tasks on serverless infrastructure managed by AWS, removing the need to manage EC2 instances.

7. Task Scheduler:
- Places tasks based on the specified placement strategy and constraints.
- Ensures the desired state of tasks is maintained in the cluster.

8. Load Balancing:
- Integrates with Elastic Load Balancing (ELB) to distribute incoming traffic across tasks.
- Supports Application Load Balancer (ALB) and Network Load Balancer (NLB).

</details>

<details>
 <summary> <b> Docker Commands used in this mini project </b> </summary>
 ```sh
 $ docker build -t <image> .       # build
 $ docker images                   # display build images
 $ docker run -d -p 80:80 <image>  # run container
 $ docker ps                       # display running containers
 $ docker ps -a                    # display all/stopped  containers
 $ docker stop <container-id>      # stop running container
 $ docker rm <container-id>        # delete running container
 $ docker rmi <image>              # delete image
 ```
 
</details>


---
## **Output**

#### **Screenshots**
 
<img width="1792" alt="proj-5-5-rusult-home-page" src="https://github.com/user-attachments/assets/669b7f26-b7c4-48d0-b350-4edb787a196a" />


| **Cluster - Service** |
|-----------------------|
| <img width="1361" alt="proj-5-5a-ecs-cluster-services" src="https://github.com/user-attachments/assets/901ebd17-672a-4f70-8bcc-569b7978ff81" /> |


| **Cluster - Task** |
|-----------------------|
| <img width="1376" alt="proj-5-5b-ecs-cluster-tasks" src="https://github.com/user-attachments/assets/936e186d-5ffe-4c6a-a994-b05fcabdd409" /> |


| **ALB** |
|-----------------------|
| <img width="1664" alt="proj-5-5c-alb" src="https://github.com/user-attachments/assets/bb0f77c0-bc5f-4cd1-a67b-14d37f9d3df3" /> |




<details>
 <summary> <b> Blue Green Deployment </b> </summary>
 
 | **video demo** |
 |----------------|
 | https://github.com/user-attachments/assets/97be68ad-b16a-4d88-a24c-88756a5e0216 |


| **changes** |
|-----------------------|
| <img width="363" alt="proj-5-6a-blue-green-deploy" src="https://github.com/user-attachments/assets/2aa65b02-70d6-4da8-b07c-f10de5bcbad4" /> |


| **Force Deploy** |
|-----------------------|
| <img width="1201" alt="proj-5-6b" src="https://github.com/user-attachments/assets/6753366b-6802-40ab-93b3-9a9d2f9c0a70" /> |


| **Updating Cluster** |
|-----------------------|
| <img width="1405" alt="proj-5-6c" src="https://github.com/user-attachments/assets/d3f92f54-74c2-48ab-9097-341c2eea881d" /> |
| <img width="1408" alt="proj-5-6d" src="https://github.com/user-attachments/assets/e2e08f40-fa4d-4d76-a3ff-13adf7cc2f2b" /> |

| **Result Updated** |
|-----------------------|
| <img width="1792" alt="proj-5-6e-result-changed" src="https://github.com/user-attachments/assets/c1f8d7e9-fd7f-41ad-bc21-3dbcff6ae626" /> |
 
</details>

<details>
 <summary> <b> Screenshots @ loacalhost:80 | Distroless Nginx </b> </summary>

| **Docker Build** |
|-----------------------|
| <img width="917" alt="proj-5-0a-local-docker-build" src="https://github.com/user-attachments/assets/edfed541-5cb7-437b-86a7-06c990ad3f98" /> |

| **Docker Run** |
|-----------------------|
| <img width="1285" alt="proj-5-0b-local-docker-run" src="https://github.com/user-attachments/assets/a800de01-2096-4bf9-bb70-310e14d189be" /> |

| **Result** |
|-----------------------|
| <img width="1658" alt="proj-5-0c-result" src="https://github.com/user-attachments/assets/439d0f88-835e-451a-9d72-f3245748556f" /> |
| <img width="900" alt="proj-5-0d-local-docker-app" src="https://github.com/user-attachments/assets/e71d9d76-3fbe-4f54-903f-c1e512dc42c3" /> |
 
</details>

---
## **Troubleshooting**
1. Tried with Distroless Image : So ecs health check fails, due to absence of `shell` and `curl` in distroless nginx image
Solution : Used Alpine Image 

2. Architecture Problem : Mismatch Container of differenet architecture : `amd64`, `arm64` can cause problem
    - Explanation :
        - My laptop's local builds resulted in arch:ARM containers (As I am Using MacBook Air M1).
        - And I selected Fargate as Arch: `x86_64` ~ `amd64`. So containers were running and exiting.
        - So, have to troubleshoot in CloudWatch > Logs > `exec failed`
        - Solution: Build Multi-arch image or specify with `--from` arch explicitly
        - NOTE: On Fargate `arm64`, my image works, but i have used `x86_64` in ECS Cluster setup.

|**WHY used x86_64 or amd64 ???**|
|-----------------|
| <img width="775" alt="proj-0-note" src="https://github.com/user-attachments/assets/2d1bb995-261e-473a-b1e2-1dffaf92871d" /> |
|I am using Region : `us-east` !! for safe side|

