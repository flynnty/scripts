#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_dir_compare_tree.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:  Compare 2 directory trees for differences in file structure &
#               file content.
#               
#
# Input:        Dir1, Dir2
# Output:       Diff delta
#
###############################################################################


################################################################################
#  VARIABLES                                                                   #
################################################################################
LX_DIR1="$1"
LX_DIR2="$2"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!"
  echo "Description: Compare 2 files or trees for differences in layout and"
  echo "             file content.  Diff physically compares file content  "
  echo "             for differences                                       "
  echo "Usage:       Supply 2 file/paths for comparison" 
  echo "Input:       [PATH1] [PATH2]"
  echo "Output:      Diff Delta between 2 paths or files"
}

check_dependencies()
{
  if ! command -v diff &> /dev/null
  then
    echo "diff could not be found"
    exit
  fi

  # use current dir if no path supplied
  if [ -z "$LX_DIR1" ] || [ -z "$LX_DIR2" ]
    then
      print_help
      exit
  fi

  if [ "$1" == "--help" ]
    then
      print_help
      exit
  fi

}

lx_dir_compare_tree()
{
  diff --brief --recursive "$LX_DIR1" "$LX_DIR2"
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

check_dependencies $1
lx_dir_compare_tree

