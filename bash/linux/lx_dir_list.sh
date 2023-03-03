#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_dir_list.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Print dir list of files
#             | 
#
# Input:      | "path/to/dir"
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

LX_DIR_PATH="$INPUT_01"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Print the contents of dir line by line to the         "
  echo "            | console                                               "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | ./lx_dir_list "path/to/dir"                           " 
  echo "____________________________________________________________________"
  echo "Input:      | [path_to/dir]                                         "
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

  if ! command -v print &> /dev/null
  then
    echo "print could not be found"
    exit
  fi
}

lx_dir_list()
{
    #find $LX_DIR_PATH/*  -printf "%f\n"
    ls -1 $LX_DIR_PATH
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
lx_dir_list

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
