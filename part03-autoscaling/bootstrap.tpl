#!/bin/bash
yum install -y httpd
systemctl start httpd
zone=$(curl http://metadata.google.internal/computeMetadata/v1/instance/zone -H
"Metadata-Flavor: Google" | cut -d"/" -f4)
echo "Hello GCP FromScratch from $${zone} > /var/www/html/index.html
