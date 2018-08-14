#!/usr/bin/env bash
current_dir=$(pwd)

LATEST_TAG=$(git describe --tags --abbrev=0)
CURRENT_REVISION=$(git describe)
NUMBER_FILES_CHANGED=$(git diff --name-only HEAD ${LATEST_TAG} | wc -l)
# List of files changed since last tagged release (new docker images)
CHANGES=($(git diff --name-only HEAD ${LATEST_TAG}))

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
    # if no argument is specified it builds images that have changed since
    # the last git tag
    # an argument allows to build a specific service directly for dev
    # $ ./build.sh foptimize/image/png
    if [ -z "$1" ]; then
        for i in "${CHANGES[@]}"; do
            if [[ ${i} = *"$col1"* ]]; then
                build
            fi
        done
    else
        if [[ ${col1} = *"$1"* ]]; then
            build
        fi
    fi

done < services.csv