#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_window_id_list.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  List IDs open firefox browser windows
#
# Input:        None
# Output:       ID List
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
FF_WINDOW_ID_LIST=""

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Get ID list of open firefox window                    "
  echo "            | Note: Topmost most list ID is topmost browser window  "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | ./ff_window_id_list.sh                                " 
  echo "____________________________________________________________________"
  echo "Input:      | NONE                                                  "
  echo "____________________________________________________________________"
  echo "Output:     | Window ID List                                        "
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
  # check tac is installed (reverse list order)
  if ! command tac --help &> /dev/null
  then
    echo "tac could not be found"
    echo "install: sudo apt install tac"
    exit
  fi
}


ff_window_id_list()
{
  FF_WINDOW_ID_LIST=$(tac <<<$(xdotool search --onlyvisible --class "$FF_BROWSER" 2>/dev/null))
  OUTPUT=$FF_WINDOW_ID_LIST
}

################################################################################
#  APPLICATION                                                                 #
################################################################################


check_dependencies
ff_window_id_list

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi

