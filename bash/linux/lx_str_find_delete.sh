#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_str_find_delete.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Find & Delete strings in File
#             | 
#
# Input:      | <fpath> <find_str> 
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
  echo "Description:| Find & Delete String in File                         "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | lx_str_find_delete <fpath> <find_str>                 " 
  echo "____________________________________________________________________"
  echo "Input:      | <fpath> <find_str>                                    "
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

  if [ -z "$INPUT_01" ] || [ -z "$INPUT_02" ]
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

lx_str_find_delete()
{
  sed -ie "/$FIND_STR/d" "$FILEPATH" 2>/dev/null
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
lx_str_find_delete

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
