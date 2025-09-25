#!/bin/bash

# A script to back up critical GRUB files with timestamping.

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo."
  exit 1
fi

# Date for unique backup filenames
TIMESTAMP=$(date "+%Y-%m-%d-%H%M%S")

echo "Backing up /etc/default/grub..."
cp /etc/default/grub /etc/default/grub.backup-$TIMESTAMP

echo "Backing up /boot/grub/grub.cfg..."
cp /boot/grub/grub.cfg /boot/grub/grub.cfg.backup-$TIMESTAMP

echo "Backup complete. Files created with timestamp $TIMESTAMP"
ls -la /etc/default/grub.backup-*
ls -la /boot/grub/grub.cfg.backup-*