# **Workflow**

#### **NOTE**
>  As, I did Self placed workshop, few IAM Role were not provision, have added required polcies to that roles respectively.

> So, I had to do troubleshooting and fix the errors.

> Additionally, some commands and script were not proper. which I fixed, promoting automation.

## **Testing App Locally**
<details>
  <summary>
    <b> Expand </b>
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
## **1. First of All establishing GitHub App connection with AWS CodeConnection**
<details>
  <summary>
    <b> Expand </b>
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
## **2. Lets build CodeBuild Project for Front End Unit Tests**
<details>
  <summary>
    <b> Expand </b>
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
## **3. Now, we will build CodePipeline for Front End**
<details>
  <summary>
    <b> Expand </b>
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
## **4. Creating New CodeBuild Project : DockerBuild**
<details>
  <summary>
    <b> Expand </b>
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
## **5. Modifying Frontend Pipeline**
<details>
  <summary>
    <b> Expand </b>
  </summary>

` Here we will modify Frontend pipeline by renaming & adding newly CodeBuild Project`

<img width="1116" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-1a" src="https://github.com/user-attachments/assets/7f7ebfa3-9dc5-4310-976a-6ab4e48d5fc1" />
<img width="1037" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-1b" src="https://github.com/user-attachments/assets/1974a487-c9e3-4ee9-ba92-7f1b0e1eab34" />
<img width="716" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-1c" src="https://github.com/user-attachments/assets/a84c32de-2dee-4861-9410-14ad11f9bf15" />
<img width="128" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-1d" src="https://github.com/user-attachments/assets/3ae0015d-b4c6-4001-93e8-8236ac3b56ad" />
<img width="1008" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-1e" src="https://github.com/user-attachments/assets/35096fc2-f658-4906-9b0d-035c991fa85e" />
<img width="933" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-1f" src="https://github.com/user-attachments/assets/06a3434f-d2dc-40d6-8c71-0f0bb52d15d2" />
<img width="1209" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-1g" src="https://github.com/user-attachments/assets/85abeb8d-a446-4820-9a72-aad5d2893671" />
<img width="1011" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-1h" src="https://github.com/user-attachments/assets/50b4e9c9-8a04-44cc-8e69-f77ba343bf67" />
<img width="516" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-1i" src="https://github.com/user-attachments/assets/28b330b0-111a-4094-b906-0dfced47cf54" />
<img width="1056" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-1j" src="https://github.com/user-attachments/assets/ecd56b53-3331-4ffd-8e0c-379a19d13dc2" />
<img width="523" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-1k" src="https://github.com/user-attachments/assets/7139f563-a996-45bb-83f3-8e4d50d14ffb" />
<img width="616" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-1l" src="https://github.com/user-attachments/assets/000f4074-efdd-44fc-80a1-1301523ca85e" />
<img width="537" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-1m" src="https://github.com/user-attachments/assets/e5a368c4-bcac-4ad0-be25-aedcc568f63a" />
<img width="527" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-1n" src="https://github.com/user-attachments/assets/a42724fe-f5d5-4026-94ee-8869523f4ec1" />

- As you can see above Pipeline is changed & saved successfully.
- UnitTests works good

- But we have some issues in running DockerBuild Project.
    - I had to do troubleshooting, as in the workshop they haven't mentioned the Policy/Permissions is required for IAM Service Role
    - Manually, I had to add policy, in Role. Which Permission is lacking can be found using log files.
    - All Screenshot attached below

<img width="1250" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-2a" src="https://github.com/user-attachments/assets/88b7b8d2-c044-4757-a33a-850b807eec74" />
<img width="1003" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-2b" src="https://github.com/user-attachments/assets/7ae756b1-be04-45ec-a7f5-7df195b40cd2" />
<img width="991" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-2c" src="https://github.com/user-attachments/assets/e20581cd-5f45-439c-8551-478df3f92533" />
<img width="352" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-2d" src="https://github.com/user-attachments/assets/7c6491ad-1771-4edf-8ab2-0169fa415b17" />
<img width="593" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-2e" src="https://github.com/user-attachments/assets/6455e4a6-94a1-4478-b4f7-e8494e3dcb90" />
<img width="657" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-2f" src="https://github.com/user-attachments/assets/97c4ead2-feb0-484a-a752-844b5fca0f8b" />

