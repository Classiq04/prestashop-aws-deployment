---

# Deploying PrestaShop on AWS (EC2 + Amazon RDS)

> A production-style deployment of **PrestaShop 8.2.1** on **AWS EC2** with **Amazon RDS MySQL**, completed as part of a DevOps/System Administration technical assessment.

<img width="2720" height="1280" alt="prestashop_aws_architecture" src="https://github.com/user-attachments/assets/35798b04-0b36-4ffb-843f-e88574101b62" />

---

## Background

I built this project as part of the final technical assessment for a DevOps/System Administration internship.

The challenge was straightforward:

> Deploy an e-commerce application on AWS and make it accessible over the internet.

I decided to build the deployment the way it would typically be done in the cloud:

* Application hosted on an EC2 instance
* Database hosted separately on Amazon RDS
* Communication secured through AWS Security Groups
* Manual installation and troubleshooting throughout the deployment

Although I later declined the opportunity because of the employment terms, I completed the assessment and published this repository as part of my engineering portfolio.

---

# AWS Services Used

* Amazon EC2
* Amazon RDS (MySQL)
* Amazon VPC
* Security Groups
* IAM

---

# Tech Stack

### Cloud

* AWS EC2
* AWS RDS

### Operating System

* Ubuntu 26.04 LTS

### Web Server

* Apache2

### Backend

* PHP 8.5

### Database

* Amazon RDS MySQL 8.4

### Version Control

* Git
* GitHub

### Application

* PrestaShop 8.2.1

---

# Deployment Process

The deployment consisted of several stages.

### 1. Provision AWS Infrastructure

* Launch Ubuntu EC2 instance
* Create Amazon RDS MySQL database
* Configure Security Groups
* Allow EC2 to communicate with RDS

---

### 2. Configure the Server

Installed:

* Apache2
* PHP 8.5
* Required PHP extensions
* unzip
* wget

---

### 3. Download PrestaShop

Downloaded PrestaShop 8.2.1 release manually from GitHub after discovering that the "latest" release link returned a 404.

---

### 4. Deploy Application

* Extract files
* Configure Apache
* Configure permissions
* Connect to Amazon RDS
* Complete web installer

---

### 5. Verify Deployment

Verified:

* Apache service
* PHP installation
* Database connectivity
* Installer completion
* Public accessibility
---

# Key Skills Demonstrated

* Linux Administration
* Apache Configuration
* PHP Installation
* AWS EC2
* Amazon RDS
* MySQL Connectivity
* Security Groups
* Networking
* Troubleshooting
* Cloud Infrastructure
* System Administration

---

# Future Improvements

I plan to expand this project by adding:

* Docker
* Docker Compose
* Terraform
* GitHub Actions
* Nginx Reverse Proxy
* Let's Encrypt SSL
* CloudWatch Monitoring
* Application Load Balancer
* Amazon EKS deployment
* Automated Infrastructure Provisioning

---

# Screenshots

Future updates will include:

* AWS Architecture
* EC2 Dashboard
* RDS Dashboard
* Security Groups
* PrestaShop Installer
* Running Store
* Apache Configuration
* Terminal Commands

---

# Reflection

What started as a technical assessment became an opportunity to practice deploying and troubleshooting a cloud-hosted application using AWS services.

The most valuable part of this project wasn't getting PrestaShop running—it was diagnosing and resolving the issues that surfaced along the way. Those moments required understanding Linux, networking, cloud infrastructure, and application deployment rather than simply following documentation.

---

## Author

**Samuel Ayodeji Bankole**

Aspiring Cloud & DevOps Engineer

* 💼 LinkedIn: *www.linkedin.com/in/classiq04*


---

I think we can make this even stronger by adding **actual screenshots of your AWS console, EC2 instance, RDS configuration, Security Groups, terminal output, and the finished PrestaShop site**. A README with visuals feels like a mini case study and makes a much stronger impression on recruiters than text alone.
