#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install apache2 -y

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
wget \
unzip \
mysql-client

sudo systemctl enable apache2

sudo systemctl restart apache2

echo "Apache and PHP installation complete."
