#📦 Day 29 – Introduction to Docker
🎯 Goal

Understand Docker fundamentals and run your first containers.

##🧠 Task 1: What is Docker?
🔹 What is a Container?

A container is a lightweight, standalone, executable package that includes:

Application code

Runtime

Libraries

Dependencies

✅ Why do we need containers?

Eliminates "it works on my machine" issues

Faster deployment

Lightweight compared to VMs

Consistent environments across Dev, Test, Production

🔹 Containers vs Virtual Machines
Feature	Containers 🐳	Virtual Machines 🖥️
Size	Lightweight (MBs)	Heavy (GBs)
Boot Time	Seconds	Minutes
OS Requirement	Shares host OS	Full OS required
Performance	High	Moderate
Isolation	Process-level	Full system isolation

👉 Conclusion: Containers are faster and more efficient than VMs.

🔹 Docker Architecture

Docker follows a client-server architecture.

Components:

Docker Client

CLI tool (docker)

Sends commands to Docker daemon

Docker Daemon (dockerd)

Core engine

Manages containers, images, networks

Docker Images

Read-only templates

Used to create containers

Docker Containers

Running instances of images

Docker Registry (Docker Hub)

Stores images

Public/private repositories

🏗️ Architecture Diagram (Textual)
[ Docker Client ]
        |
        v
[ Docker Daemon ]
   |      |      |
Images Containers Networks
        |
        v
[ Docker Hub / Registry ]

👉 Flow:

Client sends command

Daemon processes it

Pulls image from Docker Hub (if not local)

Runs container

##⚙️ Task 2: Install Docker
🔹 Step 1: Install Docker (Ubuntu)
sudo apt update
sudo apt install docker.io -y
🔹 Step 2: Start & Enable Docker
sudo systemctl start docker
sudo systemctl enable docker
🔹 Step 3: Verify Installation
docker --version
🔹 Step 4: Run Hello World Container
sudo docker run hello-world
📌 What happens?

Docker pulls image from Docker Hub

Creates container

Runs it

Displays confirmation message

##🚀 Task 3: Run Real Containers
🔹 Run Nginx Container
sudo docker run -d -p 8080:80 nginx

👉 Open browser:

http://localhost:8080
🔹 Run Ubuntu Container (Interactive Mode)
sudo docker run -it ubuntu bash

👉 Explore:

ls
pwd
apt update

👉 Exit:

exit
🔹 List Running Containers
docker ps
🔹 List All Containers
docker ps -a
🔹 Stop a Container
docker stop <container_id>
🔹 Remove a Container
docker rm <container_id>
##🔍 Task 4: Explore Advanced Options
🔹 Detached Mode
docker run -d nginx

👉 Runs container in background

🔹 Custom Container Name
docker run -d --name my-nginx nginx
🔹 Port Mapping
docker run -d -p 3000:80 nginx

👉 Access via:

http://localhost:3000
🔹 Check Logs
docker logs <container_id>
🔹 Execute Command Inside Running Container
docker exec -it <container_id> bash
