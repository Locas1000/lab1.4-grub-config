#!/bin/bash

# A script to display key system and GRUB information.

echo "--- System Information ---"
lsb_release -a
echo

echo "--- Kernel Information ---"
uname -a
echo

echo "--- GRUB Version ---"
sudo grub-install --version
echo

echo "--- Block Device Layout ---"
lsblk
echo