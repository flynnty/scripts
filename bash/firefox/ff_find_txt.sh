#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     ff_find_txt.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Find text on loaded HTML page
#             | 
#
# Input:      | [BROWSER ID]
# Output:     | 1 - Text Found, 0 - Text Not Found
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
FIND_STR="$INPUT_02"

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
  echo "Description:| Find text on html page                                "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | ff_find_txt [BROWSER_ID] <FIND_STRING>                " 
  echo "____________________________________________________________________"
  echo "Input:      | [BROWSER_ID] <FIND_STRING>                            "
  echo "____________________________________________________________________"
  echo "Output:     | 1 - Found, 0 - Not Found                              "
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

  # Validate Passed Parameter
  if [ "$INPUT_02" == "" ]; then
    if ! command -v ff_window_id_get &> /dev/null; then
      echo "ff_window_id_get  could not be found"
      exit
    fi
    FF_BROWSER_ID="$(ff_window_id_get)"
    FIND_STR="$INPUT_01"
  fi

  if ! command -v xdotool &> /dev/null
  then
    echo "xdotool could not be found"
    exit
  fi
  if ! command -v xclip &> /dev/null
  then
    echo "xclip could not be found"
    exit
  fi

#  if [ ! -f file.txt ]; then
#    echo "file.txt  could not be found"
#    exit
#  fi
}


ff_find_txt()
{
  xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 200 --clearmodifiers "ctrl+f" 2>/dev/null
  sleep 1

  xdotool windowactivate --sync "${FF_BROWSER_ID}" type --delay 50 --clearmodifiers "$FIND_STR" 2>/dev/null
  xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 50 --clearmodifiers "Return" 2>/dev/null


  # tab to find close box
  for((i=0; i<7; i++)); do
    xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 20 --clearmodifiers "Tab" 2>/dev/null
  done
  xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 50 --clearmodifiers "Return" 2>/dev/null

  # Select URL Text
  xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 20 --clearmodifiers "ctrl+shift+Down" 2>/dev/null
  # Copy URL Text
  xdotool windowactivate --sync "${FF_BROWSER_ID}" key --delay 20 --clearmodifiers "ctrl+c" 2>/dev/null
  

  if [ "$(xclip -o 2>/dev/null)" == "$FIND_STR" ]; then
    OUTPUT="1"
  else
    OUTPUT="0"
  fi
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
ff_find_txt

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
