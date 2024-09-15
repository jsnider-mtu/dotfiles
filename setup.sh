#!/bin/bash
set -eo pipefail

apt-get update -y

apt-get install -y i3 \
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
                   clipit \
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

gpg -d /home/josh/.aws/credentials.gpg -o /home/josh/.aws/credentials

pip install awscli --break-system-packages

aws --profile backup s3 sync s3://sniderboy2005-backup ~

reboot
