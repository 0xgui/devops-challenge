#!/bin/bash

# Install latest docker-compose (v2) to fix "KeyError: 'ContainerConfig'" on legacy versions
curl -L "https://github.com/docker/compose/releases/download/v2.24.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Create challenge directory
cd /root

# Clone the broken repository
git clone https://github.com/0xgui/devops-challenge.git challenge

cd challenge

# Make sure we are in the directory
echo "Environment provisioned in /root/challenge"
