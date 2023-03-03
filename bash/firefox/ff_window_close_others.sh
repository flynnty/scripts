#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_window_close_others.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Close all ff browser windows except ID or Active
#
# Input:        FF_BROWSER_ID/NONE
# Output:       Close All FF Browser Windows except ID or Active
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
FF_BROWSER_ID="$INPUT_01"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################


print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Close All firefox windows except ID                   "
  echo "            | If no ID close all windows except active              "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | ff_window_close_others                                "
  echo "____________________________________________________________________"
  echo "Input:      | FF_BROWSER_ID/NONE                                    "
  echo "____________________________________________________________________"
  echo "Output:     | Close all firefox window IDs but FF_BROWSER_ID/Active "
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
      if ! command -v ff_window_id_get &> /dev/null; then
        echo "ff_window_id_get could not be found"
        exit
      fi
      FF_BROWSER_ID=$(ff_window_id_get)
  fi

#  if ! command -v xdotool &> /dev/null
#  then
#    echo " could not be found"
#    exit
#  fi

  if ! command -v ff_window_id_list &> /dev/null; then
    echo "ff_window_id_list could not be found"
    exit
  fi

  if ! command -v ff_window_close_id &> /dev/null; then
    echo "ff_window_close_id could not be found"
    exit
  fi
}

ff_window_close_others()
{
  for line in $(ff_window_id_list); do
    if [ "$FF_BROWSER_ID" == "$line" ]; then
      continue
    fi
    ff_window_close_id "$line"
    sleep 1
  done
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

check_dependencies
ff_window_close_others

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi



