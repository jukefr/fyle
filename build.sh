#!/usr/bin/env bash
current_dir=$(pwd)

# if no argument is specified it builds images that have changed since
# the last git tag
# an argument allows to build a specific service directly for dev
# $ ./build.sh foptimize/image/png

function build {
    cd "${current_dir}/$1"
    docker build --cache-from "$1:latest" -t $1 .
}

if [ -n "$1" ]; then
    # Travis Install
    if [[ "$1" = "travis" ]]; then
        if [[ "$TRAVIS_BRANCH" = "master" ]]; then
            npx vuepress build docs
          fi
          SERVICES=("fconvert" "foptimize" "futils")
          for a in ${SERVICES[@]}; do
            cd "${current_dir}/$a"
            for b in */ ; do
                if [ -f "$b/.ignore" ]; then
                    continue
                fi
                docker pull "$a/${b%?}:latest"
            done
            cd ..
          done
    fi

    build $1
    exit 0
fi

SERVICES=("fconvert" "foptimize" "futils")
for a in ${SERVICES[@]}; do
    cd "${current_dir}/$a"
    for b in */ ; do
        # Allow to ignore specific folders
        if [ -f "$b/.ignore" ]; then
            continue
        fi
        build "$a/${b%?}"
    done
    cd ..
done


echo "Build script done."