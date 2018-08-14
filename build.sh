#!/usr/bin/env bash
# I use Git Releases with semantic versioning
current_version=$(git describe --exact-match --tags $(git log -n1 --pretty='%h'))
current_dir=$(pwd)

function dockbuild() {
    docker build -t ${col2}:${current_version} .
    docker tag ${col2}:${current_version} ${col2}:latest
}


function build() {
    echo "Service $col1 Format $col2"
    cd ${current_dir}/${col1}
    dockbuild
}

while IFS=, read -r col1 col2
do
    # the check allows to build a specific service directly for dev
    if [ -z "$1" ]; then
        build
    else
        if [[ ${col1} = *"$1"* ]]; then
            build
        fi
    fi

done < list.csv