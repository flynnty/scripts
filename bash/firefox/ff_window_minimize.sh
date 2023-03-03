#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_window_minamize.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Minimize firefox browser with ID
#
# Input:        ID of browser window to minimize
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
    if ! command -v ff_window_id_get &> /dev/null; then
      echo "ff_window_id_get  could not be found"
      exit
    fi
    FF_BROWSER_ID="$(ff_window_id_get)"
  fi
  # Validate Passed Parameter
  if [ "$FF_BROWSER_ID" == "0" ]; then
    echo "please pass a valid browser id"
    exit
  fi
}


ff_window_minimize()
{
  xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 20 --clearmodifiers "super+Down" 2>/dev/null

}

################################################################################
#  APPLICATION                                                                 #
################################################################################


check_dependencies
ff_window_minimize
