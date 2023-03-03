#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_file_strip_ext.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:  Strip file extension from file path string
#
# Input:        File path string
# Output:       /path/filename 
#
###############################################################################


################################################################################
#  VARIABLES                                                                   #
################################################################################
LX_FILEPATH=$1

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

check_dependencies()
{
  if [ "$LX_FILEPATH" == "--help" ] || [ -z "$LX_FILEPATH" ]
    then
      echo "Help!"
      echo "Usage: Supply filepath string" 
      echo "Input: ./lx_file_strip_path.sh path/to/file.ext"
      echo "Output: path/to/file"
     exit
  fi
}

lx_file_strip_ext()
{
  echo ${LX_FILEPATH%.*}
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

check_dependencies
lx_file_strip_ext

