#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_shell_torify_status.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Check Shell Session is Torified
#             | 
#
# Input:      | NONE
# Output:     | 0 - Shell Torify Inactive, 1 - Shell Torify Active
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

IP_ADDR_TOR=""
IP_ADDR_ISP=""

#SOME_VAR=""
#declare -n SOME_VAR=OUTPUT

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Check Shell Troify Staus                              "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | lx_shell_torify_status                                " 
  echo "____________________________________________________________________"
  echo "Input:      | NONE                                                  "
  echo "____________________________________________________________________"
  echo "Output:     | 0 - torify inactive, 1 - torify active                "
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

  if ! command -v wget &> /dev/null; then
    echo "wget could not be found"
    exit
  fi
  if ! command -v torify &> /dev/null; then
    echo "torify could not be found"
    exit
  fi

  if ! command -v lx_ip_isp_get &> /dev/null; then
    echo "lx_ip_isp_get could not be found"
    exit
  fi

  if ! command -v lx_ip_tor_get &> /dev/null; then
    echo "lx_ip_tor_get could not be found"
    exit
  fi

  if ! command -v lx_ip_qualify &> /dev/null; then
    echo "lx_ip_qualify could not be found"
    exit
  fi
}

lx_shell_torify_status()
{
  IP_ADDR_ISP="$(lx_ip_isp_get)" 2>/dev/null
  IP_ADDR_TOR="$(wget -qO - https://api.ipify.org)" 2>/dev/null

  # chack isp ip addr valid
  if [ "$(lx_ip_qualify "$IP_ADDR_ISP")" == "0" ]; then
    OUTPUT="0"
    return
  fi

  # chack tor ip addr valid
  if [ "$(lx_ip_qualify "$IP_ADDR_TOR")" == "0" ]; then
    OUTPUT="0"
    return
  fi

  # if ip's dont match torify is active
  if [ "$IP_ADDR_ISP" != "$IP_ADDR_TOR" ]; then
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
lx_shell_torify_status

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
