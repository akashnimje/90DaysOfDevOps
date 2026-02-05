🚀 Day 08 – Cloud Server Setup (Cheat Sheet)
🎯 Objective

Deploy a real web server on a cloud VM and practice:

Cloud provisioning

SSH access

Service installation (Nginx & Docker)

Security configuration

Log extraction & backup

☁️ Cloud Environment

Provider: AWS EC2

OS: Ubuntu

Instance Type: t2.micro

Region: ap-southeast-2

Web Server: Nginx

Container Engine: Docker

🧩 Step-by-Step Cheat Sheet
1️⃣ Connect to EC2
ssh -i your-key.pem ubuntu@<public-ip>


📸 Screenshot:

1-create ec2 machine .png

2-system update.png

2️⃣ Update System
sudo apt update

3️⃣ Install Nginx
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx


📸 Screenshot:

3-install nginx.png

4️⃣ Install Docker
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker


📸 Screenshot:

4-install docker.png

5️⃣ Configure Security Group (AWS)

Inbound Rule:

Type: HTTP

Port: 80

Source: 0.0.0.0/0

6️⃣ Verify Web Access

Open browser:

http://<your-public-ip>


Expected:
✅ Nginx welcome page

📸 Screenshot:

5-nginx welcome page .png

7️⃣ Check Nginx Logs
cat /var/log/nginx/access.log
cat /var/log/nginx/error.log


📸 Screenshot:

6-checked nginx accesslog and error log.png

8️⃣ Save Logs to File
sudo cat /var/log/nginx/access.log /var/log/nginx/error.log > nginx-logs.txt
ls -l
cat nginx-logs.txt


📸 Screenshot:

7-nginx log backup file.png

🧪 Commands Summary
sudo apt update

sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx

sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

cat /var/log/nginx/access.log
cat /var/log/nginx/error.log

sudo cat /var/log/nginx/access.log /var/log/nginx/error.log > nginx-logs.txt

⚠️ Common Issues & Fixes
Issue	Fix
Website not opening	Allow port 80 in Security Group
Permission denied on logs	Use sudo
Service stops after reboot	systemctl enable nginx docker