- But Again, we got issue that ECR repo is not available.
- This is due to author has created repo manually.
- So, I have to edit buildspec_docker file, Line:22 in phase > pre_build > commands:

<b><ins>buildspec_docker.yml</ins></b>
```sh
# extra step for creating repo in ECR added by github.com/sahal56
# Run only once, comment it out after 1st run
# - echo "Creating repository in AWS ECR"
# - aws ecr create-repository --repository-name $repository_name --region $AWS_REGION
```

<img width="1224" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-3a" src="https://github.com/user-attachments/assets/74851e27-8b36-47c4-a53e-f589616fee8d" />
<img width="409" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-3b" src="https://github.com/user-attachments/assets/32e0ff12-5738-4502-92e6-86a457efe54e" />
<img width="641" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-3c" src="https://github.com/user-attachments/assets/fe16f291-e27f-4579-a5e2-308245147eaa" />
<img width="579" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-3d" src="https://github.com/user-attachments/assets/a7ce8a7b-30ad-47a1-abf6-9616a66ad4a5" />
<img width="359" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-3e" src="https://github.com/user-attachments/assets/ab9ea71b-2b8b-4a5f-af04-b50ab43dcf6d" />
<img width="1148" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-3f" src="https://github.com/user-attachments/assets/b0da4cc8-f5cb-4bfe-9a99-b3dc73c27950" />
<img width="1308" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-3g" src="https://github.com/user-attachments/assets/8001121b-5f76-467f-b5d0-131365a771b0" />
<img width="1089" alt="proj-ci-cd-pipeline-4-mod-fr-pipeline-3h" src="https://github.com/user-attachments/assets/8227a57f-6000-4cd4-baa4-3a5592553a5e" />


- As you can see above, now ECR Private repo is created.
- Our Modified Frontend pipeline executes successfully.

</details>


---
## **6. Backend CodeBuild Project**
<details>
  <summary>
    <b> Expand </b>
  </summary>

<img width="826" alt="proj-ci-cd-pipeline-6-bk-build-1" src="https://github.com/user-attachments/assets/ac585cf5-2f4f-477a-9c1a-143ee76bffe0" />
<img width="515" alt="proj-ci-cd-pipeline-6-bk-build-2" src="https://github.com/user-attachments/assets/9e2daf1f-a655-4ef5-a750-66e35503de38" />
<img width="521" alt="proj-ci-cd-pipeline-6-bk-build-3" src="https://github.com/user-attachments/assets/025582ce-4b32-47ec-bdd7-f7b3f711e78d" />
<img width="399" alt="proj-ci-cd-pipeline-6-bk-build-4" src="https://github.com/user-attachments/assets/53100c8a-3757-43fc-9ee3-9332ffae6a9f" />
<img width="588" alt="proj-ci-cd-pipeline-6-bk-build-5" src="https://github.com/user-attachments/assets/472363d7-dacc-4659-81e8-642ec79dd7dd" />
<img width="514" alt="proj-ci-cd-pipeline-6-bk-build-6" src="https://github.com/user-attachments/assets/e124728a-5004-47d4-9148-9a0cd177d07d" />
<img width="552" alt="proj-ci-cd-pipeline-6-bk-build-7" src="https://github.com/user-attachments/assets/02b465ee-b3cd-49cc-80e6-c1192a8da765" />

</details>

---
## **7. Building Backend Pipeline**
<details>
  <summary>
    <b> Expand </b>
  </summary>

