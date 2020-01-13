#!/bin/bash -ex

WATCHPOINT_DIR="${ROOTFS_DIR}/srv/watchpoint"

# Copy watchpoint files
mkdir "$WATCHPOINT_DIR"
docker save --output "${WATCHPOINT_DIR}/watchpoint.tar" alexhorn/watchpoint:latest
cp "files/docker-compose.yml" "files/start.sh" "$WATCHPOINT_DIR"

# Set up systemd service
cp "files/watchpoint.service" "${ROOTFS_DIR}/etc/systemd/system/"
on_chroot << EOF
systemctl enable watchpoint.service
EOF
