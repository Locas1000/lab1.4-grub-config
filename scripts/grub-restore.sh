#!/bin/bash

# A script to restore the most recent GRUB file backups.

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo."
  exit 1
fi

# Find the most recent backup for /etc/default/grub
LATEST_GRUB=$(ls -t /etc/default/grub.backup-* | head -n 1)

# Find the most recent backup for /boot/grub/grub.cfg
LATEST_CFG=$(ls -t /boot/grub/grub.cfg.backup-* | head -n 1)

echo "Most recent /etc/default/grub backup is: $LATEST_GRUB"
echo "Most recent /boot/grub/grub.cfg backup is: $LATEST_CFG"

read -p "Are you sure you want to restore these files? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Restoring files..."
    cp "$LATEST_GRUB" /etc/default/grub
    cp "$LATEST_CFG" /boot/grub/grub.cfg
    echo "Restore complete. It is recommended to run 'sudo update-grub' now."
else
    echo "Restore cancelled."
fi