<img width="799" alt="proj-ci-cd-pipeline-7-bk-pipeline-1" src="https://github.com/user-attachments/assets/d574a4b2-f37d-4454-9883-15fa6086df25" />
<img width="568" alt="proj-ci-cd-pipeline-7-bk-pipeline-2" src="https://github.com/user-attachments/assets/b0da094b-1885-45f4-852b-d52902ee82c5" />
<img width="416" alt="proj-ci-cd-pipeline-7-bk-pipeline-3" src="https://github.com/user-attachments/assets/db3ea2e0-f56e-4f51-ba95-75c3c92eec47" />
<img width="415" alt="proj-ci-cd-pipeline-7-bk-pipeline-4" src="https://github.com/user-attachments/assets/bf6634ac-d650-4871-8142-ecfae7efd315" />
<img width="551" alt="proj-ci-cd-pipeline-7-bk-pipeline-5" src="https://github.com/user-attachments/assets/b2ccbeb9-a758-417c-b0c1-c521676d3ffd" />
<img width="303" alt="proj-ci-cd-pipeline-7-bk-pipeline-6" src="https://github.com/user-attachments/assets/e2d62c9f-d928-450e-8687-f18067caa39b" />
<img width="555" alt="proj-ci-cd-pipeline-7-bk-pipeline-7" src="https://github.com/user-attachments/assets/7fe0b773-c6c2-4805-81af-412e191b12d6" />
<img width="364" alt="proj-ci-cd-pipeline-7-bk-pipeline-8" src="https://github.com/user-attachments/assets/c767b7fc-85d7-493b-9451-17a825887757" />
<img width="653" alt="proj-ci-cd-pipeline-7-bk-pipeline-9" src="https://github.com/user-attachments/assets/dc3236eb-92ff-4761-af66-b44595671007" />

- But wait, Build is getting failed !!! ᶠᶸᶜᵏᵧₒᵤ! AWS Worksoppp.
- Same again, IAM Role policy issues.

<img width="295" alt="proj-ci-cd-pipeline-7-bk-pipeline-10a" src="https://github.com/user-attachments/assets/1029ceaf-937d-4ef9-bcaf-f44fc35c9832" />
<img width="1253" alt="proj-ci-cd-pipeline-7-bk-pipeline-10b" src="https://github.com/user-attachments/assets/ad8fa204-9608-428a-97ce-6a5a04c69663" />
<img width="969" alt="proj-ci-cd-pipeline-7-bk-pipeline-10c" src="https://github.com/user-attachments/assets/653dbd4b-d8a7-4229-9d8d-83be846c58a3" />
<img width="501" alt="proj-ci-cd-pipeline-7-bk-pipeline-10d" src="https://github.com/user-attachments/assets/2c47f2ac-1726-4d1b-ac25-7602eddc6cf1" />
<img width="403" alt="proj-ci-cd-pipeline-7-bk-pipeline-10e" src="https://github.com/user-attachments/assets/4eff7a94-c258-4ad3-93f8-730d10a89873" />
<img width="430" alt="proj-ci-cd-pipeline-7-bk-pipeline-10f" src="https://github.com/user-attachments/assets/01f6a35c-11f3-4dac-a55c-781da9de2305" />
<img width="424" alt="proj-ci-cd-pipeline-7-bk-pipeline-10g" src="https://github.com/user-attachments/assets/113540c6-ea35-4783-9f6a-faeab330ace3" />
<img width="343" alt="proj-ci-cd-pipeline-7-bk-pipeline-10h" src="https://github.com/user-attachments/assets/0bae9798-3f54-4b65-8630-7a975cbaf83d" />

- Finally, fixed

<img width="1355" alt="proj-ci-cd-pipeline-7-bk-pipeline-11a-cf-stack" src="https://github.com/user-attachments/assets/426b0b79-d0b3-4593-86b9-d587e18cce10" />
<img width="1129" alt="proj-ci-cd-pipeline-7-bk-pipeline-11b-cf-stack-events" src="https://github.com/user-attachments/assets/bb0fc0ab-0241-4db2-8a4c-f5a90cf03bf4" />
<img width="745" alt="proj-ci-cd-pipeline-7-bk-pipeline-11c-cf-stack-resources" src="https://github.com/user-attachments/assets/3c6e5e4c-83b3-4312-bbe5-86f5f53e267b" />
<img width="720" alt="proj-ci-cd-pipeline-7-bk-pipeline-11d-dynamodb" src="https://github.com/user-attachments/assets/7f1930ec-3d55-40be-9834-bf96fa19d528" />
<img width="1376" alt="proj-ci-cd-pipeline-7-bk-pipeline-11e" src="https://github.com/user-attachments/assets/abc0bb11-fba4-4e4e-b24b-ab7153ea8279" />

