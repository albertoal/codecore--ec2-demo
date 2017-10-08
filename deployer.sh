#!/bin/bash
echo "Starting user-data script deployer.sh"

# Output every command executed
set -x

# Update newest versions of packages and their dependencies
sudo apt-get update -y

# Install nginx and git
sudo apt-get install -y nginx git

# Clone EC2 Demo repo on the Ubuntu user home dir

git clone git://github.com/albertoal/codecore--ec2-demo.git /home/ubuntu/ec2-demo

# Create new website root directory
mkdir -p /var/www/codecore.io

# Copy index.html file to root directory

cp /home/ubuntu/ec2-demo/index.html /var/www/codecore.io/

# Copy NginX server block file to sites-available

cp /home/ubuntu/ec2-demo/codecore.io /etc/nginx/sites-available/codecore.io

# Create Symlink on sites-enabled

sudo ln -s /etc/nginx/sites-available/codecore.io /etc/nginx/sites-enabled/codecore.io

# restart NginX service

sudo service nginx restart