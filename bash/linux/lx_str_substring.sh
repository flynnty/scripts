#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_string_substring.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Return substring between 2 delimiters
#
# Input:        Delim 1, Delim 2
# Output:       Substring bewteen Delim1 & Delim 2
#
###############################################################################


################################################################################
#  VARIABLES                                                                   #
################################################################################
LX_STRING="$1"
LX_DELIM_01="$2"
LX_DELIM_02="$3"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

check_dependencies()
{
  if ! command -v awk &> /dev/null
  then
    echo "awk could not be found"
    exit
  fi

  # Validate Passed Parameter
  if [ "$1" == "--help" ] || [ "$LX_STRING" == "" ] || [ "$LX_DELIM_01" == "" ] || [ "$LX_DELIM_02" == "" ]; then
    echo "Help!"
    echo "Usage: Supply string and 2 x delimiters that bookend substring"
    echo "Input: ./lx_string_substring.sh \"string_to-substring\" \"_\" \"-\""
    echo "Output: to"
    exit
  fi
}


lx_string_substring()
{
  awk '{ sub(/.*'$LX_DELIM_01'/, ""); sub(/'$LX_DELIM_02'.*/, ""); print }' <<< "$LX_STRING"
}

################################################################################
#  APPLICATION                                                                 #
################################################################################


check_dependencies
lx_string_substring



