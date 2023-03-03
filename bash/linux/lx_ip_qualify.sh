#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_ip_qualify.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Qualify IP address via regex pattern
#             | 
#
# Input:      | <IP_ADDRESS>
# Output:     | 0, 1 : Match Fail, Match Success
#
###############################################################################


################################################################################
#  VARIABLES                                                                   #
################################################################################
INPUT_01="$1"
INPUT_02="$2"
INPUT_03="$3"
INPUT_04="$4"
OUTPUT=""

REGEX=""
IP_ADDRESS="$INPUT_01"
#SOME_VAR=""
#declare -n SOME_VAR=OUTPUT

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Qualify IP Address Pattetn Match                      "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | lx_ip_qualify                                         " 
  echo "____________________________________________________________________"
  echo "Input:      | <IP_ADDRESS>                                          "
  echo "____________________________________________________________________"
  echo "Output:     | 0, 1 : Match Fail, Match Success                      "
  echo "____________________________________________________________________"
}

check_dependencies()
{
  if [ "$INPUT_01" == "--help" ]
    then
      print_help
      exit
  fi

  if [ -z "$INPUT_01" ]
    then
      print_help
      exit
  fi

}

lx_ip_qualify()
{
  REGEX='([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])'
  
  if [[ $IP_ADDRESS =~ ^$REGEX\.$REGEX\.$REGEX\.$REGEX$ ]]; then
    OUTPUT="1"
  else
    OUTPUT="0"
  fi

}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
lx_ip_qualify

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
