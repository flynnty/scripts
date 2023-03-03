#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_tab_close.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Close firefox tab of active browser with ID
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


ff_tab_close()
{
  xdotool windowactivate "${FF_BROWSER_ID}" key --delay 20 --clearmodifiers "ctrl+F4" 2>/dev/null

}

################################################################################
#  APPLICATION                                                                 #
################################################################################


check_dependencies
ff_tab_close
