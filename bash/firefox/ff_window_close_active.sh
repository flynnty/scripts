#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_window_close_active.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Close the Active (Topmost) Firefox browser
#
# Input:        None
# Output:       Close Active FF Browser
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

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Close Topmost Firefox Window                          "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | ./ff_window_close_active.sh                           "
  echo "____________________________________________________________________"
  echo "Input:      | None                                                  "
  echo "____________________________________________________________________"
  echo "Output:     | Close topmost firefox window                          "
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

  if [ ! -f ff_window_close_id ]
  then
    echo "ff_window_close_id could not be found"
    exit
  fi

  if ! command -v  ff_window_id_get &>/dev/null
  then
    echo "ff_window_id_get could not be found"
    exit
  fi
}


ff_window_close_active()
{
  ff_window_close_id "$(ff_window_id_get)"
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

check_dependencies
ff_window_close_active

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi



