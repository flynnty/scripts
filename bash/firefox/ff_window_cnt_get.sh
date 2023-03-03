#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_window_cnt_get.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Get count of open firefox browser windows
#
# Input:        None
# Output:       Open Window Count
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
FF_WINDOW_CNT="0"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Get count of open firefox windows                     "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | ff_window_cnt_get                                     " 
  echo "____________________________________________________________________"
  echo "Input:      | NONE                                                  "
  echo "____________________________________________________________________"
  echo "Output:     | Window Open Cnt                                       "
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

  # check xdotool is installed
  if ! command -v xdotool &> /dev/null
  then
    echo "xdotool could not be found"
    echo "install: sudo apt install xdotool"
    exit
  fi
  # check wc is installed
  if ! command wc --help &> /dev/null
  then
    echo "wc could not be found"
    echo "install: sudo apt install wc"
    exit
  fi
}


ff_window_cnt_get()
{
  FF_WINDOW_CNT=$(xdotool search --onlyvisible --class "$FF_BROWSER" 2>/dev/null | wc -l)
  OUTPUT=$FF_WINDOW_CNT
}

################################################################################
#  APPLICATION                                                                 #
################################################################################


check_dependencies
ff_window_cnt_get

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi

