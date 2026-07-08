#!/bin/bash

# Update system
dnf update -y

# Install Java, Docker, Git, wget
dnf install java-17-amazon-corretto docker git wget -y

# Start and enable Docker
systemctl start docker
systemctl enable docker

# Add Jenkins repository
wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import Jenkins key
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install Jenkins
dnf install jenkins -y

# Start and enable Jenkins
systemctl start jenkins
systemctl enable jenkins

# Add Jenkins user to Docker group
usermod -aG docker jenkins
