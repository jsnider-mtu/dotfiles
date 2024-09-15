#!/bin/bash
set -eo pipefail

gpg --import /tmp/private.gpg

gpg -o /home/josh/.aws/credentials -d /home/josh/.aws/credentials.gpg

pip install awscli --break-system-packages

aws --profile backup s3 sync s3://sniderboy2005-backup/.local/bin ~/.local/bin

aws --profile backup s3 sync s3://sniderboy2005-backup/Documents ~/Documents

aws --profile backup s3 sync s3://sniderboy2005-backup/Pictures/wallpapers ~/Pictures/wallpapers

aws --profile backup s3 sync s3://sniderboy2005-backup/books ~/books

aws --profile backup s3 sync s3://sniderboy2005-backup/reactions ~/reactions

aws --profile backup s3 cp s3://sniderboy2005-backup/.bash_aliases ~/.bash_aliases

aws --profile backup s3 cp s3://sniderboy2005-backup/bgupdate.sh ~/bgupdate.sh

aws --profile backup s3 cp s3://sniderboy2005-backup/githubAvatar.png ~/githubAvatar.png

aws --profile backup s3 cp s3://sniderboy2005-backup/torClientRC ~/torClientRC

aws --profile backup s3 cp s3://sniderboy2005-backup/torServerRC ~/torServerRC

aws --profile backup s3 cp s3://sniderboy2005-backup/update-golang.sh ~/update-golang.sh
