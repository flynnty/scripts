#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_desktop_show.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:  Minimize everything to the 'Tray'
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
}

lx_desktop_show()
{
  xdotool key --delay 20 --clearmodifiers "Super+d" 2>/dev/null
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

check_dependencies $1
lx_desktop_show

