#!/bin/bash -e

SCRIPT_NAME="boot-services-script"
SERVICES_FOLDER_PATH="/opt/iombian-services"

install -m 644 -g root -o root files/${SCRIPT_NAME}.sh ${ROOTFS_DIR}${SERVICES_FOLDER_PATH}
install -m 644 -g root -o root files/${SCRIPT_NAME}.service ${ROOTFS_DIR}/etc/systemd/system

on_chroot << EOF
  systemctl enable ${SCRIPT_NAME}.service
EOF