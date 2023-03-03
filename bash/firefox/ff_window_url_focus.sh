#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_window_url_focus.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Focus firefox address bar ready for URL Typing
#
# Input:        ID of browser window
# Output:       Error String or None 
#
###############################################################################


################################################################################
#  VARIABLES                                                                   #
################################################################################
FF_BROWSER_ID=$1

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

check_dependencies()
{
  # check xdotool is installed
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
  # Validate Passed Parameter
  if [ "$FF_BROWSER_ID" == "0" ]; then
    echo "please pass a valid browser id"
    exit
  fi
}


ff_window_url_focus()
{
  xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 20 --clearmodifiers "ctrl+l" 2>/dev/null
  xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 20 --clearmodifiers "ctrl+a" 2>/dev/null
}

################################################################################
#  APPLICATION                                                                 #
################################################################################


check_dependencies
ff_window_url_focus
