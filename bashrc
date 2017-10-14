#!/usr/bin/env bash
clean() {
  unset HISTFILE
  exit
}

highestRes() {
  seeT "$1" | grep setVideoHLS | cut -d\' -f2 | xvres-show
}

