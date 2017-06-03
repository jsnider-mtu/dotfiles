#!/bin/bash

if [ $BLOCK_BUTTON ]
then
  if [ $BLOCK_BUTTON -eq 1 ]
  then
    amixer -q -D pulse sset Master toggle && pkill -RTMIN+1 i3blocks
  elif [ $BLOCK_BUTTON -eq 4 ]
  then
    amixer -q -D pulse sset Master 5%+ && pkill -RTMIN+1 i3blocks
  elif [ $BLOCK_BUTTON -eq 5 ]
  then
    amixer -q -D pulse sset Master 5%- && pkill -RTMIN+1 i3blocks
  fi
fi

MUTED=`pacmd list-sinks|grep muted|cut -d':' -f2|xargs`

if [ $MUTED = "no" ]
then
  perc=`pacmd list-sinks|grep volume|head -n1|xargs|cut -d' ' -f3|cut -d% -f1`
  echo $perc'%'
  echo $perc'%'
  if [ $perc -ge 90 ]
  then
    echo "#ff0000"
    exit 0
  elif [ $perc -gt 65 ]
  then
    echo "#f4ac1c"
    exit 0
  fi
else
  echo "Mute"
  echo "Mute"
  echo "#ff0000"
fi
