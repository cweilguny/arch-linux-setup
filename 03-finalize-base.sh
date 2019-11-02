#!/bin/bash

# set a password for root
passwd

# uncomment locales in /etc/locale.gen
nano /etc/locale.gen
locale-gen

# prepare for wifi setup after reboot
pacman -S iw wpa_supplicant dialog

# install bootloader
# systemd-boot
bootctl --path=/boot install

cat <<EOT > /boot/loader/loader.conf
timeout 3
auto-entries 1
EOT

cat <<EOT > /boot/loader/entries/arch.conf
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux.img
#options root=UUID=719a61f0-10e9-4b69-ba7d-515b2f645a9d rw
options root=LABEL=arch_os rw
EOT


# or alternatively GRUB
#pacman -S grub efibootmgr os-prober
#grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
#grub-mkconfig -o /boot/grub/grub.cfg

# or alternatively REFIND
#pacman -S refind-efi
#refind-install

# exit the chroot
echo going to exit the chroot now, after that, unmount /mnt and reboot
echo [press any key to continue]
read
exit
