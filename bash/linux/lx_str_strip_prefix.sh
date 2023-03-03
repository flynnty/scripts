#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_string_strip_prefix.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Strip prefix substring from string
#             | 
#
# Input:      | "Str", "prefix subStr"
# Output:     | "Str les prefis subStr"
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
  echo "Description:| Strip prefix substring from string                    "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | ./lx_string_strip_prefix "HelloWorld" "Hello"         " 
  echo "            | World                                                 "
  echo "____________________________________________________________________"
  echo "Input:      | [str] [prefix]                                        "
  echo "____________________________________________________________________"
  echo "Output:     | str less prefix                                       "
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

lx_string_strip_prefix()
{
  echo ${INPUT_01#"$INPUT_02"}
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
lx_string_strip_prefix

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
