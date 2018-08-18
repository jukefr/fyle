#!/bin/sh
set -e
if echo "$1" | grep -Eq '^(http|https)://'; then
    in=$(wget -nv "$1" 2>&1 |cut -d\" -f2 | sed -e "s/?.*//g")
    wget -q -O "$in" "$1"
else
    in=$1
fi

angle="0"
if [ "$2" ]; then
    angle="$2"
fi

convert -rotate "$angle" "$in" "$in"  > /dev/null

printf "%s is now \033[32;7mrotated by %s\e[0m.\n" "$in" "$angle"