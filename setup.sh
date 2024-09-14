#!/bin/bash
set -eo pipefail

apt-get update -y

apt-get install -y i3 \
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
                   clipit \
                   gcc \
                   terminator \
                   pcmanfm \
                   libnotify-bin \
                   htop \
                   shutter \
                   compton

echo $?

#mv /tmp/dotfiles/bashrc ~/.bashrc
#
#mv /tmp/dotfiles/pinerc ~/.pinerc
#
#mv /tmp/dotfiles/vimrc ~/.vimrc
#
#mv /tmp/dotfiles/config ~/.config
#
#mv /tmp/dotfiles/i3 ~/.i3
#
#mv /tmp/dotfiles/local ~/.local
#
#mv /tmp/dotfiles/mpd ~/.mpd
#
#mv /tmp/dotfiles/ncmpcpp ~/.ncmpcpp

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
