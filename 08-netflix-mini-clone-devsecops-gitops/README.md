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
