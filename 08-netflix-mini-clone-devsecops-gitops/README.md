<!-- # **Netflix Mini Clone: DevSecOps + GitOps** -->
<h1 align="center">
  <b> Netflix Mini Clone: DevSecOps + GitOps </b>
</h1>

- Designed and implemented CI pipeline for SAST (SonarQube), dependency scanning (OWASP Dependency Check), image/file scanning (Trivy) and triggered CD pipeline to update Kubernetes manifests (poly repo) and deploy to an EKS cluster via ArgoCD, following GitOps practices.
- Automated container build, tagging, and push to Docker Hub registry & set up pipeline status alerts via slack and email.
- Scripted EC2 User data to automate Jenkins EC2 provisioning, software installation, Nginx reverse proxy setup, and SSL certificate generation by certbot.
- Configured AWS Security Groups, external DNS records, and subdomains for Jenkins, SonarQube, and deployed app.
- Provisioned an AWS EKS cluster and deployed ArgoCD, Prometheus, and Grafana monitoring stack using Helm charts.
- Monitored cluster health and application performance using Prometheus metrics and Grafana dashboards.

<h2 align="center">
  <b> Architecture </b>
</h2>

![Image](https://github.com/user-attachments/assets/174694be-1082-4070-8d37-91ba569375ac)

<details>
  <summary> <b>  Cloud Architecture </b> </summary>
  
![Image](https://github.com/user-attachments/assets/80ac5748-c03a-4c3f-b48d-82f3dd6117f0)

</details>

<h2 align="center">
  <b> Output </b>
</h2>

<img width="1050" alt="Image" src="https://github.com/user-attachments/assets/9906edab-1e3d-4dae-841e-845c626f7fdd" />

| `Jenkins` |
|:---------:|
| <img width="1641" alt="Image" src="https://github.com/user-attachments/assets/45991b59-a458-4522-a554-9438a5ccc29a" /> |
| `ArgoCD` |
| <img width="1655" alt="Image" src="https://github.com/user-attachments/assets/ed9790a6-e540-418f-9950-37618a883175" /> |

<details>
<!-- 1st level expand -->
  <summary> <b>  Expand to see All SS </b> </summary>

| `Netflix App - running on Kubernetes Pods` |
|:------------------------------------------:|
| <img width="1050" alt="Image" src="https://github.com/user-attachments/assets/37fa360a-e0e3-41fb-bc75-b5af9eff3e74" /> |
| `Media Player`|
| <img width="1284" alt="Image" src="https://github.com/user-attachments/assets/4c78fb4b-ae84-4cbe-ab77-9fdfd7407c72" /> |
| `Kubernetes Manifest Repo` |
| <img width="1261" alt="Image" src="https://github.com/user-attachments/assets/5c486276-ea78-4a1a-9394-6a02157ed96a" /> |
| `External DNS Records` |
| <img width="1109" alt="Image" src="https://github.com/user-attachments/assets/46f7cad0-4d50-445d-b2cd-abe03a195779" /> |
| `Docker Hub Registry` |
| <img width="1172" alt="Image" src="https://github.com/user-attachments/assets/cb1168a9-6b4e-4509-873d-7567dcc18683" /> |

<details>
  <!-- 2nd level expand -->
  <summary> <b> Jenkins </b> </summary>

|     | `Jenkins Pipelines` |
|:---:|---------------------|
| `CI Pipeline` | <img width="1641" alt="Image" src="https://github.com/user-attachments/assets/45991b59-a458-4522-a554-9438a5ccc29a" /> |
| `CD Pipeline` | <img width="1139" alt="Image" src="https://github.com/user-attachments/assets/cd1651bd-7348-4f64-b1da-f770b5d25ac8" /> |
| `Dashboard`   | <img width="1303" alt="Image" src="https://github.com/user-attachments/assets/0a64e144-c294-46a4-b9df-e2596cfa69bb" /> |

  <!-- 2nd level end -->
</details>

<details>
  <!-- 2nd level expand -->
  <summary> <b> Security </b> </summary>
  
|   | `Security` |
|:---:|------------|
| `OWASP Dependancy Check` | <img width="1643" alt="Image" src="https://github.com/user-attachments/assets/70ca1a8f-a94d-47a1-84fe-6f1ea9f61805" /> |
| `SonarQube - SAST`       | <img width="1458" alt="Image" src="https://github.com/user-attachments/assets/90b23b8c-35ce-4042-8194-63dfc06ba60f" /> |
  
  <!-- 2nd level end -->
</details>



<details>
  <!-- 2nd level expand -->
  <summary> <b> Alerts </b> </summary>

|   | `Pipeline Alert Notification` |
|:---:|---------------------------------|
| `slack` | <img width="1069" alt="Image" src="https://github.com/user-attachments/assets/05f15a1a-f112-4e0d-bcee-c3cac5fc6f34" /> |
| `email` | <img width="1049" alt="Image" src="https://github.com/user-attachments/assets/6689f8a3-415a-476b-96f6-5c1736e2407a" /> |

  <!-- 2nd level end -->
</details>


<details>
  <!-- 2nd level expand -->
  <summary> <b> Grafana Dashboards </b> </summary>

| `Dashboard List` |
|:--------------------:|
| <img width="1172" alt="Image" src="https://github.com/user-attachments/assets/568bdaa3-7d43-4786-8d73-a9e20cc828df" /> |
| <img width="1677" alt="Image" src="https://github.com/user-attachments/assets/9de5e129-74c6-48cc-9811-df281f12ca35" /> |
| <img width="1376" alt="Image" src="https://github.com/user-attachments/assets/296f762a-900a-493c-a3ff-0aa863ffa2b3" /> |
| <img width="1307" alt="Image" src="https://github.com/user-attachments/assets/aafb5c2a-2f54-4ac9-ba55-ff031b05e166" /> |
    
  <!-- 2nd level end -->
</details>
  
<!-- 1st level end -->
</details>

---
<h2 align="center">
  <b> Troubleshooting </b>
</h2>

1. `main` branch not explicitly mentioned in 2nd pipeline. Why? Jenkins might have use default: `master` branch
2. Inconsistent file extension `Deplpyment.yml` (yml instead of yaml). Error: `File not found` Silly one !
3. Pipeline can update manifest in 2nd repo, but unable to read username. Classic Jenkins Problem. We have to use `withCredentials` and `git push https://${GIT_USERNAME}:${GIT_PASSWORD}@<repo> <branch>` format or use SSH configuration
4. Main problem : owasp not generating report, Problem: version
    - As per official doscs, DP-Check version >= 9.0.0 requires NVD API Key for fast scan, otherwise it will be limited to 1 req/s.
        `--nvdCredentialsId ${env.OWASP_NVD_API_KEY}`
    - Well, Although I have utitlised API Keys, but I used old DP-Check version 6.5.1. so it is not required at all
    - Referrence: [DP-Check Plugin](https://www.jenkins.io/doc/pipeline/steps/dependency-check-jenkins-plugin/)

| `Jenkins Docs - Dependancy Check` |
|:---------------------------------:|
| <img width="952" alt="Image" src="https://github.com/user-attachments/assets/45c6fd34-7e8f-4c1c-9fe4-2307f9b7cac2" /> |

<h2 align="center">
  <b> ACKNOWLEDGEMENTS </b>
</h2>

- [Netflix-app-Nasrullah-CloudChamp](https://www.youtube.com/watch?v=g8X5AoqCJHc&t=4898s)
- [GitOps-Rajdeep](https://www.youtube.com/watch?v=o4QG_kqYvHk)
- [AWS-Official-Kubernetes-EKS](https://docs.aws.amazon.com/eks/latest/userguide/create-cluster.html)
