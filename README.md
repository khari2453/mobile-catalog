# mobile-catalog

 Mobile online shopping website is basically created in React library and lightweight to simplify the complex app .
 
 # Console final output
<img width="1366" height="1312" alt="image" src="https://github.com/user-attachments/assets/7b8bcb43-d75e-490b-bd8d-fc8c80ca84d9" />


# Prerequisite for the website to run
- Amazon Ec2 server
- Dockerhub
- Jenkins
- Prometheus and grafana
- Github

  # Source for the tools
  

| Category	| Tools/Services |	Purpose |
|----------|----------------|---------|
| Version Control	| Git , GitHub	| Store and manage source code; trigger pipeline via webhooks |
| Containerization	| Docker ,DockerHub |	Build container images, store them, and deploy |
| CI/CD	| Jenkins |	Automate build push, and deployment process |
| Monitoring	| Prometheus Grafana | Track app and cluster health |
| Cloud Provider	| AWS	| Host infrastructure (EC2, EKS, VPC, IAM) |



# Step - 1

<img width="30" height="30" src="https://img.icons8.com/ios-glyphs/30/github.png" alt="github"/>


We Clone the github for the source code and we created docker file to run the application locally , we’ll make it run on port 80 so anyone can open it in a browser without typing the port.

# Step -2 

<img width="48" height="48" src="https://img.icons8.com/fluency/48/docker.png" alt="docker"/>

**Dockerize the App**

**Commands**

 * `git clone https://github.com/sriram-R-krishnan/devops-build.git`
 * `cd devops-build/` 
 * `cd build/`
 * `vi Dockerfile`
 * `sudo yum install docker`
 * `sudo systemctl status docker`
 * `sudo systemctl start docker`
 * `sudo systemctl status docker`
 * `docker build -t mobile-catalog:latest .`
 * `docker images`
 * `docker run -itd -p 80:80 mobile-catalog`
 *  `docker ps`


<img width="1165" height="90" alt="image" src="https://github.com/user-attachments/assets/a16feae5-2de6-4f87-aebf-5be46f182d8f" />

# Step - 3

<img width="48" height="48" src="https://img.icons8.com/fluency/48/docker.png" alt="docker"/>

*Docker Compose: Instead of running long Docker commands every time, Docker Compose gives us a simple config file.Docker to run our image and expose it on port 80.*


# Step - 4

<img width="48" height="48" src="https://img.icons8.com/fluency/48/docker.png" alt="docker"/>

Createing public and private repo in DockerHub is like GitHub, but for images. 
*developer (public) → anyone can see/test our dev builds [harikumar1997/mobile-catalog-developer]*
*production (private) → only we control production builds [harikumar1997/mobile-catalog-production]*


<img width="1366" height="641" alt="image" src="https://github.com/user-attachments/assets/70acc6d2-f791-4d70-93c7-e3fb95e90928" />



# Step - 5
<img width="48" height="48" src="https://img.icons8.com/color/48/jenkins.png" alt="jenkins"/>

We created EC2 instance and installed jenkins to CICD process .

<img width="1366" height="641" alt="image" src="https://github.com/user-attachments/assets/a5d5e749-e7e9-40e5-8fa1-2659117738c7" />

# *Jenkins installation steps*

* `sudo amazon-linux-extras install java-openjdk11 -y`
* `sudo yum update –y`
* `sudo wget -O /etc/yum.repos.d/jenkins.repo \https://pkg.jenkins.io/redhat-stable/jenkins.repo`
* `sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key`
* `sudo yum upgrade -y`
* `sudo yum install java-21-amazon-corretto -y`
* `sudo yum install jenkins -y`
* `sudo systemctl enable jenkins`
* `sudo systemctl start jenkins`
* `sudo usermod -aG docker jenkins`
* `sudo systemctl restart jenkins`

**Credentials**

<img width="1366" height="641" alt="image" src="https://github.com/user-attachments/assets/27460bde-485e-40df-b598-ca28ab314cd3" />

**plugins**
- pipeline stage view
- Docker
- git


<img width="1366" height="641" alt="image" src="https://github.com/user-attachments/assets/84e412e7-501b-40e4-b3bb-44879c1abc2f" />



# Jenkins workflow
Jenkins Setup: Jenkins is our automation engine. Every time code is pushed to GitHub, Jenkins will:
1.	Pull the latest code
2.	Build the Docker image
3.	Push the image to DockerHub

   
# Branch rules:
-	Push to developer branch → image goes to developer repo.
-	Merge into main → image goes to production repo.
  
# Jenkins pipeline flow

*Useing build trigger option to auto trigger for jenkins from github*

<img width="1366" height="2034" alt="image" src="https://github.com/user-attachments/assets/ebb41678-c623-4f14-bf26-66df2567d038" />


# Output

<img width="1366" height="641" alt="image" src="https://github.com/user-attachments/assets/30a1ffa5-cf6d-4ca4-9fa6-b39b445a38bb" />


# Step - 6

<img width="30" height="30" src="https://img.icons8.com/ios-glyphs/30/github.png" alt="github"/>

**Git commands**

- git checkout developer
- git add .
- git commit -m "updated files"
- git push origin developer
- git checkout main
- git pull origin main
- git merge developer
- git push origin main

  
**NOTE: Developer branch merge to main branch jenkins pipeline is automatically trigger and push to the docker private repo .**

<img width="1366" height="641" alt="image" src="https://github.com/user-attachments/assets/51c6317e-5344-443b-8e8b-a6c7749f97a5" />



**Github intergrated with jenkins via webhooks**


<img width="1366" height="641" alt="image" src="https://github.com/user-attachments/assets/8977ff25-f770-483f-9b7b-0a5d443da9e6" />


# Step - 7

# Output

Docker hub private repo clone to the ec2 instance and runs on the browser.

Createing EC2 instance for deploy the application

<img width="1366" height="641" alt="image" src="https://github.com/user-attachments/assets/876f53b1-1522-424c-8d21-b4400df2a4c5" />


**Installed docker on the EC2 instance**

**Commands**
 - docker login
 - docker images
 - docker run -d -p 80:80 harikumar1997/mobile-catalog-production:latest
 - docker ps

**Browser Output**

<img width="1362" height="691" alt="image" src="https://github.com/user-attachments/assets/c82e02fb-13e9-4460-8e23-8bc416b9e881" />


# Step - 8

<img width="48" height="48" src="https://img.icons8.com/color/48/prometheus-app.png" alt="prometheus-app"/>

Created EC2 instance and installed Monitoring tools Prometheus and grafana

<img width="1366" height="641" alt="image" src="https://github.com/user-attachments/assets/99223b0e-4e40-4565-b31c-6dd21b6e96ed" />

**Commands**
- https://github.com/prometheus/prometheus/releases/download/v3.7.0/prometheus-3.7.0.linux-amd64.tar.gz
- tar -xvzf prometheus-3.7.0.linux-amd64.tar.gz

`We need to change the prometheus.yml file to add node exporter public ip`

<img width="846" height="451" alt="image" src="https://github.com/user-attachments/assets/1efe3f9b-a21a-4c07-bf35-90d4de24fba7" />

- ./prometheus --config.file=prometheus.yml

**Prometheus runs on port no 9090**

<img width="1366" height="1509" alt="image" src="https://github.com/user-attachments/assets/c6345028-a83e-413b-9dba-786cbf57e74b" />

`We installed node exporter where the application is running on the EC2 instance`

**Commands**

- https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz
- sudo tar -xvzf node_exporter-1.9.1.linux-amd64.tar.gz
- cd node_exporter-1.9.1.linux-amd64/
- ./node_exporter $

**Node exporter runs on port no 9100**

<img width="1148" height="577" alt="image" src="https://github.com/user-attachments/assets/9c942ca4-6072-4b45-a117-b9f468f9b503" />

**Installing alert manager in application running EC2 instance and configured in prometheus monitoring instance**

**Commands**

- wget https://github.com/prometheus/alertmanager/releases/download/v0.28.1/alertmanager-0.28.1.linux-amd64.tar.gz
- sudo tar -xvzf alertmanager-0.28.1.linux-amd64.tar.gz
- cd alertmanager-0.28.1.linux-amd64/

**Alert Manager runs on port no 9093**

<img width="1356" height="540" alt="image" src="https://github.com/user-attachments/assets/75c21ec6-79fd-4811-8e81-17769bf97121" />

**Prometheus Console in Alert manager configration setup**

<img width="1357" height="306" alt="image" src="https://github.com/user-attachments/assets/ee419a81-32d1-4611-9525-ebb6824699ed" />


# Step - 9


Installing grafana for better visualization tool

**Commands**
  - wget https://dl.grafana.com/grafana/release/12.2.0/grafana_12.2.0_17949786146_linux_amd64.tar.gz
  - tar -zxvf grafana_12.2.0_17949786146_linux_amd64.tar.gz~
  - cd grafana-12.2.0/
  - cd bin
  - ./grafana-server &
  
  `Grafana runs on the port no 3000` we need to open the port no 3000 on the server .

    <img width="1366" height="641" alt="image" src="https://github.com/user-attachments/assets/f6084750-c888-4fc2-9de6-b86140aea47e" />

# step - 14 
Git commands
git add .
git commit -m "final commit "
git push origin main

 **End-to-End Flow Recap:** `First, the developer pushes the static app to GitHub. GitHub triggers Jenkins automatically. Jenkins builds the Docker image, pushes it to DockerHub, and deploys it to Kubernetes on AWS EKS. The LoadBalancer exposes the app to the internet so users can access it, and monitoring ensures the app stays healthy. The whole process is automated, consistent, and production-ready. That’s the power of CI/CD, containerization, and Kubernetes working together .`


<img width="1366" height="1312" alt="image" src="https://github.com/user-attachments/assets/f7f1de9c-eab7-4392-a828-368e69328119" />
