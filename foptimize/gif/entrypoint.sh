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

colors="128"
if [ "$3" ]; then
    colors="$3"
fi

orig_size=$(wc -c < "$in")

gifsicle -O3 --lossy="$quality" "$in" -o "$in" -k "$colors" > /dev/null

new_size=$(wc -c < "$in")

printf "%s is now \033[32;7m%s%%\e[0m of its original size.\n" "$in" "$((100*new_size/orig_size))"