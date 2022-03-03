#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable --now httpd
sudo echo "Hello World! This is terraform managed Web Server." > /var/www/html/index.html