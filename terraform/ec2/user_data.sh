#!/bin/bash

# Update the package database
sudo yum update && sudo dnf update -y

# Install Docker
sudo dnf install docker htop git nmap -y

# Start Docker service
sudo systemctl start docker

# Enable Docker service to start on boot
sudo systemctl enable docker

# Check if Docker is running
if sudo systemctl is-active --quiet docker; then
  echo "Docker is running"
else
  echo "Docker is not running, attempting to start Docker again"
  sudo systemctl start docker
  if sudo systemctl is-active --quiet docker; then
    echo "Docker started successfully"
  else
    echo "Failed to start Docker"
    exit 1
  fi
fi

# Check Docker version
docker --version

# Add the ec2-user to the docker group to run docker commands without sudo
sudo usermod -aG docker ec2-user

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the Docker Compose binary
sudo chmod +x /usr/local/bin/docker-compose

# Verify Docker Compose installation
docker-compose --version
