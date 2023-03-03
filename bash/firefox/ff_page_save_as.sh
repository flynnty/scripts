#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_page_save_as.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Save firefox webpage
#             | 
#
# Input:      | [FF_BROWSER_ID] <SAVE_PATH>
# Output:     | NONE
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
FF_SAVE_BOX_ID=""
FF_FILE_EXISTS_POPUP_ID=""
FF_WINDOW_CNT=""
SAVE_PATH="$INPUT_02"

# Pointer to OUTPUT
#declare -n SOME_VAR=OUTPUT
#SOME_VAR="$INPUT_01"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Save Firefox page as.  Use passed parameter for FF    "
  echo "            | browser ID otherwise use active browser               "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | ./ff_page_save_as.sh {FF_BROWSER_ID} <SAVE_PATH>      " 
  echo "____________________________________________________________________"
  echo "Input:      | [FF_BROWSER_ID] [SAVE_PATH]                           "
  echo "____________________________________________________________________"
  echo "Output:     | NONE                                                  "
  echo "____________________________________________________________________"
}

check_dependencies()
{
  if [ "$INPUT_01" == "--help" ]
    then
      print_help
      exit
  fi

  if [ -z "$INPUT_01" ]; then
      print_help
      exit
  fi

  # No passed browser ID, use active window
  if [ -z "$INPUT_01" ] || [ -z "$INPUT_02" ]; then
    FF_BROWSER_ID="$(ff_window_id_get)"
    SAVE_PATH="$INPUT_01"
  fi

  if ! command -v xdotool &> /dev/null; then
    echo "xdotool could not be found"
    exit
  fi
  if ! command -v ff_window_cnt_get &> /dev/null; then
    echo "ff_window_cnt_get could not be found"
    exit
  fi
  if ! command -v ff_window_id_get &> /dev/null; then
    echo "ff_window_id_get could not be found"
    exit
  fi

#  if [ ! -f file.txt ]; then
#    echo "file.txt  could not be found"
#    exit
#  fi
}

ff_page_save_as()
{
  # Capture the starting condition
  FF_WINDOW_CNT="$(ff_window_cnt_get)"

  xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 20 --clearmodifiers "ctrl+s" 2>/dev/null

  # wait for save dialogue popup
  while [ "$(ff_window_cnt_get)" == "$FF_WINDOW_CNT" ]; do
    sleep 1
  done

  # Grab the save dialogue popup id
  FF_SAVE_BOX_ID="$(ff_window_id_get)"

  # Select all text in save as bar
  xdotool windowactivate --sync "${FF_SAVE_BOX_ID}" key --delay 20 --clearmodifiers "ctrl+a" 2>/dev/null
  # Type the file path/name
  xdotool windowactivate --sync "${FF_SAVE_BOX_ID}" type --delay 20 --clearmodifiers "$SAVE_PATH" 2>/dev/null

  sleep 1
  xdotool windowactivate --sync "${FF_SAVE_BOX_ID}" key --delay 20 --clearmodifiers "Return" 2>/dev/null

  # Wait for save ID to close
#  while [ "$(ff_window_cnt_get)" == "$((FF_WINDOW_CNT+1))" ]; do
#    # Hit return to actuate save
#    xdotool windowactivate --sync "${FF_SAVE_BOX_ID}" key --delay 20 --clearmodifiers "Return" 2>/dev/null
#    sleep 1
#  done

  sleep 1

  # If file already exists then overwrite it
  if [ "$(ff_window_cnt_get)" == "$((FF_WINDOW_CNT+2))" ]; then
    FF_FILE_EXISTS_POPUP_ID="$(ff_window_id_get)"
    xdotool windowactivate --sync "${FF_FILE_EXISTS_POPUP_ID}" key --delay 20 --clearmodifiers "Return" 2>/dev/null
  fi

}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
ff_page_save_as

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
