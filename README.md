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
| Monitoring	| Prometheus Grafana (or alternative)	| Track app and cluster health |
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

*Docker Compose: Instead of running long Docker commands every time, Docker Compose gives us a simple config file.Docker to run our image and expose it on port 80.
Show [docker-compose.yml]*


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

<img width="1366" height="641" alt="image" src="https://github.com/user-attachments/assets/84e412e7-501b-40e4-b3bb-44879c1abc2f" />

# Jenkins workflow
Jenkins Setup: Jenkins is our automation engine. Every time code is pushed to GitHub, Jenkins will:
1.	Pull the latest code
2.	Build the Docker image
3.	Push the image to DockerHub

   
# Branch rules:
-	Push to developer branch → image goes to developer repo.
-	Merge into main → image goes to production repo.


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


# Step - 13
Installing grafana for better visualization tool

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
