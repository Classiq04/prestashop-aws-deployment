# Troubleshooting

One of the biggest takeaways from this project was that deploying an application to the cloud is rarely a straight line. Most of the time was spent troubleshooting infrastructure, networking, and deployment issues rather than simply installing PrestaShop.

Below are the main issues I encountered and how each one was resolved.

---

# 1. Apache Was Running but the Website Wasn't Accessible

After installing Apache, the service was running correctly.

```bash
sudo systemctl status apache2
```

returned:

```
Active: active (running)
```

However, visiting the server's public IP from the browser resulted in the site being unreachable.

### Investigation

I verified:

* Apache service status
* EC2 public IP
* Security Group inbound rules
* Network connectivity

The issue turned out to be that I was attempting to access the server over **HTTPS** even though I had only configured Apache to serve **HTTP**.

The application was available at:

```
http://3.86.42.179/
```

not

```
https://3.86.42.179/
```

Since SSL had not yet been configured, the browser could not establish a secure HTTPS connection.

### Resolution

* Accessed the application using **HTTP** instead of HTTPS.
* Confirmed inbound **port 80** was open in the EC2 Security Group.
* Verified Apache was serving content correctly.

---

# 2. Lost SSH Access After ISP IP Changed

After successfully connecting to the EC2 instance earlier, a later SSH attempt failed.

```bash
ssh -i prestashop-key.pem ubuntu@3.86.42.179
```

returned a connection timeout.

### Investigation

The EC2 Security Group was configured to allow SSH only from **My current IP**.

Although I hadn't intentionally changed networks, my ISP assigned my connection a new public IP address.

Because the Security Group still contained the previous IP address, AWS blocked the SSH connection.

### Resolution

* Checked my new public IP.
* Updated the EC2 Security Group inbound rule for **port 22** with the new IP.
* Reconnected successfully via SSH.

This reinforced the importance of understanding how Security Groups interact with dynamic public IP addresses.

---

# 3. PHP Was Missing

Apache had been installed successfully, but PHP had not.

Running

```bash
php -v
```

returned:

```
Command 'php' not found
```

### Resolution

Installed PHP together with all required extensions.

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
php-bcmath
```

Restarted Apache afterwards.

---

# 4. GitHub Release Returned 404

The installation guide referenced:

```
https://github.com/PrestaShop/PrestaShop/releases/latest/download/prestashop.zip
```

which returned

```
404 Not Found
```

### Investigation

Instead of assuming GitHub was unavailable, I queried the GitHub Releases API to inspect the latest release information.

This revealed that the naming convention for release assets had changed.

### Resolution

Downloaded the correct release package directly using the versioned asset.

```
prestashop_8.2.1.zip
```

---

# 5. PrestaShop Uses a Nested Archive

After downloading the installer, I discovered that the package contained another archive.

```
prestashop_8.2.1.zip

↓

prestashop.zip

↓

Application Files
```

### Resolution

Performed two extraction steps before deployment.

This is a small detail that's easy to overlook but necessary before copying the application into Apache's document root.

---

# 6. Extraction Failed with "Disk Full"

During extraction I received:

```
write error (disk full?)
```

At first it appeared that the EC2 instance had run out of storage.

### Investigation

Running

```bash
df -h
```

showed:

* Root filesystem had approximately **16 GB free**
* `/tmp` was mounted separately as a **tmpfs** with limited capacity

Although the EC2 instance still had plenty of disk space available, the extraction process was occurring inside `/tmp`, which exhausted its allocated memory.

### Resolution

Moved the extraction into my home directory.

```bash
mkdir ~/prestashop-install
cd ~/prestashop-install
```

Extraction completed successfully afterwards.

---

# 7. Apache Configuration and Permissions

After copying the application into Apache's web root, additional configuration was required before the application would function correctly.

### Resolution

Configured ownership:

```bash
sudo chown -R www-data:www-data /var/www/html/
```

Configured directory permissions:

```bash
sudo find /var/www/html/ -type d -exec chmod 755 {} \;
```

Configured file permissions:

```bash
sudo find /var/www/html/ -type f -exec chmod 644 {} \;
```

Enabled Apache's rewrite module:

```bash
sudo a2enmod rewrite
```

Restarted Apache.

```bash
sudo systemctl restart apache2
```

---

# 8. Connecting to Amazon RDS

Unlike a traditional LAMP stack where MySQL runs locally, this deployment required connecting to a separate managed database hosted on Amazon RDS.

Instead of using

```
localhost
```

the installer needed:

* Amazon RDS endpoint
* Database name
* Username
* Password
* Port 3306

### Investigation

Before running the installer, I verified connectivity using the MySQL client.

```bash
mysql \
-h prestashop-db.cy7iqmeaa4jp.us-east-1.rds.amazonaws.com \
-u prestashopadmin \
-p
```

Initially the connection failed because the RDS Security Group had not been configured correctly.

### Resolution

Updated the RDS Security Group to allow inbound **MySQL (3306)** traffic **only from the EC2 Security Group**, rather than exposing the database to the public internet.

After confirming connectivity, the installer connected successfully and completed without issues.

---

# Lessons Learned

This project reinforced several practical DevOps and cloud engineering concepts:

* Troubleshooting is often more important than installation.
* Read logs before guessing.
* Security Groups are one of the first places to investigate networking issues.
* Dynamic public IP addresses can interrupt SSH access when inbound rules are restricted.
* HTTP and HTTPS are different protocols SSL must be configured before HTTPS will work.
* Managed databases improve security by separating the application and database tiers.
* Small configuration mistakes can consume more time than major installation steps.
* Cloud deployments rarely work perfectly on the first attempt, and methodical debugging is an essential engineering skill.
