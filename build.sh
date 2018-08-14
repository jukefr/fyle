#!/usr/bin/env bash
current_dir=$(pwd)

function dockbuild() {
    docker build -t ${col2} .
}

function build() {
    echo "Service $col1 Format $col2"
    cd ${current_dir}/${col1}
    dockbuild
}

while IFS=, read -r col1 col2
do
    # the check allows to build a specific service directly for dev
    # $ ./build.sh foptimize/image/png
    if [ -z "$1" ]; then
        build
    else
        if [[ ${col1} = *"$1"* ]]; then
            build
        fi
    fi

done < services.csv