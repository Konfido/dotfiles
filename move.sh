#!/bin/bash
# author: Konfido

# 1. Enter the path of this script
# 2. `./move.sh path/to/file/`

set -e 2>&1

if  [ -z "$1" ]
then
    echo "The input is empty."; exit 1;
elif [ $# != 1 ]
then
    echo "Only one file at a time."; exit 1;
fi

realPath=$(realpath "$*")
dirPath=$(echo "${realPath}" | sed 's/dhh/dhh\/Documents\/Sync\/dotfiles/')

printf "%-16s %s\n" "Source path: " "$*"   # Add double quote to avoid the influence of space
printf "%-16s %s\n" "Absolute path: " "${realPath}"

mv "$*" "$dirPath"
ln -s "$dirPath" "$*"

printf "%-16s %s\n" "Be linked to: " "${dirPath}"

echo -e "\nDone.\n"
