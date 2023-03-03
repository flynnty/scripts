#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     html_url_list.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:| Extract http* url links from html file
#             | 
#
# Input:      | <HTML_FILE>
# Output:     | "URL_LIST"
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

HTML_FILE="$INPUT_01"
HTML_URL_DELIM="http"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

print_help()
{
  echo "Help!                                                               "
  echo "____________________________________________________________________"
  echo "Description:| Extract & List HTML URLS in HTML File                 "
  echo "            |                                                       "
  echo "            |                                                       "
  echo "____________________________________________________________________"
  echo "Usage:      | ./html_url_list.sh html.html                          " 
  echo "____________________________________________________________________"
  echo "Input:      | <HTML_FILE>                                           "
  echo "____________________________________________________________________"
  echo "Output:     | <URL_LIST>                                            "
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

  if ! command -v sed &> /dev/null
  then
    echo "echo could not be found"
    exit
  fi

#  if [ ! -f file.txt ]; then
#    echo "file.txt  could not be found"
#    exit
#  fi
}

html_url_list()
{
  #grep "$HTML_URL_DELIM" <<<$(sed -n 's/.*href="\([^"]*\).*/\1/p' $HTML_FILE)

  # grep -E : is the same as egrep
  # grep -o : only outputs what has been grepped
  # (http|https) : is an either / or
  # a-z : is all lower case
  # A-Z : is all upper case
  # . : is dot
  # / : is the slash
  # ? : is ?
  # = : is equal sign
  # _ : is underscore
  # % : is percentage sign
  # : : is colon
  # - : is dash
  # *: is repeat the [...] group
  # sort -u : will sort & remove any duplicates

  #grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" "$HTML_FILE" | sort -u
  grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" "$HTML_FILE"
}

################################################################################
#  APPLICATION                                                                 #
################################################################################

# Entry Point >

check_dependencies
html_url_list

# Print Output if Set
if [ ! -z "$OUTPUT" ]
  then
    echo "$OUTPUT"
fi
