# Lab 1.4: GRUB Configuration and Boot Process Analysis

**Student:** Lucas Castineiras

**Date:** 24/9/25

**Course:** Operating Systems

## Executive Summary
This project involved analyzing and modifying the GRUB2 bootloader configuration on an Ubuntu virtual machine. The primary change was adjusting the boot menu timeout from 0 to 30 seconds to make the menu visible and interactive. The changes were successfully applied, and the system booted as expected with the new configuration. Additionally, system recovery procedures were researched and documented to prepare for potential boot failures.

## Objectives Completed
- Analyzed the structure and function of the GRUB2 bootloader.
- Safely modified GRUB configurations to alter boot menu behavior.
- Successfully increased the boot menu timeout to 30 seconds.
- Researched and documented three critical system recovery methods.
- Organized all findings, scripts, and evidence into a structured Git repository.

## Main Changes Implemented
- **`GRUB_TIMEOUT`**: Changed from `0` to `30`.
- **`GRUB_TIMEOUT_STYLE`**: Set to `menu` to ensure the boot menu is always displayed.
- **`GRUB_CMDLINE_LINUX_DEFAULT`**: Changed from `"quiet splash"` to `""` to display verbose boot messages instead of the graphical splash screen.

## Key Learnings
- The critical difference between the GRUB template file (`/etc/default/grub`) and the generated configuration file (`/boot/grub/grub.cfg`).
- The necessity of running `sudo update-grub` to apply any changes made to the GRUB configuration.
- How to manually boot a system from the GRUB rescue prompt, a vital skill for disaster recovery.
- The importance of creating backups and VM snapshots before editing critical system files.

## Evidence Files
- **`/screenshots`**: Contains five screenshots documenting the boot menu before and after changes, the configuration files, and the `update-grub` command output.
- **`/configs`**: Stores the original and modified versions of the `/etc/default/grub` file.
- **`/recovery`**: Includes detailed guides on system recovery procedures, GRUB rescue commands, and a troubleshooting checklist.
- **`/scripts`**: Provides shell scripts for automating system backups, restores, and information gathering.