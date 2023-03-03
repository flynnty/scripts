#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_window_blank.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Clear firefox window (about:blank)
#
# Input:        [browser Id]
# Output:       None
#
###############################################################################


################################################################################
#  VARIABLES                                                                   #
################################################################################
FF_BROWSER_ID="$1"
FF_ABOUT_BLANK_URL="about:blank"
FF_ABOUT_HOME_URL="about:home"

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

  # if no url for $2 assume url is $1 & win ID is active window
  if [ "$FF_BROWSER_ID" == "" ]; then
    FF_BROWSER_ID="$(ff_window_id_get)"
  fi

  # Validate Passed Parameter
  if [ "$FF_BROWSER_ID" == "" ]; then
    echo "please pass a valid browser id"
    exit
  fi
 
}


ff_window_blank()
{
#  ff_window_url_focus "$FF_BROWSER_ID"
#  xdotool windowactivate --sync "${FF_BROWSER_ID}" type --delay 50 --clearmodifiers "$FF_ABOUT_BLANK_URL" 2>/dev/null
#  xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 20 --clearmodifiers "Return" 2>/dev/null
#  sleep 1
  ff_window_url_focus "$FF_BROWSER_ID"
  xdotool windowactivate --sync "${FF_BROWSER_ID}" type --delay 50 --clearmodifiers "$FF_ABOUT_HOME_URL" 2>/dev/null
  xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 20 --clearmodifiers "Return" 2>/dev/null
  sleep 1
}

################################################################################
#  APPLICATION                                                                 #
################################################################################


check_dependencies
ff_window_blank



