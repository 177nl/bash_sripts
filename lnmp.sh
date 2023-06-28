#!/bin/bash

# Update package lists and upgrade existing packages
sudo apt update
sudo apt upgrade -y

# Install Nginx
sudo apt install nginx -y

# Install MySQL
sudo apt install mysql-server -y
sudo mysql_secure_installation

# Install PHP and required extensions
sudo apt install php-fpm php-mysql -y

# Configure Nginx to work with PHP
sudo rm /etc/nginx/sites-available/default
sudo touch /etc/nginx/sites-available/default

# Add Nginx configuration
echo "
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.php index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}" | sudo tee /etc/nginx/sites-available/default > /dev/null

# Restart Nginx
sudo systemctl restart nginx

echo "LEMP stack installation complete."