</details>

---
## **8. Utilizing Filters in both Frontend & Backend Pipelines**
<details>
  <summary>
    <b> Expand </b>
  </summary>

- Below is Backend Pipeline
- We are filtering : include backend.yml on main branch
- Meaning whenever any dev changes & commit to backend file, only then Backend Pipeline for backend will trigger into execution
<img width="1103" alt="proj-ci-cd-pipeline-8-filter-bk-pipeline-1" src="https://github.com/user-attachments/assets/9de7bf88-d66a-497a-ad59-3bba237c47b8" />
<img width="180" alt="proj-ci-cd-pipeline-8-filter-bk-pipeline-2" src="https://github.com/user-attachments/assets/506c9aa5-cecd-4ab6-b71d-e33db159d024" />
<img width="236" alt="proj-ci-cd-pipeline-8-filter-bk-pipeline-3" src="https://github.com/user-attachments/assets/e8f1c61b-893e-4097-974f-eef830a20113" />
<img width="955" alt="proj-ci-cd-pipeline-8-filter-bk-pipeline-4" src="https://github.com/user-attachments/assets/ba87ea67-105a-4284-8f02-dbbe9e76402a" />

- Below is Frontend Pipeline
- Here we have excluded backend.yml, to restrict Frontend Pipeline getting executed when changes to backend.yml is made.
<img width="1113" alt="proj-ci-cd-pipeline-8-filter-fr-pipeline-1" src="https://github.com/user-attachments/assets/dcb767f9-b5a7-4c80-b10f-5b2670d1d3d8" />
<img width="1240" alt="proj-ci-cd-pipeline-8-filter-fr-pipeline-2" src="https://github.com/user-attachments/assets/0ba4042d-9e12-4f68-8aad-8e456c86633c" />
<img width="466" alt="proj-ci-cd-pipeline-8-filter-fr-pipeline-3" src="https://github.com/user-attachments/assets/21e1e25f-8903-4a06-ab0a-d7fbb98f28e8" />
<img width="433" alt="proj-ci-cd-pipeline-8-filter-fr-pipeline-4" src="https://github.com/user-attachments/assets/b6715180-7e8c-4de7-8b59-9bb1d022e679" />

</details>

---
## **9. Troubleshooting - AppRuner, SSM**
<details>
  <summary>
    <b> Expand </b>
  </summary>

- Once Again some required permissions issue.!!!

<img width="1003" alt="proj-ci-cd-pipeline-9-troubleshoot-1" src="https://github.com/user-attachments/assets/6a12406f-da1d-4e09-b535-7d7d2a330d86" />
<img width="692" alt="proj-ci-cd-pipeline-9-troubleshoot-2" src="https://github.com/user-attachments/assets/69ce146d-4d45-47b5-8e94-aac9ee3c79ae" />
<img width="542" alt="proj-ci-cd-pipeline-9-troubleshoot-3" src="https://github.com/user-attachments/assets/5ff889ae-7e12-49d3-940a-b45f9954acd0" />
<img width="401" alt="proj-ci-cd-pipeline-9-troubleshoot-4" src="https://github.com/user-attachments/assets/01ca9be8-4128-4923-b141-83d574ad6902" />
<img width="454" alt="proj-ci-cd-pipeline-9-troubleshoot-5" src="https://github.com/user-attachments/assets/a46f5e18-a9ca-4e57-86c9-5ccf91841991" />
<img width="802" alt="proj-ci-cd-pipeline-9-troubleshoot-6" src="https://github.com/user-attachments/assets/e0bf3896-b332-49b5-81c0-b9c2058bc29f" />
<img width="649" alt="proj-ci-cd-pipeline-9-troubleshoot-7" src="https://github.com/user-attachments/assets/5e662fd8-821c-4f4d-b15b-0218134ebbd3" />

- Yayyyy. Hurrah Pipeline Works
<img width="337" alt="proj-ci-cd-pipeline-9-troubleshoot-8" src="https://github.com/user-attachments/assets/feeb60f6-0191-49ce-8914-7c5225bddec2" />
<img width="551" alt="proj-ci-cd-pipeline-9-troubleshoot-9" src="https://github.com/user-attachments/assets/06e52a8f-5e7e-4ea6-94e7-e6717f90a228" />

