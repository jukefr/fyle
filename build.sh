#!/usr/bin/env bash
current_dir=$(pwd)

LATEST_TAG=$(git describe --tags --abbrev=0)
CURRENT_REVISION=$(git describe)
NUMBER_FILES_CHANGED=$(git diff --name-only HEAD ${LATEST_TAG} | wc -l)
# List of files changed since last tagged release (new docker images)
CHANGES=($(git diff --name-only HEAD ${LATEST_TAG}))

# if no argument is specified it builds images that have changed since
# the last git tag
# an argument allows to build a specific service directly for dev
# $ ./build.sh foptimize/image/png

function build() {
    cd ${current_dir}/$1
    docker build -t $1 .
}

if [ -n "$1" ]; then
    build $1
    exit 0
fi

SERVICES=("fconvert" "foptimize" "futils")
for a in ${SERVICES[@]}; do
    cd "$a"
    for b in */ ; do
        # Allow to ignore specific folders
        if [ -f "$b/.ignore" ]; then
            continue
        fi
        # Loop over file changes since last tagged version
        for c in "${CHANGES[@]}"; do
            # Build if the file is in the list and continue to next tool
            if [[ ${c} = *"$a/${b%?}"* ]]; then
                build "$a/${b%?}"
                continue 2
            fi
        done
    done
    cd ..
done


echo "Build script done."