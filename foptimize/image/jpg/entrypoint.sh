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

jpegtran -copy none -optimize -outfile "$in" "$in" > /dev/null

jpegoptim "$in" > /dev/null

guetzli --quality 85 "$in" "$in" > /dev/null

new_size=$(wc -c < "$in")

echo "$in is now $((100*$new_size/$orig_size))% of its original size."
