#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_hdd_file_zerofill.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:  Create an expanding zero filled file
#
# Input:        File Path
# Output:       None
#
###############################################################################


################################################################################
#  VARIABLES                                                                   #
################################################################################
LX_FILE_PATH="$1"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

check_dependencies()
{
  if ! command -v cat &> /dev/null
  then
    echo "cat could not be found"
    exit
  fi

  # use current dir if no path supplied
  if [ -z "$LX_FILE_PATH" ]
    then
      LX_FILE_PATH="."
  fi
  if [ "$1" == "--help" ]
    then
      echo "Help!"
      echo "Description: Gen zero fill xpanding file to wipe unused hdd space"
      echo "             zero_fill.bin will be removed upon completion"
      echo "Usage: Supply a path for zero file generation" 
      echo "Input: filepath or none for current directory"
      echo "Output: None"
      exit
  fi

}

lx_hdd_file_zerofill()
{
  cat /dev/zero > $LX_FILE_PATH/zero_fill.bin 2>/dev/null
  rm $LX_FILE_PATH/zero_fill.bin 2>/dev/null
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

check_dependencies $1
lx_hdd_file_zerofill

