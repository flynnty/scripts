#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_pdf_merge.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:  Merge all pdf's @ location to all.pdf
#
# Input:        path/to/pdfs
# Output:       all.pdf
#
###############################################################################


################################################################################
#  VARIABLES                                                                   #
################################################################################
LX_FILE_PATH="$1"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!"
  echo "Description: Merge all pdf's @ loc to all.pdf"
  echo "Usage:       Supply filepath to pdf dir to merge" 
  echo "Input:       [path/to/pdfs/]"
  echo "Output:      [path/to/pdfs/all.pdf]"
}

check_dependencies()
{
  if [ "$1" == "--help" ]
    then
      print_help
      exit
  fi

  # use current dir if no path supplied
  if [ -z "$LX_FILE_PATH" ]
    then
      print_help
      exit
  fi

  if ! command -v pdfunite &> /dev/null
  then
    echo "pdfmerge could not be found"
    exit
  fi
}

lx_pdf_merge()
{
  pdfunite $LX_FILE_PATH/*.pdf $LX_FILE_PATH/all.pdf
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

check_dependencies $1
lx_pdf_merge

