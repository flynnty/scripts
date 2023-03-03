#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_reload_page.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Reload Active Browser ID Page
#
# Input:        [FF_BROWSER_ID]
# Output:       Error String or none 
#
###############################################################################


################################################################################
#  VARIABLES                                                                   #
################################################################################
FF_BROWSER="firefox"
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
    FF_BROWSER_ID="$(ff_window_id_get)"
  fi
  # Validate Passed Parameter
  if [ "$FF_BROWSER_ID" == "0" ]; then
    echo "please pass a valid browser id"
    exit
  fi
}


ff_reload_page()
{
  xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 20 --clearmodifiers "ctrl+R" 2>/dev/null

}

################################################################################
#  APPLICATION                                                                 #
################################################################################


check_dependencies
ff_reload_page
