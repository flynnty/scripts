#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_mouse_click_left.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Focus browser window and left click
#             | 
#
# Input:      | [browser id]
# Output:     | left click
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

FF_BROWSER_ID="$INPUT_01"
CLICK_HOLD_MS="100"
CLICK_REPEAT_CNT="0"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Focus FF window and perform left click                "
  echo "            | Focus Active FF Window or Passed Window ID            "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | ff_mouse_click_left [browser id]                      " 
  echo "____________________________________________________________________"
  echo "Input:      | [browser id]                                          "
  echo "____________________________________________________________________"
  echo "Output:     | Mouse Left Click                                      "
  echo "____________________________________________________________________"
}

check_dependencies()
{
  if [ "$INPUT_01" == "--help" ]; then
      print_help
      exit
  fi

  if [ -z "$INPUT_01" ]; then
    if ! command -v ff_window_id_get &> /dev/null; then
      echo "ff_window_id_get could not be found"
      exit
    fi
    FF_BROWSER_ID=$(ff_window_id_get)
  fi

  if ! command -v xdotool &> /dev/null
  then
    echo "xdotool could not be found"
    exit
  fi

}

ff_mouse_click_left()
{
  xdotool windowactivate --sync "${FF_BROWSER_ID}" click --delay "$CLICK_HOLD_MS" --repeat "$CLICK_REPEAT_CNT" 1 2>/dev/null
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
ff_mouse_click_left

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
