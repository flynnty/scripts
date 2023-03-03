#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_str_find_replace.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Find & Replace strings in File
#             | 
#
# Input:      | <fpath> <find_str> <replace_str>
# Output:     | None
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

FILEPATH="$INPUT_01"
FIND_STR="$INPUT_02"
REPLACE_STR="$INPUT_03"

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
  echo "Description:| Find & Replace String in File                         "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | lx_str_find_replace <fpath> <find_str> <replace_str>  " 
  echo "____________________________________________________________________"
  echo "Input:      | <fpath> <find_str> <replace_str>                      "
  echo "____________________________________________________________________"
  echo "Output:     | None                                                  "
  echo "____________________________________________________________________"
}

check_dependencies()
{
  if [ "$INPUT_01" == "--help" ]
    then
      print_help
      exit
  fi

  if [ -z "$INPUT_01" ] || [ -z "$INPUT_02" ] || [ -z "$INPUT_03" ]
    then
      print_help
      exit
  fi

  if ! command -v sed &> /dev/null
  then
    echo "sed could not be found"
    exit
  fi
}

lx_str_find_replace()
{
  sed -ie "s/$FIND_STR/$REPLACE_STR/g" "$FILEPATH" 2>/dev/null
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
lx_str_find_replace

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
