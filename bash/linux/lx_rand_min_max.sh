#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_rand_min_max.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
# Description:  Return random number between min & max
#
# Input:        None
# Output:       Random num from min to max
#
###############################################################################


################################################################################
#  VARIABLES                                                                   #
################################################################################

# Module Inputs/Outputs
INPUT_01="$1"
INPUT_02="$2"
INPUT_03="$3"
INPUT_04="$4"
OUTPUT=""

LX_RAND_MIN="$INPUT_01"
LX_RAND_MAX="$INPUT_02"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

check_dependencies()
{
  if ! command -v shuf &> /dev/null
  then
    echo "shuf could not be found"
    exit
  fi
 
  # Validate Passed Parameter
  if [ "$1" == "--help" ] || [ "$LX_RAND_MIN" == "" ] || [ "$LX_RAND_MAX" == "" ]; then
    echo "help!"
    echo "Description: Generate random number between min & max"
    echo "usage: Supply min Max bounds for random number output"
    echo "./lx_rand_min_max.sh 0 255 "
    exit
  fi
}


lx_rand_min_max()
{
  OUTPUT=$(shuf -i $LX_RAND_MIN-$LX_RAND_MAX -n 1)
}

################################################################################
#  APPLICATION                                                                 #
################################################################################


check_dependencies $1
lx_rand_min_max

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi


