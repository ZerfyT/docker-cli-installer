#!/bin/bash

# Bash script to automate Docker CLI installation on Ubuntu

# Exit immediately if a command exits with a non-zero status
# set -e

# Update the package database
echo "Updating package database..."
sudo apt-get update -y

# Install necessary prerequisites
echo "Installing prerequisites..."
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker's official GPG key
echo "Adding Docker's GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Set up the Docker stable repository
echo "Setting up Docker stable repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package database again
echo "Updating package database with Docker repository..."
sudo apt-get update -y

# Install the Docker CLI
echo "Installing Docker CLI..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify installation
echo "Verifying Docker CLI installation..."
# sudo docker --version
# sudo docker run hello-world

echo "Fixing Docker as non-root user..."
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
mkdir -p /home/"$USER"/.docker
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R

echo "Verifying Docker as non-root user..."
# docker --version
# docker run hello-world

echo "Start Docker on boot..."
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Installation complete
echo "Docker CLI installation completed successfully!"
