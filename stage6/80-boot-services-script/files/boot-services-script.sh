#!/bin/bash -e

SCRIPT_NAME="boot-services-script"
SERVICES_FOLDER_PATH="/opt/iombian-services"

# Traverse all services folders
for service_folder in ${SERVICES_FOLDER_PATH}/*; do
  if [ ! -d "$service_folder" ]; then
    break
  fi

  # Check if a compose file exists in the folder
  if [ -f ${service_folder}/*compose.* ]; then
    # Move to the folder, get the file path and execute the "docker compose up" command
    cd $service_folder
    compose_file_path=$(ls -d ${service_folder}/*compose.*)
    docker compose -f ${compose_file_path} up -d
  fi
done

# Remove the script and the systemd service
rm -rf /opt/iombian-services/${SCRIPT_NAME}.sh
systemctl disable ${SCRIPT_NAME}.service
rm -rf /etc/systemd/system/${SCRIPT_NAME}.service