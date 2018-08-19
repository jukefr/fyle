#!/bin/sh
set -e
if echo "$1" | grep -Eq '^(http|https)://'; then
    in=$(wget -nv "$1" 2>&1 |cut -d\" -f2 | sed -e "s/?.*//g")
    wget -q -O "$in" "$1"
else
    in=$1
fi

quality="85"
if [ "$2" ]; then
    quality="$2"
fi

orig_size=$(wc -c < "$in")

jpegtran -copy none -optimize -outfile "$in" "$in" > /dev/null

jpegoptim -q "$in" > /dev/null

guetzli --quality "$quality" "$in" "$in" > /dev/null

new_size=$(wc -c < "$in")

printf "$in is now \033[32;7m$((100*new_size/orig_size))%%\e[0m of its original size.\n";