#!/bin/bash

################################################################################
#  Header                                                                      #
################################################################################
# Filename:     lx_hdd_create_virtual.sh
# Author:       tflynn
# Date:         20221223
# Copyright:    Tony Flynn
#
# Description:  Create a virtual HDD for mounting
#
# Input:        Mb Size, Path
# Output:       Virtual HDD
#
###############################################################################


################################################################################
#  VARIABLES                                                                   #
################################################################################
LX_VHDD_SIZE="$1"
LX_FILE_PATH="$2"

################################################################################
#  FUNCTIONS                                                                   #
################################################################################

check_dependencies()
{
  if [ "$1" == "--help" ]
    then
      echo "Help!"
      echo "Description: Create a Virtual EXT4 HDD of Size at Location"
      echo "Usage: Supply a VHDD size and path/filename.ext" 
      echo "Input: [VHDD Size Mb] [path/filename.ext]"
      echo "Output: EXT4 VHDD of Size @ path"
      exit
  fi

  if ! command -v dd &> /dev/null
  then
    echo "dd could not be found"
    exit
  fi

  if [ -z "$LX_VHDD_SIZE" ]
    then
      echo " Please enter a Virtual HDD size in Mb "
      exit
  fi

  if [ -z "$LX_FILE_PATH" ]
    then
      echo " Please enter a file/path/and/filename.ext "
      exit
  fi
}

lx_hdd_create_virtual()
{
  sudo dd if=/dev/zero of="$LX_FILE_PATH" bs=1M count="$LX_VHDD_SIZE"
  sudo mkfs -t ext4 "$LX_FILE_PATH"
  sudo chown $(whoami) "$LX_FILE_PATH"
  mkdir vhdd.mount 
  sudo mount -t auto -o loop "$LX_FILE_PATH" vhdd.mount
  sudo chown $(whoami) "vhdd.mount"

}

################################################################################
#  APPLICATION                                                                 #
################################################################################

check_dependencies $1
lx_hdd_create_virtual

