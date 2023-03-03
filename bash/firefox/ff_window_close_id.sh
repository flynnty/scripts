#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_window_close_id.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Close active firefox window
#
# Input:        ID of browser window
# Output:       Error String or None 
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

FF_BROWSER_ID=$INPUT_01
FF_WINDOW_CNT=""
FF_POPUP_ID=""

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Close Firefox window ID                               "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | ./ff_window_close_id.sh 1234567                       " 
  echo "____________________________________________________________________"
  echo "Input:      | [FF Window ID]                                        "
  echo "____________________________________________________________________"
  echo "Output:     | FF Window Closes                                      "
  echo "____________________________________________________________________"
}

check_dependencies()
{
  if [ "$INPUT_01" == "--help" ]
    then
      print_help
      exit
  fi

  if [ -z "$INPUT_01" ]
    then
      print_help
      exit
  fi

  if ! command -v xdotool &> /dev/null
  then
    echo "xdotool could not be found"
    exit
  fi
  if ! command -v ff_window_cnt_get &> /dev/null; then
    echo "ff_window_cnt_get could not be found"
    exit
  fi
}

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

ff_window_close_id()
{
  # Capture the starting condition window count
  FF_WINDOW_CNT="$(ff_window_cnt_get)"

  xdotool windowactivate "${FF_BROWSER_ID}" key --delay 20 --clearmodifiers "alt+F4" 2>/dev/null
  sleep 1

  # We can sometimes get a ff poipup here if we try to close a tab that is
  # actively downloading a webpage, if so hit retuern to close the popup
  if [ "$(ff_window_cnt_get)" == "$((FF_WINDOW_CNT+1))" ]; then
    FF_POPUP_ID="$(ff_window_id_get)"
    xdotool windowactivate --sync "${FF_POPUP_ID}" key --delay 20 --clearmodifiers "Return" 2>/dev/null
  fi


}

################################################################################
#  APPLICATION                                                                 #
################################################################################

check_dependencies
ff_window_close_id

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi

