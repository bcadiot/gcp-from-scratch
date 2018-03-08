#!/bin/bash
yum install -y httpd
systemctl start httpd
echo "Hello GCP From Scratch" > /var/www/html/index.html
