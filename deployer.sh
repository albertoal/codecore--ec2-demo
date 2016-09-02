#!/bin/bash
echo "Starting user-data script deployer.sh"

# Output every command executed
set -x

# Update newest versions of packages and their dependencies
sudo apt-get update -y

# Install nginx and git
sudo apt-get install -y nginx git

# Clone EC2 Demo repo on the Ubuntu user home dir

git clone git://github.com/albertoal/ec2-demo-v1.git /home/ubuntu/ec2-demo-v1

# Create new website root directory
sudo mkdir -p /var/www/codecore.io

# Copy index.html file to root directory

sudo cp /home/ubuntu/ec2-demo-v1/index.html /var/www/codecore.io/

# Copy NginX server block file to sites-available

sudo cp /home/ubuntu/ec2-demo-v1/codecore.io /etc/nginx/sites-available/codecore.io

# Create Symlink on sites-available

sudo ln -s /etc/nginx/sites-available/codecore.io /etc/nginx/sites-enabled/codecore.io

# Start NginX service

sudo service nginx start




