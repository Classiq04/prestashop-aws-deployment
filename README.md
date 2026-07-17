# Deploying PrestaShop on AWS with Amazon EC2 & RDS

Production-style deployment of **PrestaShop 8.2.1** using **Amazon EC2**, **Apache**, **PHP**, and **Amazon RDS (MySQL)**.

![AWS](https://img.shields.io/badge/AWS-EC2%20%7C%20RDS-orange)
![Ubuntu](https://img.shields.io/badge/Ubuntu-26.04-E95420)
![Apache](https://img.shields.io/badge/Apache-2.4-red)
![PHP](https://img.shields.io/badge/PHP-8.5-777BB4)
![MySQL](https://img.shields.io/badge/MySQL-8.4-blue)

---

## Architecture

<img width="2720" height="1280" alt="prestashop_aws_architecture" src="https://github.com/user-attachments/assets/35798b04-0b36-4ffb-843f-e88574101b62" />

This deployment follows a simple two-tier architecture:

- Internet
- Amazon EC2 (Ubuntu 26.04)
  - Apache
  - PHP 8.5
  - PrestaShop 8.2.1
- Amazon RDS (MySQL 8.4)
- AWS Security Groups controlling traffic between EC2 and RDS

---

# Background

I built this project as part of the final technical assessment for a DevOps/System Administration internship.

The challenge was straightforward:

> Deploy an e-commerce application on AWS using a separate managed database while making the application publicly accessible.

I chose to implement the deployment using AWS best practices by separating the application and database tiers.

The deployment was completed successfully, although I later declined the opportunity after reviewing the employment terms. Rather than letting the work go to waste, I decided to document the entire deployment and publish it as part of my engineering portfolio.

---

# Project Objectives

- Deploy PrestaShop on Amazon EC2.
- Host the database on Amazon RDS.
- Configure secure communication between EC2 and RDS.
- Install and configure Apache and PHP.
- Troubleshoot deployment issues encountered during installation.
- Document the deployment as an engineering case study.

---

# AWS Services Used

- Amazon EC2
- Amazon RDS (MySQL)
- Amazon VPC
- Security Groups
- IAM

---

# Tech Stack

## Cloud

- AWS EC2
- Amazon RDS

## Operating System

- Ubuntu Server 26.04 LTS

## Web Server

- Apache2

## Backend

- PHP 8.5

## Database

- Amazon RDS MySQL 8.4

## Version Control

- Git
- GitHub

## Application

- PrestaShop 8.2.1

---

# Repository Structure

```text
prestashop-on-aws/
│
├── README.md
├── DEPLOYMENT.md
├── TROUBLESHOOTING.md
├── ARCHITECTURE.png
├── screenshots/
├── scripts/
│   └── install.sh
└── app/
```

---

# Deployment Workflow

## 1. Provision Infrastructure

- Launch Ubuntu EC2 instance
- Create Amazon RDS MySQL database
- Configure Security Groups
- Allow EC2 to communicate with RDS

---

## 2. Configure the Server

Installed:

- Apache2
- PHP 8.5
- PHP Extensions
- unzip
- wget
- MySQL Client

Verified:

- Apache running
- PHP installed
- Web server reachable

---

## 3. Download PrestaShop

Downloaded PrestaShop manually from GitHub after discovering that the documented "latest" release download returned a **404 Not Found**.

Resolved the issue by querying the GitHub Releases API to locate the correct versioned asset.

---

## 4. Deploy the Application

- Extract archive
- Configure Apache
- Configure permissions
- Enable mod_rewrite
- Copy application into `/var/www/html`
- Restart Apache

---

## 5. Configure Database

Connected the EC2 instance to Amazon RDS using the MySQL client.

Verified connectivity before completing the web installer.

Configured the installer with:

- Amazon RDS Endpoint
- Database Name
- Username
- Password
- Port 3306

---

## 6. Complete Installation

Completed the PrestaShop installation wizard.

Verified:

- Apache
- PHP
- MySQL Connectivity
- Installer completion
- Store accessibility

---

# Results

Deployment completed successfully.

✅ Apache configured

✅ PHP 8.5 installed

✅ Amazon RDS connected

✅ Remote database functioning

✅ PrestaShop installed successfully

✅ Store accessible through the public IP

✅ Separate application and database tiers

---

# Skills Demonstrated

- Linux Administration
- Apache Configuration
- PHP Installation
- AWS EC2
- Amazon RDS
- MySQL Connectivity
- Networking
- Security Groups
- Linux Permissions
- Troubleshooting
- Cloud Infrastructure
- Technical Documentation

---

# Future Improvements

This project can be extended by implementing:

- Docker
- Docker Compose
- Terraform
- GitHub Actions CI/CD
- Nginx Reverse Proxy
- Let's Encrypt SSL
- CloudWatch Monitoring
- Application Load Balancer
- Auto Scaling
- Amazon EKS Deployment

---

# Screenshots

The repository includes screenshots covering:

- AWS Architecture
- EC2 Instance
- Amazon RDS
- Security Groups
- Apache Status
- Terminal Commands
- Installer
- Running Store

---

# Reflection

This project reinforced an important lesson:

Deployments rarely succeed perfectly on the first attempt.

The most valuable experience came from troubleshooting unexpected issues rather than simply following documentation. Resolving GitHub download failures, storage limitations, Apache configuration issues, file permissions, and remote database connectivity strengthened my understanding of Linux system administration and AWS networking.

Publishing this repository serves as a record of both the successful deployment and the engineering process behind it.

---

# Connect With Me

**Samuel Ayodeji Bankole**

Aspiring Cloud & DevOps Engineer

- LinkedIn: https://www.linkedin.com/in/classiq04
- GitHub: https://github.com/classiq04
