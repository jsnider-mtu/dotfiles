#!/bin/bash
TEST=`mpc|wc -l`

if [ $TEST -eq 1 ]
then
  echo "Is Off"
  echo "Is Off"
  echo "#226688"
  exit 0
fi

if [ $TEST -eq 2 ]
then
  ERR=`mpc|sed -n '2p'`
  echo $ERR
  echo "ERROR"
  echo "#FF0000"
  exit 0
fi

FULL=`mpc|head -n1`
SHORT=`echo $STATUS | cut -d' ' -f3`
STATUS=`mpc|sed -n 's/^\[\([a-z]*\)\].*$/\1/p'`

if [ $BLOCK_BUTTON ]
then
  if [ $BLOCK_BUTTON -eq 1 ]
  then
    if [ $STATUS == 'playing' ]
    then
      mpc pause 1>/dev/null
      echo "Paused"
      exit 0
    elif [ $STATUS == 'paused' ]
    then
      mpc play 1>/dev/null
      echo "Playing"
      exit 0
    fi
  elif [ $BLOCK_BUTTON -eq 3 ]
  then
    mpc next 1>/dev/null
    echo "Next"
    exit 0
  elif [ $BLOCK_BUTTON -eq 2 ]
  then
    mpc prev 1>/dev/null
    echo "Previous"
    exit 0
  fi
fi

if [ $STATUS == 'paused' ]
then
  FULL="$FULL [paused]"
fi

echo "$FULL"
echo "$SHORT"
echo "#226688"
exit 0
