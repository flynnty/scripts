#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_string_type.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Type string in current area of focus
#
# Input:        Text string to type
# Output:       None
#
###############################################################################


################################################################################
#  VARIABLES                                                                   #
################################################################################
LX_TYPE_STRING="$1"

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
  if [ "$LX_TYPE_STRING" == "" ]; then
    echo "please pass a string to type"
    exit
  fi
}


lx_string_type()
{
  xdotool type --delay 50 --clearmodifiers "$LX_TYPE_STRING"
}

################################################################################
#  APPLICATION                                                                 #
################################################################################


check_dependencies
lx_string_type