- Lets check out URL of App Runer to see our app running on 💯 Cloud 💫
<img width="723" alt="proj-ci-cd-pipeline-9-troubleshoot-10" src="https://github.com/user-attachments/assets/3a98ca3a-0a7c-48a5-b657-190116b09bd2" />

</details>

---
## **10. Adding Deploy Stage in Frontend Pipeline**
<details>
  <summary>
    <b> Expand </b>
  </summary>

`Here will add Deploy Stage in Frontend Pipeline to deploy on AWS App Runer`

<img width="1148" alt="proj-ci-cd-pipeline-10-fr-deploy-1" src="https://github.com/user-attachments/assets/13937b3c-addc-4d8a-9de9-a16bc0c2d8bd" />
<img width="1141" alt="proj-ci-cd-pipeline-10-fr-deploy-2" src="https://github.com/user-attachments/assets/7e494bbd-990b-4f10-8f69-1462a258eb08" />
<img width="396" alt="proj-ci-cd-pipeline-10-fr-deploy-3" src="https://github.com/user-attachments/assets/3137e779-048a-4084-b00b-96a052529f94" />
<img width="1139" alt="proj-ci-cd-pipeline-10-fr-deploy-4" src="https://github.com/user-attachments/assets/ecdf5248-64ca-416b-b65a-cbea58fc37cf" />
<img width="292" alt="proj-ci-cd-pipeline-10-fr-deploy-5" src="https://github.com/user-attachments/assets/8bd4729b-3e01-4466-9bf0-9cd1deb0f3dc" />
<img width="456" alt="proj-ci-cd-pipeline-10-fr-deploy-6" src="https://github.com/user-attachments/assets/92f9caaa-0621-46cd-bfcf-f2c64f6a5f07" />
<img width="462" alt="proj-ci-cd-pipeline-10-fr-deploy-7" src="https://github.com/user-attachments/assets/3be2a627-3aa9-4779-9b77-91bd8496509d" />
<img width="851" alt="proj-ci-cd-pipeline-10-fr-deploy-8" src="https://github.com/user-attachments/assets/b33d45e9-50c9-4a81-8cc1-2bdb82d74dc6" />
<img width="683" alt="proj-ci-cd-pipeline-10-fr-deploy-9" src="https://github.com/user-attachments/assets/982c9b3f-6e77-4402-baa9-6e97bf50787d" />
<img width="355" alt="proj-ci-cd-pipeline-10-fr-deploy-10" src="https://github.com/user-attachments/assets/08884cd7-d752-41bd-8dea-812d6c1e3a0d" />
<img width="389" alt="proj-ci-cd-pipeline-10-fr-deploy-11" src="https://github.com/user-attachments/assets/d7db9a7f-7214-4df4-93d5-a4b410e06253" />

</details>

---
## **11. Applying filters on Branches : main, feature/****
<details>
  <summary>
    <b> Expand </b>
  </summary>

<img width="801" alt="proj-ci-cd-pipeline-11-filters-branch-1" src="https://github.com/user-attachments/assets/a016f3be-27c0-44a2-acbe-60082c80f7db" />
<img width="1044" alt="proj-ci-cd-pipeline-11-filters-branch-2" src="https://github.com/user-attachments/assets/de8de19a-5bb2-4cee-9ee6-f5733306de05" />
<img width="221" alt="proj-ci-cd-pipeline-11-filters-branch-3" src="https://github.com/user-attachments/assets/c3fe5b9d-6d9f-454f-8b50-ad6a478741a3" />
<img width="452" alt="proj-ci-cd-pipeline-11-filters-branch-4" src="https://github.com/user-attachments/assets/ab1de2f2-a616-498f-bc94-74fe5c72fd54" />
<img width="372" alt="proj-ci-cd-pipeline-11-filters-branch-5" src="https://github.com/user-attachments/assets/4cb906c5-6657-4e7c-9a08-6002b43971ec" />

