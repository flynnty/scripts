#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_window_id_get.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Get the ID of the currently active window
#
# Input:        None
# Output:       Return 0 if no window found
#               Return window ID number if found
#
###############################################################################


################################################################################
#  VARIABLES                                                                   #
################################################################################
LX_WINDOW_ID=0

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
}


lx_window_id_get()
{
  LX_WINDOW_ID="$(xdotool getactivewindow 2>/dev/null)"

  if [ "$LX_WINDOW_ID" == "" ]; then
    LX_WINDOW_ID=0
  fi
}

################################################################################
#  APPLICATION                                                                 #
################################################################################


check_dependencies
lx_window_id_get

echo "$LX_WINDOW_ID"


