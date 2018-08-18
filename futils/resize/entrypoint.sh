#!/bin/sh
set -e
if echo "$1" | grep -Eq '^(http|https)://'; then
    in=$(wget -nv "$1" 2>&1 |cut -d\" -f2 | sed -e "s/?.*//g")
    wget -q -O "$in" "$1"
else
    in=$1
fi

size="100%"
if [ "$2" ]; then
    size="$2"
fi

orig_size=$(wc -c < "$in")

convert "$in" -resize "$size" "$in" > /dev/null

new_size=$(wc -c < "$in")

printf "%s is now \033[32;7m%s%%\e[0m of its original size.\n" "$in" "$((100*new_size/orig_size))"