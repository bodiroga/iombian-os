#!/bin/bash -e

# Uninstall all conflicting packages
#for pkg in docker.io docker-doc docker-compose containerd runc; do apt-get remove $pkg; done

# Set up Docker's apt repository
echo "----- Installing Docker's dependencies..."
apt-get update
apt-get install ca-certificates curl

echo "----- Adding Docker's official keys..."
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/raspbian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo "----- Adding Docker's official repository..."
ls -lh /etc/apt/sources.list.d
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/raspbian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
ls -lh /etc/apt/sources.list.d
cat /etc/apt/sources.list.d/docker.list

echo "----- Updating the package list..."
apt-get update

# Install the Docker packages
echo "----- Installing Docker packages..."
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin