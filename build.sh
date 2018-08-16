#!/usr/bin/env bash

current_dir=$(pwd)

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

travis_master_force() {
    if [[ "$TRAVIS_BRANCH" = "master" ]]; then
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
}

git_changes() {
    unset GIT_DIR
    LATEST_TAG=$(git describe --tags --abbrev=0)
    CURRENT_REVISION=$(git describe)
    NUMBER_FILES_CHANGED=$(git diff --name-only HEAD ${LATEST_TAG} | wc -l)
    # List of files changed since last tagged release (new docker images)
    CHANGES=($(git diff --name-only HEAD ${LATEST_TAG}))
    echo "Changes since last git tag :"
    printf '%s\n' "${CHANGES[@]}"
}

docker_build() {
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
}

cli_generate() {
    # Bump CLI version if needed
    echo "#!/bin/sh" > "$1"
    VERSION=$(git describe --abbrev=0 --tags)
    echo "VERSION=\"$VERSION\"" >> "$1"

    # --version
    echo "if [ \$1 = \"--version\" ]; then" >> "$1"
    echo "echo \"$VERSION\"" >> "$1"
    echo "fi" >> "$1"

    # --help
    echo "if [ \$1 = \"--help\" ]; then" >> "$1"
    SERVICES=("fconvert" "foptimize" "futils")
    for a in ${SERVICES[@]}; do
        SERVICE_NAME=${a:1}
        FIRST_LETTER=$(echo "$SERVICE_NAME" | cut -c1-1)
        echo "echo \"\"" >> "$1"
        echo "echo \"$FIRST_LETTER, $SERVICE_NAME, $a:\"" >> "$1"
        for b in ${a}/*/; do
            FORMAT_NAME=$(basename "$b")
            if [ -f "${b}.ignore" ]; then
                continue
            fi
            echo "echo \">$FORMAT_NAME\"" >> "$1"
        done
    done
    echo "echo \"\"" >> "$1"
    echo "echo \"For more help, see https://jukefr.github.io/fyle/guide/\"" >> "$1"
    echo "fi" >> "$1"

    # Services
    SERVICES=("fconvert" "foptimize" "futils")
    for a in ${SERVICES[@]}; do
        SERVICE_NAME=${a:1}
        FIRST_LETTER=$(echo "$SERVICE_NAME" | cut -c1-1)
        echo "if [ \$1 = \"$FIRST_LETTER\" ] || [ \$1 = \"$SERVICE_NAME\" ] || [ \$1 = \"$a\" ]; then" >> "$1"
        for b in ${a}/*/; do
            FORMAT_NAME=$(basename "$b")
            if [ -f "${b}.ignore" ]; then
                continue
            fi
            echo "if [ \$2 = \"$FORMAT_NAME\" ]; then" >> "$1"
            echo "echo \"$b\"" >> "$1"
            echo "shift 2" >> "$1"
            echo "docker run --volumes-from \"\$(hostname)\" \"$a/$FORMAT_NAME:$VERSION\" \"\$@\"" >> "$1"
            echo "exit 0" >> "$1"
            echo "fi" >> "$1"
        done
        echo "fi" >> "$1"
    done
}

travis_master_force
git_changes
cli_generate futils/cli/cli.sh
docker_build

echo "Build script done."