#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_shell_torify_off.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Torify inactive for all shell commands
#             | 
#
# Input:      | None
# Output:     | None
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

# Pointer to OUTPUT
#declare -n SOME_VAR=OUTPUT
#SOME_VAR="$INPUT_01"

BASHRC_FILE="$HOME/.bashrc"
TORSOCKS_ON=". torsocks on"
TORSOCKS_OFF=". torsocks off"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Disable torify for all shell commands                  "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | lx_shell_torfy_off                                     " 
  echo "____________________________________________________________________"
  echo "Input:      | None                                                  "
  echo "____________________________________________________________________"
  echo "Output:     | None                                                  "
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

  if ! command -v echo &> /dev/null
  then
    echo "echo could not be found"
    exit
  fi

  if ! command -v exec &> /dev/null
  then
    echo "exec could not be found"
    exit
  fi

  if ! command -v sed &> /dev/null
  then
    echo "sed could not be found"
    exit
  fi

  if [ ! -f $BASHRC_FILE ]; then
    echo "$BASHRC_FILE  could not be found"
    exit
  fi
}

lx_shell_torify_off()
{

  # remove any existing torsock commands form bashrc
  sed -ie "/$TORSOCKS_ON/d" "$BASHRC_FILE" 2>/dev/null
  sed -ie "/$TORSOCKS_OFF/d" "$BASHRC_FILE" 2>/dev/null

  # append source torsocks on to bashrc
  echo "$TORSOCKS_OFF" >>"$BASHRC_FILE" 2>/dev/null
  # reload bashrc to current shell
  exec bash
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
lx_shell_torify_off

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
