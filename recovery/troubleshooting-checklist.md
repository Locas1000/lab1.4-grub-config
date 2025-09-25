# GRUB Troubleshooting Checklist

- [ ] **Problem: GRUB menu doesn't show.**
  - [ ] **Check:** Is `GRUB_TIMEOUT_STYLE=menu` set in `/etc/default/grub`?
  - [ ] **Check:** Is `GRUB_TIMEOUT` set to a value greater than 0?

- [ ] **Problem: Changes to GRUB configuration are not applied after reboot.**
  - [ ] **Action:** Did you run `sudo update-grub` after saving the file?
  - [ ] **Action:** Check for any syntax errors in `/etc/default/grub`.
  - [ ] **Action:** Re-run `sudo update-grub` and check for errors in the output.

- [ ] **Problem: System boots to a `grub rescue>` prompt.**
  - [ ] **Cause:** GRUB cannot find the boot partition or its files.
  - [ ] **Action:** Follow the GRUB Rescue procedure to manually locate the partition and boot the system.
  - [ ] **Action:** Once booted, run `sudo grub-install /dev/sdX` and `sudo update-grub` to repair the bootloader.