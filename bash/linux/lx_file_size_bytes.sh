#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_file_size_bytes.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:  Get file size in bytes, returns zero if file doesn't exist
#               or is 0 bytes in size
#
# Input:        File Path
# Output:       Size in bytes
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
  if ! command -v stat &> /dev/null
  then
    echo "stat could not be found"
    exit
  fi
}

lx_file_size_bytes()
{
  # Report file size zero if no file
  if [ ! -f $LX_FILE_PATH ]; then
    echo "0"
    exit
  fi

  # Not portable but much faster for large files, reads file size from OS status 
  stat -c %s $LX_FILE_PATH 2>/dev/null

  # Portable but opens file to read/count bytes
  #wc -c <$LX_FILE_PATH
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

check_dependencies
lx_file_size_bytes

