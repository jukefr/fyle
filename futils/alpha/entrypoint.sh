#!/bin/sh

if echo "$1" | grep -Eq '^(http|https)://'; then
    in=$(wget -nv "$1" 2>&1 |cut -d\" -f2 | sed -e "s/?.*//g")
    wget -q -O "$in" "$1"
else
    in=$1
fi

color="White"
if [[ -n "$2" ]]; then
    color="$2"
fi

fuzzy="10%"
if [[ -n "$3" ]]; then
    fuzzy="$3"
fi

orig_size=$(wc -c < "$in")

convert "$in" -fuzz "$fuzzy" -transparent "$color" "$in" > /dev/null

new_size=$(wc -c < "$in")

printf "background removed from \033[32;7m$in\e[0m\n";