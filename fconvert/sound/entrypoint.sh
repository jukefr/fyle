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

mpg123 -q -w "$out" "$in" > /dev/null

new_size=$(wc -c < "$out")

printf "$in ($orig_size) is now \033[32;7m$out ($new_size)\e[0m.\n"