- Lets change file and push in branch : `feature/**`
- then pushing it: `git push` and creating `PR request`
- and finally accecpting `Merge PR`
<img width="801" alt="proj-ci-cd-pipeline-11-filters-branch-6" src="https://github.com/user-attachments/assets/cd9948ce-ea4e-4279-b163-179ce04c855e" />
<img width="1323" alt="proj-ci-cd-pipeline-11-filters-branch-7" src="https://github.com/user-attachments/assets/af20b497-ae00-4c59-978b-cf1fe2dd5ae1" />
<img width="929" alt="proj-ci-cd-pipeline-11-filters-branch-8" src="https://github.com/user-attachments/assets/1e68dade-9726-4cd1-be2e-345a05baf20b" />
<img width="838" alt="proj-ci-cd-pipeline-11-filters-branch-9" src="https://github.com/user-attachments/assets/00adbc8f-e834-45b6-8d26-cedfdaa5cb11" />
<img width="564" alt="proj-ci-cd-pipeline-11-filters-branch-10" src="https://github.com/user-attachments/assets/8ee0ad7e-a639-4bed-a3d3-8316a4ef2716" />
<img width="822" alt="proj-ci-cd-pipeline-11-filters-branch-11" src="https://github.com/user-attachments/assets/41057ca0-0392-4bf9-a9e0-0a95a6711e0c" />

- Lets test our App
<img width="1008" alt="proj-ci-cd-pipeline-11-filters-branch-12a" src="https://github.com/user-attachments/assets/a85db637-6f46-43a2-968d-7419d07ed252" />
<img width="549" alt="proj-ci-cd-pipeline-11-filters-branch-12b" src="https://github.com/user-attachments/assets/37ee227d-60ad-4178-8b9e-6152389e4553" />
<img width="220" alt="proj-ci-cd-pipeline-11-filters-branch-12c" src="https://github.com/user-attachments/assets/56ad9e33-723a-488e-9fbb-b61284cc2939" />

- It works.!!!

</details>

---
## **12. Final Results/Working of our Hotel App**
<details>
  <summary>
    <b> Expand </b>
  </summary>

`Below are some resources which are created using CloudFormation, when CodePipline is executed`

- Testing Hotel App, hosted on App Runner
<img width="1112" alt="proj-ci-cd-pipeline-12-result-1a" src="https://github.com/user-attachments/assets/6e36f0c2-e11f-42f2-9f1e-b96e7a3d25f9" />
<img width="1112" alt="proj-ci-cd-pipeline-12-result-1b" src="https://github.com/user-attachments/assets/9c5b684f-9b86-47ba-b826-52fd9c83e62e" />
<img width="322" alt="proj-ci-cd-pipeline-12-result-1c" src="https://github.com/user-attachments/assets/406b8fd2-628d-4a41-bd6c-331dd08a69fe" />
<img width="368" alt="proj-ci-cd-pipeline-12-result-1d" src="https://github.com/user-attachments/assets/2253ed3d-ec86-4ec8-8c83-c33da5890cab" />

- This is my Private ECR repo
<img width="1423" alt="proj-ci-cd-pipeline-12-result-2a-ecr" src="https://github.com/user-attachments/assets/c1d49b20-7d80-4b63-8cd8-f3822bd92fd2" />

- DynamoDB Tables
<img width="1427" alt="proj-ci-cd-pipeline-12-result-3a-dynamoDB-tables" src="https://github.com/user-attachments/assets/b2627096-bc41-41a9-8c4c-315fe1220a31" />
<img width="1099" alt="proj-ci-cd-pipeline-12-result-3b" src="https://github.com/user-attachments/assets/81db9e62-ed8d-456b-8a3d-ad1292b7663f" />

- CloudFormation Stacks
<img width="1411" alt="proj-ci-cd-pipeline-12-result-4a-CF-stacks" src="https://github.com/user-attachments/assets/d7bbe7f0-3577-4f6d-8a2f-adfbbcb6fe1d" />
<img width="1428" alt="proj-ci-cd-pipeline-12-result-4b" src="https://github.com/user-attachments/assets/2f45c03c-2b24-41f1-a48d-85e1e8dd6ed3" />
<img width="874" alt="proj-ci-cd-pipeline-12-result-4c" src="https://github.com/user-attachments/assets/a76f1960-5e0b-4b45-b1d1-b41bb266b044" />

