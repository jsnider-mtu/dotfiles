#!/bin/bash -eo pipefail

apt-get update -y

apt-get install -y i3 \
                   i3blocks \
                   mpd \
                   ncmpcpp \
                   feh \
                   vim \
                   acpi \
                   unity-settings-daemon \
                   pulseaudio \
                   conky \
                   handbrake-cli \
                   brave \
                   ffmpeg \
                   fonts-font-awesome

useradd -d /home/josh -m -s /bin/bash -U josh

sudo -u josh -i

git clone https://github.com/jsnider-mtu/dotfiles.git /tmp

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
  mv /tmp/dotfiles/${x} "~/.${x}"
done

