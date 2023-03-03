#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_window_open.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Open new firefox window
#
# Input:        None
# Output:       FF_BROWSER_ID 
#
###############################################################################


################################################################################
#  VARIABLES                                                                   #
################################################################################
FF_BROWSER_ID=""
FF_BROWSER="firefox"

FF_WINDOW_CNT="0"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

check_dependencies()
{
  # check xdotool is installed
  if ! command -v firefox &> /dev/null
  then
    echo "firefox could not be found"
    exit
  fi

  # check xdotool is installed
  if ! command -v ff_window_cnt_get &> /dev/null
  then
    echo "ff_window_cnt_get could not be found"
    exit
  fi
  if ! command -v ff_window_id_get &> /dev/null
  then
    echo "ff_window_id_get could not be found"
    exit
  fi
}


ff_window_open()
{
  FF_WINDOW_CNT="$(ff_window_cnt_get)"  
  $(firefox --browser --sync --display $DISPLAY &>/dev/null &)

  # wait for the window to open before exiting
  while [ "$FF_WINDOW_CNT" == "$(ff_window_cnt_get)" ]; do
    sleep 0.1
  done

  FF_BROWSER_ID="$(ff_window_id_get)"
  echo "$FF_BROWSER_ID"
}

################################################################################
#  APPLICATION                                                                 #
################################################################################


check_dependencies
ff_window_open

