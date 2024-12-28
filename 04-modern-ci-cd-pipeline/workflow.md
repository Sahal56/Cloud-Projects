## **Workflow**

<details>
  <summary>
    <b> Testing App Locally </b>
  </summary>
  
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

  4. Checking in Browser at [localhost:8081](http:localhost:8081/)
     <img width="1107" alt="proj-ci-cd-pipeline-result-5-locally" src="https://github.com/user-attachments/assets/0b31a9b7-9e7d-4586-95c2-a93548887783" />

</details>



---
<details>
  <summary>
    <b>  1. First of All establishing GitHub App connection with AWS CodeConnection </b>
  </summary>
<img width="1057" alt="proj-ci-cd-2a-github-connection" src="https://github.com/user-attachments/assets/4e87f3f5-e2a7-4df5-9207-d948192a6055" />
<img width="1256" alt="proj-ci-cd-2b" src="https://github.com/user-attachments/assets/dfd8d75b-5f86-4879-add2-2af9ebac11e3" />
<img width="687" alt="proj-ci-cd-2c-authorize" src="https://github.com/user-attachments/assets/d292003c-7df0-450e-b6c1-cb5215b5900e" />
<img width="827" alt="proj-ci-cd-2d-connect-app" src="https://github.com/user-attachments/assets/6df7ee79-099f-4819-8499-7797e8f3b10b" />
<img width="488" alt="proj-ci-cd-2e-select-repo" src="https://github.com/user-attachments/assets/11de41fc-72f5-4248-a656-8c19037405c5" />
<img width="387" alt="proj-ci-cd-2f" src="https://github.com/user-attachments/assets/37e57904-8f5d-49d7-9306-3c8c832f3d3a" />
<img width="823" alt="proj-ci-cd-2g" src="https://github.com/user-attachments/assets/fb1fdea8-e7cb-4cab-ba17-1e9c936b04a2" />
<img width="974" alt="proj-ci-cd-2h-connected" src="https://github.com/user-attachments/assets/ac3ee8da-ab00-4720-9093-d7b327eb659f" />
</details>




---
<details>
  <summary>
    <b>  2. Lets build CodeBuild Project for Front End Unit Tests </b>
  </summary>
  <img width="897" alt="proj-ci-cd-pipeline-2-unit-tests-1" src="https://github.com/user-attachments/assets/f9947166-f786-45dc-88af-7761166fc0cc" />
  <img width="775" alt="proj-ci-cd-pipeline-2-unit-tests-2" src="https://github.com/user-attachments/assets/7251d56d-e7d3-45d3-8739-0901b4f22e77" />
  <img width="779" alt="proj-ci-cd-pipeline-2-unit-tests-3" src="https://github.com/user-attachments/assets/b9842a17-3563-4b62-a24b-250541707aaf" />
  <img width="705" alt="proj-ci-cd-pipeline-2-unit-tests-4" src="https://github.com/user-attachments/assets/0523022f-35e5-49f4-8582-733da1bbab7c" />
  <img width="697" alt="proj-ci-cd-pipeline-2-unit-tests-5" src="https://github.com/user-attachments/assets/1b38c46d-5abb-44f7-b6d9-b212c2458cf0" />
  <img width="706" alt="proj-ci-cd-pipeline-2-unit-tests-6" src="https://github.com/user-attachments/assets/c8b2f118-9c2e-4626-85f7-2e2867e0cefa" />
  <img width="561" alt="proj-ci-cd-pipeline-2-unit-tests-7" src="https://github.com/user-attachments/assets/f3474200-287b-4b35-b7cd-827c068c4c7f" />
  <img width="609" alt="proj-ci-cd-pipeline-2-unit-tests-8-created" src="https://github.com/user-attachments/assets/9ab72dbe-d97d-4541-908f-59ec5268fef5" />
</details>

---
<details>
  <summary>
    <b>  3. Now, we will build CodePipeline for Front End </b>
  </summary>
  <img width="1031" alt="proj-ci-cd-pipeline-3-fr-pipeline-1" src="https://github.com/user-attachments/assets/66e6f7af-481e-46ce-a121-e2a7a5fbf468" />
  <img width="961" alt="proj-ci-cd-pipeline-3-fr-pipeline-2" src="https://github.com/user-attachments/assets/539688af-254c-40b0-a43a-7060d1b79658" />
  <img width="717" alt="proj-ci-cd-pipeline-3-fr-pipeline-3" src="https://github.com/user-attachments/assets/18e6dea3-be5f-4e87-b40b-99b5f240ad07" />
  <img width="650" alt="proj-ci-cd-pipeline-3-fr-pipeline-4" src="https://github.com/user-attachments/assets/7d394c8d-73ef-476e-90e8-c574683f5186" />
  <img width="646" alt="proj-ci-cd-pipeline-3-fr-pipeline-5" src="https://github.com/user-attachments/assets/8994d87e-72b6-4d08-95b9-3dc8798f9dc6" />
  <img width="566" alt="proj-ci-cd-pipeline-3-fr-pipeline-6" src="https://github.com/user-attachments/assets/54159154-aa39-4daf-afad-2da7da14d226" />
  <img width="669" alt="proj-ci-cd-pipeline-3-fr-pipeline-7" src="https://github.com/user-attachments/assets/7b187b99-c501-4944-b504-9872b68a9245" />
  <img width="832" alt="proj-ci-cd-pipeline-3-fr-pipeline-8-review" src="https://github.com/user-attachments/assets/c6b71ce9-3235-4f8c-9c7e-ae1497722b7f" />
  <img width="737" alt="proj-ci-cd-pipeline-3-fr-pipeline-9" src="https://github.com/user-attachments/assets/0ddf4813-2bc6-4bc3-a7bc-c901dc18cbb1" />
  <img width="1134" alt="proj-ci-cd-pipeline-3-fr-pipeline-10" src="https://github.com/user-attachments/assets/fd260ca3-2dd6-4ea9-9875-56c678f60d67" />
  <img width="364" alt="proj-ci-cd-pipeline-3-fr-pipeline-11" src="https://github.com/user-attachments/assets/d2bb6c10-2f95-4993-9104-d3bad3789cd5" />
  <img width="516" alt="proj-ci-cd-pipeline-3-fr-pipeline-12a-reports" src="https://github.com/user-attachments/assets/ab5a1878-6b58-46a7-b729-8bd348d35401" />
  <img width="466" alt="proj-ci-cd-pipeline-3-fr-pipeline-12b" src="https://github.com/user-attachments/assets/fd988b03-7a58-4a9b-9670-ee07b8041e1c" />
  <img width="799" alt="proj-ci-cd-pipeline-3-fr-pipeline-12c" src="https://github.com/user-attachments/assets/5bb1deef-8bb3-42c0-b52a-b2e7a6b4bea0" />
  <img width="679" alt="proj-ci-cd-pipeline-3-fr-pipeline-12d" src="https://github.com/user-attachments/assets/d0bed9bd-5a4b-4e40-8f62-43a73f6fd166" />
  <img width="781" alt="proj-ci-cd-pipeline-3-fr-pipeline-12e" src="https://github.com/user-attachments/assets/e41aa7b3-0456-4637-b46e-1417c07c6dcb" />
  <img width="1041" alt="proj-ci-cd-pipeline-3-fr-pipeline-12f" src="https://github.com/user-attachments/assets/747a54e1-901c-45e0-97e7-6120b74d34cc" />
  <img width="1052" alt="proj-ci-cd-pipeline-3-fr-pipeline-12g" src="https://github.com/user-attachments/assets/ca934a18-f30a-42e8-8efd-35c85f364001" />
  <img width="697" alt="proj-ci-cd-pipeline-3-fr-pipeline-12h" src="https://github.com/user-attachments/assets/c8c7d4c7-2dd7-4eeb-84b7-7eb3829d2003" />
</details>

---
<details>
  <summary>
    <b>  4. Creating New CodeBuild Project : DockerBuild</b>
  </summary>

` Here, we will add Create CodeBuild Project for Front End, utilising build_spec file `
  
<img width="945" alt="proj-ci-cd-pipeline-4-docker-fr-1" src="https://github.com/user-attachments/assets/2261abe6-206e-4cd8-9c90-5c58618addaa" />
<img width="529" alt="proj-ci-cd-pipeline-4-docker-fr-2" src="https://github.com/user-attachments/assets/0928d357-e8b7-4567-873a-252776a0bbba" />
<img width="531" alt="proj-ci-cd-pipeline-4-docker-fr-3" src="https://github.com/user-attachments/assets/eb92987c-1502-444a-8e27-70c247dfc9ad" />
<img width="336" alt="proj-ci-cd-pipeline-4-docker-fr-4" src="https://github.com/user-attachments/assets/cab10484-1762-4bca-b7f0-b69d6c6cb4fa" />
<img width="518" alt="proj-ci-cd-pipeline-4-docker-fr-5" src="https://github.com/user-attachments/assets/ca42a10e-d5c8-4aeb-b045-7bd6d24e1896" />
<img width="530" alt="proj-ci-cd-pipeline-4-docker-fr-6" src="https://github.com/user-attachments/assets/ef8136f3-747b-445f-85b7-8031fde180c0" />
<img width="575" alt="proj-ci-cd-pipeline-4-docker-fr-7" src="https://github.com/user-attachments/assets/aec76541-3785-4d73-b72f-13ec8d23780c" />
<img width="810" alt="proj-ci-cd-pipeline-4-docker-fr-8" src="https://github.com/user-attachments/assets/1ee36cf1-50d1-4ed9-93ff-5006a19ea69e" />
</details>

---
details>
  <summary>
    <b>  5. Modifying Frontend Pipeline</b>
  </summary>

` Here we will modify Frontend pipeline by renaming & adding newly CodeBuild Project`

</details>





---
** END **
---
<!--



collapse section:
<details>
  <summary>
    <b> SS </b>
  </summary>
</details>

---
####
****
```sh
```
-->
