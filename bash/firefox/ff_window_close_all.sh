#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_window_close_all.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Close all ff browser windows
#
# Input:        NONE
# Output:       Close All FF Windows
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

################################################################################
#  FUNCTIONS                                                                   #
################################################################################


print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Close All firefox windows                             "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | ff_window_close_all                                   "
  echo "____________________________________________________________________"
  echo "Input:      | NONE                                                  "
  echo "____________________________________________________________________"
  echo "Output:     | Close all firefox window IDs                          "
  echo "____________________________________________________________________"
}

check_dependencies()
{
  if [ "$INPUT_01" == "--help" ]
    then
      print_help
      exit
  fi

#  if [ -z "$INPUT_01" ]
#    then
#      print_help
#      exit
#  fi

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


ff_window_close_all()
{
  for id in $(ff_window_id_list); do
    ff_window_close_id "$id"
    sleep 1
  done
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

check_dependencies
ff_window_close_all

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi



