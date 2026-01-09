#!/bin/bash

# Create challenge directory
cd /root

# Clone the broken repository
git clone https://github.com/0xgui/devops-challenge.git challenge

cd challenge

# Make sure we are in the directory
echo "Environment provisioned in /root/challenge"
