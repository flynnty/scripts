#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_ip_isp_get.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Fetch world facing ISP  IP Address
#             | 
#
# Input:      | NONE
# Output:     | ISP IP ADDRESS
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
  echo "Description:| Fetch External ISP IP Address                         "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | lx_ip_isp_get                                         " 
  echo "____________________________________________________________________"
  echo "Input:      | NONE                                                  "
  echo "____________________________________________________________________"
  echo "Output:     | ISP IP ADDRESS                                        "
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
  # torsocks off is valid for duration of THIS script only
  . torsocks off &>/dev/null
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
