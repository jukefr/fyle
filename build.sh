#!/usr/bin/env bash

current_dir=$(pwd)
unset GIT_DIR
LATEST_TAG=$(git describe --tags --abbrev=0)
CURRENT_REVISION=$(git describe)
NUMBER_FILES_CHANGED=$(git diff --name-only HEAD ${LATEST_TAG} | wc -l)
# List of files changed since last tagged release (new docker images)
CHANGES=($(git diff --name-only HEAD ${LATEST_TAG}))
echo "Changes since last git tag :"
printf '%s\n' "${CHANGES[@]}"

# if no argument is specified it builds images that have changed since
# the last git tag
# an argument allows to build a specific service directly for dev
# $ ./build.sh foptimize/image/png

function dotdotdot {
  mypid=$!
  loadingText=$1

  echo -ne "$loadingText\r"

  while kill -0 $mypid 2>/dev/null; do
    echo -ne "$loadingText.\r"
    sleep 0.5
    echo -ne "$loadingText..\r"
    sleep 0.5
    echo -ne "$loadingText...\r"
    sleep 0.5
    echo -ne "\r\033[K"
    echo -ne "$loadingText\r"
    sleep 0.5
  done

  echo "$loadingText...Build done."
}

function build {
    cd "${current_dir}/$1"
    printf "\n$1 \n"
    docker build --cache-from "$1:latest" -t $1 . > /dev/null & dotdotdot "Building"
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

    if [[ "$1" = "all" ]]; then
        SERVICES=("fconvert" "foptimize" "futils")
        for a in ${SERVICES[@]}; do
            cd "${current_dir}/$a"
            for b in */ ; do
                # Allow to ignore specific folders
                if [ -f "${b}.ignore" ]; then
                    continue
                fi
                build "$a/${b%?}"
                cd "${current_dir}/$a"
            done
            cd ..
        done
        exit 0
    fi

    build $1
    exit 0
fi

SERVICES=("fconvert" "foptimize" "futils")
for a in ${SERVICES[@]}; do
    cd "${current_dir}/$a"
    for b in */ ; do
        # Allow to ignore specific folders
        if [ -f "${b}.ignore" ]; then
            continue
        fi
        for c in "${CHANGES[@]}"; do
            # Build if the file is in the list and continue to next tool
            if [[ ${c} = *"$a/${b%?}"* ]]; then
                build "$a/${b%?}"
                cd "${current_dir}/$a"
                break
            fi
        done
    done
    cd ..
done


echo "Build script done."