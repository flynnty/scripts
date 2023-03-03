#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_ip_shell_get.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Fetch IP Address local shell is using
#             | 
#
# Input:      | NONE
# Output:     | Shell IP ADDRESS
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

IP_ADDRESS=""
declare -n IP_ADDRESS=OUTPUT

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Fetch Shell IP Address                                "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | lx_ip_shell_get                                       " 
  echo "____________________________________________________________________"
  echo "Input:      | NONE                                                  "
  echo "____________________________________________________________________"
  echo "Output:     | Shell IP ADDRESS                                      "
  echo "____________________________________________________________________"
}

check_dependencies()
{
  if [ "$INPUT_01" == "--help" ]
    then
      print_help
      exit
  fi

#  if [ -z "$INPUT_01" ] || [ -z "$INPUT_02" ]
#    then
#      print_help
#      exit
#  fi

  if ! command -v wget &> /dev/null
  then
    echo "wget could not be found"
    exit
  fi
}

lx_ip_isp_get()
{
  IP_ADDRESS="$(wget -qO - https://api.ipify.org)" 2>/dev/null
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
lx_ip_isp_get

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
