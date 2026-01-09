#!/bin/bash

# Create challenge directory
mkdir -p /root/challenge
cd /root/challenge

# Create app.py with the BUG (127.0.0.1 binding)
cat <<EOF > app.py
from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello from Docker!"

if __name__ == "__main__":
    port = int(os.getenv("APP_PORT", 5000))
    app.run(host="127.0.0.1", port=port)
EOF

# Create requirements.txt
cat <<EOF > requirements.txt
flask
EOF

# Create Dockerfile
cat <<EOF > Dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
EOF

# Create docker-compose.yml
cat <<EOF > docker-compose.yml
version: "3.8"

services:
  web:
    build: .
    ports:
      - "8080:5000"
    environment:
      - APP_PORT=5000
EOF

# Make sure we are in the directory
echo "Environment provisioned in /root/challenge"
