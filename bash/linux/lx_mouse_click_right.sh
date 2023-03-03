#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_mouse_click_right.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Perform mouse right click
#             | 
#
# Input:      | NONE
# Output:     | "right click"
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

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Perform right click @ current mouse location          "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | lx_mouse_click_right.sh                               " 
  echo "____________________________________________________________________"
  echo "Input:      |                                                       "
  echo "____________________________________________________________________"
  echo "Output:     | Mouse Right Click                                     "
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

  if ! command -v echo &> /dev/null
  then
    echo "xdotool could not be found"
    exit
  fi
}

lx_mouse_click_right()
{
  xdotool click --delay "$CLICK_HOLD_MS" --repeat "$CLICK_REPEAT_CNT" 3 2>/dev/null
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
lx_mouse_click_right

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
