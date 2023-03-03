#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_file_list.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Print file list to the console
#             | 
#
# Input:      | "path/to/file"
# Output:     | "file list"
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
  echo "Description:| Print the contents of a file line by line to the      "
  echo "            | console                                               "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | ./lx_file_list "path/to/file"                         " 
  echo "____________________________________________________________________"
  echo "Input:      | [path_to/file]                                        "
  echo "____________________________________________________________________"
  echo "Output:     | file list to console                                  "
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

  if ! command -v echo &> /dev/null
  then
    echo "echo could not be found"
    exit
  fi
}

lx_file_list()
{
  while read line; do
    echo "$line"
  done <$INPUT_01
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
lx_file_list

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
