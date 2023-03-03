#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_window_url_get.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Focus address bar, type url and go
#
# Input:        $1 Browser Id
# Output:       URL
#
###############################################################################


################################################################################
#  VARIABLES                                                                   #
################################################################################
INPUT_01="$1"
INPUT_02="$2"
INPUT_03="$3"
INPUT_04="$4"
OUTPUT=""

FF_BROWSER_ID="$INPUT_01"
FF_URL=""

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

check_dependencies()
{
  if ! command -v xdotool &> /dev/null
  then
    echo "xdotool could not be found"
    echo "install: sudo apt install xdotool"
    exit
  fi

  # Validate Passed Parameter
  if [ "$FF_BROWSER_ID" == "" ]; then
    echo "please pass a valid browser id"
    exit
  fi
}


ff_window_url_go()
{
  ff_window_url_focus "$FF_BROWSER_ID"
  xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 20 --clearmodifiers "ctrl+a" 2>/dev/null
  sleep 0.1
  xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 20 --clearmodifiers "ctrl+c" 2>/dev/null
  sleep 0.1
  xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 20 --clearmodifiers "Escape" 2>/dev/null
  sleep 0.1
  xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 20 --clearmodifiers "Down" 2>/dev/null
  sleep 0.1
  FF_URL="$(xclip -o 2>/dev/null)"
  OUTPUT="$FF_URL"
 
}

################################################################################
#  APPLICATION                                                                 #
################################################################################


check_dependencies
ff_window_url_go

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi

