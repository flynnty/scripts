#!/bin/bash
ALL_DIR="all"
THIS_DIR="$PWD"
SH_SCAN_DIR="."

SH_PATHNAME_LIST="$(find "$SH_SCAN_DIR" -name "*.sh")"
SH_FILENAME=""

# Remove broken symlonks in THIS_DIR
find -L $ALL_DIR -name . -o -type d -prune -o -type l -exec rm {} +

for line in $SH_PATHNAME_LIST; do
  # strip path
  SH_FILENAME=${line##*/}
  # strip extension
  SH_FILENAME=${SH_FILENAME%.*}
  #echo $SH_FILENAME
  ln -sf "$line" "$ALL_DIR/$SH_FILENAME" 2>/dev/null
done

