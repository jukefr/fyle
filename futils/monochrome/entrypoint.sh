#!/bin/sh

if echo "$1" | grep -Eq '^(http|https)://'; then
    in=$(wget -nv "$1" 2>&1 |cut -d\" -f2 | sed -e "s/?.*//g")
    wget -q -O "$in" "$1"
else
    in=$1
fi

color="Gray"
if [[ -n "$2" ]]; then
    color="$2"
fi

orig_size=$(wc -c < "$in")

mogrify -colorspace "$color" "$in" > /dev/null

new_size=$(wc -c < "$in")

printf "$in is now monochromed to \033[32;7m$color\e[0m\n";