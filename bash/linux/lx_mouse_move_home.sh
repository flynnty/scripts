#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_mouse_move_home.sh
# Author:       tflynn
# Date:         20221223
# Copyleft:     Tony Flynn
#
# Description:| Perform mouse move to (0, 0) position
#             | 
#
# Input:      | NONE
# Output:     | "Move to (0, 0)"
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

CLICK_HOLD_MS="100"
CLICK_REPEAT_CNT="0"
X_LOC="0"
Y_LOC="0"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Move mouse to home position                           "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | lx_mouse_move_home.sh                                 " 
  echo "____________________________________________________________________"
  echo "Input:      |                                                       "
  echo "____________________________________________________________________"
  echo "Output:     | Mouse Move Home                                       "
  echo "____________________________________________________________________"
}

check_dependencies()
{
  if [ "$INPUT_01" == "--help" ]
    then
      print_help
      exit
  fi

#  if [ -z "$INPUT_01" ]; then
#  fi

  if ! command -v xdotool &> /dev/null
  then
    echo "xdotool could not be found"
    exit
  fi
}

lx_mouse_move_home()
{
  xdotool mousemove --sync $X_LOC $Y_LOC 2>/dev/null
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
lx_mouse_move_home

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
