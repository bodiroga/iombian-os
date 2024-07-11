#!/bin/bash -e

# Download all the images present on the compose file for the arm64 architecture

SERVICES_FOLDER_PATH="/opt/iombian-services"
SERVICE_NAME="iombian-installed-services-handler"
COMPOSE_FILE_PATH="${ROOTFS_DIR}${SERVICES_FOLDER_PATH}/${SERVICE_NAME}/*compose.*"

COMPOSE_IMAGES=$(cat $COMPOSE_FILE_PATH | grep "    image: " | sed s/\ \ \ \ image:\ //)

for image in $COMPOSE_IMAGES; do
  echo "Downloading $image image..."
  docker image pull --platform=linux/arm64  $image
done