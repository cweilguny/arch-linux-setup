#!/bin/bash

# install software
pacman -Sy acpi alsa-utils ansible arc-gtk-theme arc-icon-theme autocutsel bind-tools bash-completion \
    blueman bluez bluez-utils chromium compton cups dialog docker docker-compose exfat-utils feh \
    file-roller filezilla flameshot fwupd firefox geany gimp git gnome-disk-utility gnome-keyring \
    gvfs-gphoto2 gvfs-mtp gvfs-smb htop i3 jdk11-openjdk libreoffice-fresh libsecret lxappearance \
    lxdm lxrandr lxterminal nano network-manager-applet networkmanager numlockx openssh p7zip parcellite \
    pavucontrol pulsemixer playerctl pulseaudio rdesktop restic ristretto rofi rsync speedcrunch sudo \
    thunar transmission-gtk ttf-bitstream-vera ttf-dejavu ttf-liberation ttf-roboto ttf-roboto-mono tumbler unzip variety \
    wget xclip xdg-user-dirs xdg-utils xdotool xf86-input-libinput xf86-video-intel xorg xorg-xinit

# enable services
systemctl enable {lxdm,docker,NetworkManager,org.cups.cupsd}

echo
echo "====================================="
echo "=== EDIT SUDOERS FILE"
echo "=== [press any key to continue]"
echo "====================================="
read
EDITOR=nano visudo

# yay
mkdir /tmp/yaysetup
cd /tmp/yaysetup
git clone https://aur.archlinux.org/yay.git
chmod -R 777 yay
cd yay
sudo -u nobody makepkg -sri
cd
rm -rf /tmp/yaysetup

sudo -u nobody yay -S systemd-boot-pacman-hook numix-circle-icon-theme-git spotify mirrorlist-manager teams xbindkeys
