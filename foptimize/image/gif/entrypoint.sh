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

if [ -z "$colors" ]; then
    gifsicle -O3 --lossy=80 "$in" -o "$in" > /dev/null
else
    gifsicle -O3 --lossy=80 "$in" -o "$in" -k "$colors" > /dev/null
fi

new_size=$(wc -c < "$in")

printf "$in is now \033[32;7m$((100*$new_size/$orig_size))%\e[0m of its original size.";