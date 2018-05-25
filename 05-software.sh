#!/bin/bash

echo
echo "====================================="
echo "=== ENABLE MULTILIB IN PACMAN CONFIG
echo "=== [press any key to continue]
echo "====================================="
read
nano /etc/pacman.conf

# install software
pacman -Sy acpi alsa-utils ansible arc-gtk-theme arc-icon-theme autocutsel bind-tools bash-completion \
	blueman bluez bluez-utils compton dialog docker docker-compose feh file-roller filezilla fwupd \
	firefox geany gimp git gnome-keyring gvfs-smb htop i3 jdk10-openjdk libreoffice-fresh \
	lib32-glu lib32-gtk2 lib32-libidn lib32-libxml2 lib32-libxt lib32-mesa \
	libsecret lxappearance lxdm lxterminal mysql nano network-manager-applet networkmanager openssh \
	p7zip pavucontrol pcmanfm playerctl pulseaudio rdesktop ristretto rofi rsync scrot seahorse speedcrunch \
	sudo ttf-bitstream-vera ttf-dejavu ttf-liberation tumbler unzip variety wget xbindkeys xclip \
	xdg-user-dirs xdg-utils xdotool xf86-input-libinput xf86-video-intel xorg xorg-xinit

# enable services
systemctl enable {lxdm,docker,NetworkManager,mysql}

echo
echo "====================================="
echo "=== EDIT SUDOERS FILE"
echo "=== [press any key to continue]"
echo "====================================="
read
EDITOR=nano visudo

# aurman
mkdir /tmp/aurmansetup
cd /tmp/aurmansetup
git clone https://aur.archlinux.org/aurman.git
chmod -R 777 aurman
cd aurman
sudo -u nobody makepkg -sri
cd
rm -rf /tmp/aurmansetup

sudo -u nobody aurman -S acroread google-chrome numix-circle-icon-theme-git spotify
