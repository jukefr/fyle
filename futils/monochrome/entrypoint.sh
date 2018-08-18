#!/bin/sh
set -e
if echo "$1" | grep -Eq '^(http|https)://'; then
    in=$(wget -nv "$1" 2>&1 |cut -d\" -f2 | sed -e "s/?.*//g")
    wget -q -O "$in" "$1"
else
    in=$1
fi

color="Gray"
if [ "$2" ]; then
    color="$2"
fi

mogrify -colorspace "$color" "$in" > /dev/null

printf "%s is now monochrome \033[32;7m%s\e[0m\n" "$in" "$color"