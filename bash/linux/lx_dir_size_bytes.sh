#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_dir_size_bytes.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:  Get dir size in bytes
#
# Input:        Dir Path
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

lx_dir_size_bytes()
{
  # Not portable but much faster for large files, reads file size from OS status 
  stat -c %s $LX_FILE_PATH

  # Portable but opens file to read/count bytes
  #wc -c <$LX_FILE_PATH
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

check_dependencies
lx_dir_size_bytes

