# GRUB Rescue Mode Commands

This document provides a quick reference for the essential commands used in the `grub rescue>` prompt to manually boot a Linux system.

### **`ls`**
* **Purpose:** Lists available disks, partitions, and the contents of directories. It is the primary tool for finding your Linux installation.
* **Example Usage:**
    ```bash
    # List all detected drives and partitions
    ls
    
    # List the contents of the /boot directory on a specific partition
    ls (hd0,msdos1)/boot/
    ```

### **`set`**
* **Purpose:** Sets environment variables that tell GRUB where to find key boot files. The `root` and `prefix` variables are the most critical.
* **Example Usage:**
    ```bash
    # Set the partition that contains the /boot directory
    set root=(hd0,msdos1)
    
    # Set the path to the GRUB directory itself
    set prefix=(hd0,msdos1)/boot/grub
    ```

### **`linux`**
* **Purpose:** Loads the Linux kernel file (often named `vmlinuz-...`) into memory.
* **Example Usage:**
    ```bash
    linux /boot/vmlinuz-linux
    ```

### **`initrd`**
* **Purpose:** Loads the initial RAM disk image (often named `initramfs-...` or `initrd.img-...`) into memory. This is required for the kernel to mount the root filesystem.
* **Example Usage:**
    ```bash
    initrd /boot/initramfs-linux.img
    ```

### **`boot`**
* **Purpose:** Executes the boot process, starting the system using the kernel and initrd that were just loaded into memory.
* **Example Usage:**
    ```bash
    boot
    ```

---
*After successfully using these commands to boot the system, you must run `sudo grub-install` and `sudo update-grub` to repair the bootloader permanently.*