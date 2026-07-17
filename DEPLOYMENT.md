# Deployment Guide

## Objective

Deploy PrestaShop 8.2.1 on an Ubuntu EC2 instance while hosting the database on Amazon RDS MySQL.

---

## AWS Services Used

- Amazon EC2
- Amazon RDS (MySQL)
- VPC
- Security Groups
- IAM

---

## 1. Update the Server

```bash
sudo apt update
sudo apt upgrade -y
```

---

## 2. Install Apache

```bash
sudo apt install apache2 -y

sudo systemctl enable apache2

sudo systemctl start apache2
```

---

## 3. Install PHP

```bash
sudo apt install -y \
php \
php-cli \
libapache2-mod-php \
php-mysql \
php-curl \
php-gd \
php-intl \
php-mbstring \
php-xml \
php-zip \
php-bcmath \
unzip \
wget
```

Restart Apache.

```bash
sudo systemctl restart apache2
```

---

## 4. Verify Apache

```bash
sudo systemctl status apache2

curl http://localhost
```

---

## 5. Download PrestaShop

The latest release URL returned a 404.

Query GitHub API.

```bash
wget -O - https://api.github.com/repos/PrestaShop/PrestaShop/releases/latest
```

Download a stable release.

```bash
wget https://github.com/PrestaShop/PrestaShop/releases/download/8.2.1/prestashop_8.2.1.zip
```

---

## 6. Extract Files

```bash
mkdir ~/prestashop-install

cd ~/prestashop-install

cp /tmp/prestashop_8.2.1.zip .

unzip prestashop_8.2.1.zip

mkdir app

unzip prestashop.zip -d app
```

---

## 7. Deploy

```bash
sudo rm -rf /var/www/html/*

sudo cp -a ~/prestashop-install/app/. /var/www/html/

sudo chown -R www-data:www-data /var/www/html/

sudo find /var/www/html/ -type d -exec chmod 755 {} \;

sudo find /var/www/html/ -type f -exec chmod 644 {} \;

sudo a2enmod rewrite

sudo systemctl restart apache2
```

---

## 8. Test Database Connectivity

```bash
sudo apt install mysql-client
```

```bash
mysql \
-h prestashop-db.cy7iqmeaa4jp.us-east-1.rds.amazonaws.com \
-u prestashopadmin \
-p
```

---

## 9. Complete Installation

Open your EC2 public IP in the browser.

Fill in the installer using the Amazon RDS endpoint.

Installation completes successfully.
