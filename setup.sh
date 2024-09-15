#!/bin/bash
set -eo pipefail

apt-add-repository -y ppa:system76-dev/stable

apt-get update -y

apt-get install -y system76-driver \
                   i3 \
                   mpv \
                   mtr-tiny \
                   net-tools \
                   p11-kit \
                   p7zip \
                   pm-utils \
                   qpdf \
                   remmina \
                   screen \
                   seahorse \
                   simple-scan \
                   sqlite3 \
                   tcpdump \
                   virt-manager \
                   wget \
                   xdg-utils \
                   xinput \
                   xkeycaps \
                   xz-utils \
                   yt-dlp \
                   bc \
                   curl \
                   docker.io \
                   dos2unix \
                   eog \
                   fdisk \
                   gimp \
                   gnupg \
                   gparted \
                   gvncviewer \
                   gzip \
                   jq \
                   gngb \
                   xsel \
                   vim-gtk3 \
                   openssl \
                   python3-pip \
                   gpg \
                   qiv \
                   numlockx \
                   i3blocks \
                   mpd \
                   ncmpcpp \
                   feh \
                   vim \
                   acpi \
                   unity-settings-daemon \
                   pulseaudio \
                   conky-all \
                   handbrake-cli \
                   ffmpeg \
                   fonts-font-awesome \
                   xbacklight \
                   diodon \
                   gcc \
                   terminator \
                   pcmanfm \
                   libnotify-bin \
                   htop \
                   shutter \
                   compton

echo $?

for x in $(ls /tmp/dotfiles); do
  if [[ ${x} == "README.md" ]]; then
    continue
  fi
  echo "Removing /home/josh/.${x}"
  rm -rf "/home/josh/.${x}"
  echo "Moving ${x} to /home/josh/.${x}"
  mv -f /tmp/dotfiles/${x} "/home/josh/.${x}"
done

chown -R josh:josh /home/josh

rm -rf /tmp/dotfiles

reboot
