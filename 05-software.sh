#!/bin/bash

# install software
pacman -Sy acpi alsa-utils ansible arc-gtk-theme arc-icon-theme autocutsel bind-tools bash-completion \
	blueman bluez bluez-utils chromium compton cups dialog docker docker-compose exfat-utils feh file-roller filezilla flameshot fwupd \
	firefox geany gimp git gnome-disk-utility gnome-keyring gvfs-gphoto2 gvfs-mtp gvfs-smb htop i3 jdk10-openjdk \
	libreoffice-fresh libsecret lxappearance lxdm lxrandr lxterminal mysql nano network-manager-applet \
	networkmanager networkmanager-openconnect openssh p7zip parcellite pavucontrol pulsemixer \
	playerctl pulseaudio rdesktop ristretto rofi rsync screenfetch scrot seahorse speedcrunch sudo \
	thunar transmission-gtk ttf-bitstream-vera ttf-dejavu ttf-liberation tumbler unzip variety virtualbox virtualbox-host-modules-arch \
	wget xbindkeys xclip xdg-user-dirs xdg-utils xdotool xf86-input-libinput xf86-video-intel xorg xorg-xinit

# needed before mysqld service is enabled
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# enable services
systemctl enable {lxdm,docker,NetworkManager,mysqld,org.cups.cupsd}

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

sudo -u nobody yay -S numix-circle-icon-theme-git spotify mirrorlist-manager
