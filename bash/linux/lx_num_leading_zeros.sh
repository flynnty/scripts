#!/bin/bash

if [ -z "$1" ] | [ -z "$2" ]
  then
    echo "usage: ./set_num_width.sh [WIDTH] [NUM]"
    echo description: Prepends leading zeros to fix NUM to WIDTH
    exit
fi


if [ "$1" = "0" ]
  then
    MODIFIER="%00d"
elif [ "$1" = "1" ]
  then
    MODIFIER="%01d"
elif [ "$1" = "2" ]
  then
    MODIFIER="%02d"
elif [ "$1" = "3" ]
  then
    MODIFIER="%03d"
elif [ "$1" = "4" ]
  then
    MODIFIER="%04d"
elif [ "$1" = "5" ]
  then
    MODIFIER="%05d"
elif [ "$1" = "6" ]
  then
    MODIFIER="%06d"
elif [ "$1" = "7" ]
  then
    MODIFIER="%07d"
elif [ "$1" = "8" ]
  then
    MODIFIER="%08d"
elif [ "$1" = "9" ]
  then
    MODIFIER="%09d"
elif [ "$1" = "10" ]
  then
    MODIFIER="%010d"
fi

printf $MODIFIER $2
