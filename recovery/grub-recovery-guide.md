# Linux System Recovery Guide

This guide provides step-by-step instructions for three common Linux system recovery scenarios.

---

## GRUB Rescue Mode

This mode appears when the GRUB bootloader can't find your Linux kernel or essential boot files. You'll see a black screen with a prompt like `grub rescue>`. Your goal is to manually locate the boot files and tell GRUB where to find them.

### 1. List Available Partitions

First, see what drives and partitions GRUB can detect.
```bash
ls
```
This will output a list like `(hd0)`, `(hd0,msdos1)`, `(hd0,msdos2)`.

### 2. Find Your Linux Partition

You need to find which partition contains your Linux installation (specifically the `/boot` directory). Inspect the contents of each partition until you find directories like `boot`, `etc`, and `home`. Let's assume you find your Linux system on `(hd0,msdos1)`.
```bash
ls (hd0,msdos1)/boot/
```

### 3. Set the Boot Partition

Once you've identified the correct partition, tell GRUB where to find the boot files.
```bash
set root=(hd0,msdos1)
set prefix=(hd0,msdos1)/boot/grub
```

### 4. Load the Kernel and Initrd

Now, load the Linux kernel and the initial RAM disk (`initrd`).
```bash
linux /boot/vmlinuz-linux
initrd /boot/initramfs-linux.img
```
> **Note:** The exact file names will vary. Use `ls /boot/` after setting `root` to see the correct filenames and use tab-completion if available.

### 5. Boot the System

Finally, execute the boot command.
```bash
boot
```
Once your system has booted, open a terminal and run the following commands to permanently fix the GRUB configuration:
```bash
sudo grub-install /dev/sda
sudo update-grub
```

---

## Recovery from a Live USB/DVD

If GRUB is completely broken, you can use a live Linux USB/DVD to repair it.

### 1. Boot from the Live Environment

Start your computer from the bootable USB drive and choose the "Try Ubuntu" (or equivalent) option to enter the live desktop.

### 2. Identify Your System Partition

Open a terminal and list the partitions to find your main Linux installation.
```bash
sudo lsblk -f
```
Look for the partition with the `ext4` filesystem that corresponds to your system's root (`/`). Let's assume it's `/dev/sda2`.

### 3. Mount the System

Mount your system's root partition.
```bash
sudo mount /dev/sda2 /mnt
```
If you have a separate boot partition (e.g., `/dev/sda1`), mount it as well.
```bash
sudo mount /dev/sda1 /mnt/boot
```

### 4. Enter the `chroot` Environment

The `chroot` command lets you run commands as if you were booted into your installed system. First, bind the necessary system directories.
```bash
for i in /dev /dev/pts /proc /sys /run; do sudo mount -B $i /mnt$i; done
```
Now, enter the `chroot` environment.
```bash
sudo chroot /mnt
```

### 5. Reinstall and Update GRUB

From within the `chroot`, reinstall GRUB to the master boot record (MBR) and update its configuration.
```bash
grub-install /dev/sda
update-grub
```

### 6. Exit and Reboot

Exit the `chroot` environment, unmount the filesystems, and reboot.
```bash
exit
sudo umount -R /mnt
sudo reboot
```
Remove the live USB, and your system should boot normally.

---

## Backup Restoration

This method is for fixing a specific problem caused by a misconfigured file, relying on a `.backup` file you previously created.

### 1. Identify the Problem File

You need to know which configuration file is causing the issue (e.g., `/etc/fstab`).

### 2. Navigate to the File's Location

Open a terminal and go to the directory containing the faulty file.
```bash
cd /etc/
```

### 3. Restore from Backup

Copy the backup over the existing file. This is generally safer than moving or renaming.
```bash
sudo cp /etc/fstab.backup /etc/fstab
```

### 4. Verify and Reboot

Check the contents of the restored file to ensure it's correct, then reboot.
```bash
cat /etc/fstab
sudo reboot
```