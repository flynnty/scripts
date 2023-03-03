#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_file_strip_path.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:  Strip file path from filepath string
#
# Input:        File path string
# Output:       filename.ext 
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
      echo "Output: file.ext"
     exit
  fi
}

lx_file_strip_path()
{
  echo ${LX_FILEPATH##*/}
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

check_dependencies
lx_file_strip_path

