#!/bin/sh
if echo "$1" | grep -Eq '^(http|https)://'; then
    in=$(wget -nv "$1" 2>&1 |cut -d\" -f2 | sed -e "s/?.*//g")
    wget -q -O "$in" "$1"
    out=$2
else
    in=$1
    out=$2
fi

orig_size=$(wc -c < "$in");

convert "$in" "$out" > /dev/null

new_size=$(wc -c < "$out");

printf "%s (%s) is now \033[32;7m%s (%s)\e[0m.\n" "$in" "$orig_size" "$out" "$new_size"
