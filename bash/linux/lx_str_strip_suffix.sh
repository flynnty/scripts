#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_string_strip_suffix.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Strip suffix substring from string
#             | 
#
# Input:      | "Str", "suffix subStr"
# Output:     | "Str less suffix subStr"
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

LX_FILE_PATH="$INPUT_01"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Strip suffix substring from string                    "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | ./lx_string_strip_suffix "HelloWorld" "World"         " 
  echo "            | Hello                                                 "
  echo "____________________________________________________________________"
  echo "Input:      | [str] [suffix]                                        "
  echo "____________________________________________________________________"
  echo "Output:     | str less suffix                                       "
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
}

lx_string_strip_suffix()
{
  echo ${INPUT_01%"$INPUT_02"}
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
lx_string_strip_suffix

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
