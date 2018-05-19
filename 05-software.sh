#!/bin/bash

# useful system stuff
pacman -S sudo bash-completion git networkmanager wget xdotool htop
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

# xorg and drivers
pacman -S xorg-server xorg-apps xf86-video-intel xf86-input-synaptics bluez bluez-utils

# desktop
pacman -S openbox openbox-themes obconf oblogout lxappearance-obconf-gtk3 lightdm light-locker lightdm-gtk-greeter compton plank stalonetray slock
pacman -S geany thunar ristretto evince file-roller nodejs npm blueberry guake lxterminal rofi shutter network-manager-applet variety nitrogen firefox
yaourt -S --noconfirm google-chrome lxdm-themes franz brightside skippy-xd-git arc-icon-theme gtk-theme-arc-git

# infinality
sudo pacman-key -r 962DDE58
sudo pacman-key -f 962DDE58
sudo pacman-key --lsign-key 962DDE58
echo "
[infinality-bundle]
Server = http://bohoomil.com/repo/\$arch
[infinality-bundle-fonts]
Server = http://bohoomil.com/repo/fonts" >> /etc/pacman.conf
pacman -S infinality-bundle ibfonts-meta-base ibfonts-meta-extended

# geany themes
git clone https://github.com/codebrainz/geany-themes.git /tmp/geany-themes
mkdir -p ~/.config/geany/colorschemes
cp /tmp/geany-themes/colorschemes/* ~/.config/geany/colorschemes/
rm -rf /tmp/geany-themes
