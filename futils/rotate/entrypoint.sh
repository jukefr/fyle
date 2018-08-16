#!/bin/sh

if echo "$1" | grep -Eq '^(http|https)://'; then
    in=$(wget -nv "$1" 2>&1 |cut -d\" -f2 | sed -e "s/?.*//g")
    wget -q -O "$in" "$1"
else
    in=$1
fi

angle="0"
if [[ -n "$2" ]]; then
    angle="$2"
fi

convert -rotate "$angle" $in  $in  > /dev/null

printf "$in is now \033[32;7mrotated by $angle\e[0m.\n";