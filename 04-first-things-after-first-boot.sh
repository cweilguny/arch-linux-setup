#!/bin/bash

# settings
USERNAME=insertusernamehere
HOSTNAME=set.your.hostname
TIMEZONE=Europe/Vienna
KEYMAP=de-latin1
LOCALE=LANG=en_US.UTF-8

# setup wifi
wifi-menu

# create a user
useradd -m -G users,wheel -s /bin/bash $USERNAME
passwd $USERNAME

# system setup
timedatectl set-timezone $TIMEZONE
timedatectl set-local-rtc 1 --adjust-system-clock
hostnamectl set-hostname $HOSTNAME
localectl set-keymap $KEYMAP
localectl set-locale $LOCALE
