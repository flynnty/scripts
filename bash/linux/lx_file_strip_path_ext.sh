#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_file_strip_path_ext.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:  Strip file path & extension from filepath string
#
# Input:        path/to/filename.ext
# Output:       filename
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
      echo "Input: ./lx_file_strip_path_ext.sh path/to/file.ext"
      echo "Output: file"
     exit
  fi
}

lx_file_strip_path_ext()
{
  # strip path
  LX_FILEPATH=${LX_FILEPATH##*/}
  # strip ext
  LX_FILEPATH=${LX_FILEPATH%.*}
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

check_dependencies
lx_file_strip_path_ext

# Output
echo "$LX_FILEPATH"
