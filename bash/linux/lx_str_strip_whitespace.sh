#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_string_strip_whitespace.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Return input string minus leading/trailing whitespace
#
# Input:        String
# Output:       String less leading/trailing whitespace
#
###############################################################################


################################################################################
#  VARIABLES                                                                   #
################################################################################
LX_STRING="$1"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

check_dependencies()
{
  if ! command -v xargs &> /dev/null
  then
    echo "xargs could not be found"
    exit
  fi

  # Validate Passed Parameter
  if [ "$1" == "--help" ] || [ "$LX_STRING" == "" ]; then
    echo "Help!"
    echo "Usage: Supply string to trim leading/trailing whitespace"
    echo "Input: ./lx_string_strip_whitespace.sh \"   Input String    \""
    echo "Output: Input String"
    exit
  fi
}


lx_string_strip_whitespace()
{
  echo "$LX_STRING" | xargs
  #awk "{$LX_STRING=$LX_STRING};1"
}

################################################################################
#  APPLICATION                                                                 #
################################################################################


check_dependencies $1
lx_string_strip_whitespace



