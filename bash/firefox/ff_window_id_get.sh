#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_window_id_get.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Get the ID of the Active (Topmost) Firefox browser
#
# Input:        None
# Output:       Return 0 if no Active Firefox Browser found
#               Return Browser ID number if found
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

FF_BROWSER="firefox"
FF_BROWSER_ID=""

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

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Get ID of Topmost Firefox Window                      "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | ff_window_id_get.sh                                   "
  echo "____________________________________________________________________"
  echo "Input:      | None                                                  "
  echo "____________________________________________________________________"
  echo "Output:     | Window ID or 0 if no window open                      "
  echo "____________________________________________________________________"
}

check_dependencies()
{
  if [ "$INPUT_01" == "--help" ]
    then
      print_help
      exit
  fi

#  if [ -z "$INPUT_01" ] || [ -z "$INPUT_02" ]
#    then
#      print_help
#      exit
#  fi

  if ! command -v xdotool &> /dev/null
  then
    echo "xdotool could not be found"
    exit
  fi
  if ! command -v ff_window_id_list &> /dev/null
  then
    echo "xdotool could not be found"
    exit
  fi
}


ff_window_id_get()
{
  #FF_BROWSER_ID="$(xdotool search --onlyvisible --class "${FF_BROWSER}" 2>/dev/null | tail -n 1)"
  FF_BROWSER_ID="$(ff_window_id_list | head -n 1)"

  if [ "$FF_BROWSER_ID" == "" ]; then
    FF_BROWSER_ID="0"
  fi
  OUTPUT=$FF_BROWSER_ID
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

check_dependencies
ff_window_id_get

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi



