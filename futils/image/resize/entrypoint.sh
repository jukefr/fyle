#!/bin/sh

if echo "$1" | grep -Eq '^(http|https)://'; then
    in=$(wget -nv "$1" 2>&1 |cut -d\" -f2 | sed -e "s/?.*//g")
    wget -q -O "$in" "$1"
    out=$2
else
    in=$1
    out=$2
fi

orig_size=$(wc -c < "$in")

convert $in -resize ${size} $in > /dev/null

new_size=$(wc -c < "$in")

echo -e "$in is now \033[32;7m$((100*$new_size/$orig_size))%\e[0m of its original size.";