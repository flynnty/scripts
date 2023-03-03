#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     template.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Use this base template for all new scripts
#             | 
#
# Input:      | "Str1", "Str2"
# Output:     | "Str1Str2"
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
  echo "Description:|                                                       "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | ./template "Hello" "World!"                           " 
  echo "____________________________________________________________________"
  echo "Input:      | [PATH1] [PATH2]                                       "
  echo "____________________________________________________________________"
  echo "Output:     | Diff Delta between 2 paths or files                   "
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

  if ! command -v echo &> /dev/null
  then
    echo "echo could not be found"
    exit
  fi

  if [ ! -f file.txt ]; then
    echo "file.txt  could not be found"
    exit
  fi
}

template()
{
  OUTPUT=$(echo "$INPUT_01$INPUT_02")
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
template

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
