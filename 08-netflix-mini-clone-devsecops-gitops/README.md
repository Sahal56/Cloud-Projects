# **Netflix Mini Clone: DevSecOps + GitOps**
- Designed and implemented CI pipeline for SAST (SonarQube), dependency scanning (OWASP Dependency Check), image/file scanning (Trivy) and triggered CD pipeline to update Kubernetes manifests (poly repo) and deploy to an EKS cluster via ArgoCD, following GitOps practices.
- Automated container build, tagging, and push to Docker Hub registry & set up pipeline status alerts via slack and email.
- Scripted EC2 User data to automate Jenkins EC2 provisioning, software installation, Nginx reverse proxy setup, and SSL certificate generation by certbot.
- Configured AWS Security Groups, external DNS records, and subdomains for Jenkins, SonarQube, and deployed app.
- Provisioned an AWS EKS cluster and deployed ArgoCD, Prometheus, and Grafana monitoring stack using Helm charts.
- Monitored cluster health and application performance using Prometheus metrics and Grafana dashboards.

---
## **Architecture**


---
## **Output**
<img width="1050" alt="Image" src="https://github.com/user-attachments/assets/9906edab-1e3d-4dae-841e-845c626f7fdd" />

<details>
<!-- 1st level expand -->
  <summary> <b> Expand to see All SS </b> </summary>



| **Netflix App - running on Kubernetes Pods** |
|----------------------------------------------|
| <img width="1050" alt="Image" src="https://github.com/user-attachments/assets/37fa360a-e0e3-41fb-bc75-b5af9eff3e74" /> |
| **Media Player** |
| <img width="1284" alt="Image" src="https://github.com/user-attachments/assets/4c78fb4b-ae84-4cbe-ab77-9fdfd7407c72" /> |


<details>
  <!-- 2nd level expand -->
  <summary> <b> Jenkins </b> </summary>

|   | **Jenkins Pipelines** |
|---|-----------------------|
| `CI Pipeline` | <img width="1641" alt="Image" src="https://github.com/user-attachments/assets/45991b59-a458-4522-a554-9438a5ccc29a" /> |
| `CD Pipeline` | <img width="1139" alt="Image" src="https://github.com/user-attachments/assets/cd1651bd-7348-4f64-b1da-f770b5d25ac8" /> |
| `Dashboard` |<img width="1303" alt="Image" src="https://github.com/user-attachments/assets/0a64e144-c294-46a4-b9df-e2596cfa69bb" /> |

  <!-- 2nd level end -->
</details>


<details>
  <!-- 2nd level expand -->
  <summary> <b> Alerts </b> </summary>

|   | **Pipeline Alert Notification** |
|---|-----------------------|
| `slack` | <img width="1069" alt="Image" src="https://github.com/user-attachments/assets/05f15a1a-f112-4e0d-bcee-c3cac5fc6f34" /> |
| `email` | <img width="1049" alt="Image" src="https://github.com/user-attachments/assets/6689f8a3-415a-476b-96f6-5c1736e2407a" /> |

  <!-- 2nd level end -->
</details>


<details>
  <!-- 2nd level expand -->
  <summary> <b> Grafana Dashboards </b> </summary>

| **Admin** |
|-----------|
| <img width="1172" alt="Image" src="https://github.com/user-attachments/assets/568bdaa3-7d43-4786-8d73-a9e20cc828df" /> |
| <img width="1677" alt="Image" src="https://github.com/user-attachments/assets/9de5e129-74c6-48cc-9811-df281f12ca35" /> |
| <img width="1376" alt="Image" src="https://github.com/user-attachments/assets/296f762a-900a-493c-a3ff-0aa863ffa2b3" /> |
| <img width="1307" alt="Image" src="https://github.com/user-attachments/assets/aafb5c2a-2f54-4ac9-ba55-ff031b05e166" /> |
    
  <!-- 2nd level end -->
</details>
  
<!-- 1st level end -->
</details>

---
## **Troubleshooting**
1. `main` branch not explicitly mentioned in 2nd pipeline. Why? Jenkins might have use default: `master` branch
2. Inconsistent file extension `Deplpyment.yml` (yml instead of yaml). Error: `File not found` Silly one !
3. Pipeline can update manifest in 2nd repo, but unable to read username. Classic Jenkins Problem. We have to use `withCredentials` and `git push https://${GIT_USERNAME}:${GIT_PASSWORD}@<repo> <branch>` format or use SSH configuration
4. Main problem : owasp not generating report, Problem: version
    - As per official doscs, DP-Check version >= 9.0.0 requires NVD API Key for fast scan, otherwise it will be limited to 1 req/s.
        `--nvdCredentialsId ${env.OWASP_NVD_API_KEY}`
    - Well, Although I have utitlised API Keys, but I used old DP-Check version 6.5.1. so it is not required at all
    - Referrence: [DP-Check Plugin](https://www.jenkins.io/doc/pipeline/steps/dependency-check-jenkins-plugin/)

---
## **ACKNOWLEDGEMENTS**
- [Netflix-app-Nasrullah-CloudChamp](https://www.youtube.com/watch?v=g8X5AoqCJHc&t=4898s)
- [GitOps-Rajdeep](https://www.youtube.com/watch?v=o4QG_kqYvHk)
- [AWS-Official-Kubernetes-EKS](https://docs.aws.amazon.com/eks/latest/userguide/create-cluster.html)
