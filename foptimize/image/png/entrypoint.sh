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

pngcrush -ow "$in" > /dev/null

pngquant --ext .png --force 256 "$in" > /dev/null

optipng -o7 -strip all "$in" > /dev/null

advpng -z -4 "$in" > /dev/null

new_size=$(wc -c < "$in")

printf "$in is now \033[32;7m$((100*$new_size/$orig_size))%%\e[0m of its original size.\n";