- CodeBuild Projects
<img width="1426" alt="proj-ci-cd-pipeline-12-result-5-CodeBuild" src="https://github.com/user-attachments/assets/175af154-975c-4a51-b96e-8edb7fca9d01" />

- CodePipelines
<img width="1421" alt="proj-ci-cd-pipeline-12-result-6-CodePipeline" src="https://github.com/user-attachments/assets/027cbf19-c5f0-450d-a0bc-14d53307219c" />

</details>

---
## **13. Clean Up**
<details>
  <summary>
    <b> Expand </b>
  </summary>

`Here, is SS all resources of this project, will destroy them`

<img width="516" alt="proj-ci-cd-pipeline-13-cleanup-1a-cdppline" src="https://github.com/user-attachments/assets/43ffb7c2-2ced-4a49-b642-30be3aaad19e" />
<img width="1132" alt="proj-ci-cd-pipeline-13-cleanup-1b" src="https://github.com/user-attachments/assets/90bace2f-7aca-45a3-9a05-2b77f96069f6" />
<img width="516" alt="proj-ci-cd-pipeline-13-cleanup-2a-cf" src="https://github.com/user-attachments/assets/d7f3252e-9aab-4051-a1b6-fac8c58cb2a7" />
<img width="1190" alt="proj-ci-cd-pipeline-13-cleanup-2b" src="https://github.com/user-attachments/assets/8c2df473-7a04-47cb-896b-66c417b0a95a" />
<img width="1165" alt="proj-ci-cd-pipeline-13-cleanup-3a-iam-roles" src="https://github.com/user-attachments/assets/e45279fa-00db-44d9-8903-e0c7a6d4ce1e" />
<img width="511" alt="proj-ci-cd-pipeline-13-cleanup-3b" src="https://github.com/user-attachments/assets/15dee772-0bba-4b4a-9c07-84c9e00f7f8d" />
<img width="1425" alt="proj-ci-cd-pipeline-13-cleanup-4a-s3" src="https://github.com/user-attachments/assets/3757ef6e-4d64-4f36-a0ed-abe986d71f08" />
<img width="410" alt="proj-ci-cd-pipeline-13-cleanup-4b" src="https://github.com/user-attachments/assets/03014fc1-925a-4fb4-af5a-8a40c1436026" />
<img width="348" alt="proj-ci-cd-pipeline-13-cleanup-4c" src="https://github.com/user-attachments/assets/e3d42db1-0a87-4f05-a8b9-aad2cd18fe68" />
<img width="1044" alt="proj-ci-cd-pipeline-13-cleanup-4d" src="https://github.com/user-attachments/assets/a02c8bcd-2a10-4416-80eb-95f296810409" />
<img width="328" alt="proj-ci-cd-pipeline-13-cleanup-4e" src="https://github.com/user-attachments/assets/889378d5-2e48-4cfb-b69b-938e5a4412ee" />
<img width="1037" alt="proj-ci-cd-pipeline-13-cleanup-4f" src="https://github.com/user-attachments/assets/f5c48da3-f543-4c1b-9d9c-8ae77082446f" />
<img width="1052" alt="proj-ci-cd-pipeline-13-cleanup-4g" src="https://github.com/user-attachments/assets/2e9cf68b-13f4-4911-af7c-2a1fb8cfe5fe" />
<img width="1410" alt="proj-ci-cd-pipeline-13-cleanup-4h" src="https://github.com/user-attachments/assets/8152636f-0d30-4d42-ab4c-5e1ff99c844c" />
<img width="1434" alt="proj-ci-cd-pipeline-13-cleanup-5-cw-log-groups" src="https://github.com/user-attachments/assets/832fc094-d80f-4e6f-a1e1-3cfba0b4c7d5" />
<img width="1430" alt="proj-ci-cd-pipeline-13-cleanup-6-ecr-private-repo" src="https://github.com/user-attachments/assets/3cac4648-ce71-4849-8b45-410e8e9574cd" />

</details>

---
**END**
---

<!--
---
## ****
<details>
  <summary>
    <b> Expand </b>
  </summary>
</details>
-->
