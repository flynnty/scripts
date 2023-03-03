#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_location_get.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Fetch world facing IP Address Location
#             | 
#
# Input:      | <IP_ADDRESS>
# Output:     | LOCATION
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

IP_ADDRESS="$INPUT_01"
IP_LOCATION=""
declare -n IP_LOCATION=OUTPUT

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Fetch External IP Address Location                    "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | lx_location_get                                       " 
  echo "____________________________________________________________________"
  echo "Input:      | <IP_ADDRESS>                                          "
  echo "____________________________________________________________________"
  echo "Output:     | LOCATION                                              "
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

  if ! command geoiplookup --help &> /dev/null
  then
      echo "geoip could not be found"
      echo "install using: sudo apt install geoip-bin"
      exit
  fi

}

lx_location_get()
{
  IP_LOCATION=$(geoiplookup $IP_ADDRESS) 2>/dev/null
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
lx_location_get

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
