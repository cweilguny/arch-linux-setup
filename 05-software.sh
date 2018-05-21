#!/bin/bash

# useful system stuff
pacman -S sudo bash-completion git networkmanager wget xdotool htop

echo edit sudoers
echo [press any key to continue]
read
EDITOR=nano visudo

echo enable multilib in pacman config
echo [press any key to continue]
read
nano /etc/pacman.conf

# aurman
mkdir /tmp/aurmansetup
cd /tmp/aurmansetup
git clone https://aur.archlinux.org/aurman.git
chmod -R 777 aurman
cd aurman
sudo -u nobody makepkg -sri
cd
rm -rf /tmp/aurmansetup

# xorg and drivers
pacman -S xorg-server xorg-apps xf86-video-intel xf86-input-synaptics bluez bluez-utils

# desktop
pacman -S acpi alsa-utils ansible arc-gtk-theme arc-icon-theme autocutsel bash-completion \
	blueman bluez bluez-utils compton dialog docker docker-compose feh file-roller \
	firefox geany gimp git gvfs-smb htop i3 jdk10-openjdk lib32-glu \
	lib32-gtk2 lib32-libidn lib32-libxml2 lib32-libxt lib32-mesa \
	lxappearance lxdm lxterminal nano network-manager-applet networkmanager pavucontrol \
	pcmanfm playerctl pulseaudio ristretto rofi scrot sudo ttf-bitstream-vera \
	ttf-dejavu ttf-liberation tumbler unzip variety wget xbindkeys xclip xdg-user-dirs \
	xdg-utils xdotool xf86-input-synaptics xf86-video-intel xorg xorg-xinit

aurman -S acroread google-chrome numix-circle-icon-theme-git nvm spotify

# alternatively an Openbox setup
# pacman -S openbox openbox-themes obconf oblogout lxappearance-obconf-gtk3 lightdm light-locker lightdm-gtk-greeter compton plank stalonetray slock
