#!/usr/bin/env bash

# CONFIG
CURRENT_DIR=$(pwd)
SERVICES=("fconvert" "foptimize" "futils")

# CHECK IF CURRENT COMMIT IS A TAG
CURRENTLY_TAGGING=$(git name-rev --name-only --tags --no-undefined HEAD 2>/dev/null | sed -n 's/^\([^^~]\{1,\}\)\(\^0\)\{0,1\}$/\1/p')
if [ -n "$CURRENTLY_TAGGING" ]; then
    VERSION="$CURRENTLY_TAGGING"
else
    VERSION="latest"
fi

# DOCKER BUILD
function build {
    cd "${CURRENT_DIR}/$1"
    printf "\n$1 \n"
    docker build --cache-from "$1:latest" -t "$1:$VERSION" .
}

# DOCKER BUILD ALL
function build_all {
    for a in ${SERVICES[@]}; do
        cd "${CURRENT_DIR}/$a"
        for b in */ ; do
            # Allow to ignore specific folders
            if [ -f "${b}.ignore" ]; then
                continue
            fi
            build "$a/${b%?}"
            cd "${CURRENT_DIR}/$a"
        done
        cd ..
    done
    exit 0
}


# FORCE BUILD ALL IF ON TRAVIS AND ON MASTER
travis_master_force() {
    if [[ "$TRAVIS_BRANCH" = "master" ]]; then
        build_all
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
    for a in ${SERVICES[@]}; do
        cd "${CURRENT_DIR}/$a"
        for b in */ ; do
            # Allow to ignore specific folders
            if [ -f "${b}.ignore" ]; then
                continue
            fi
            for c in "${CHANGES[@]}"; do
                # Build if the file is in the list and continue to next tool
                if [[ ${c} = *"$a/${b%?}"* ]]; then
                    build "$a/${b%?}"
                    cd "${CURRENT_DIR}/$a"
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
    CLI_VERSION=$(git describe --abbrev=0 --tags)

    # update check
    echo "VERSION=\"$CLI_VERSION\"" >> "$1"
    echo "REMOTE_VERSIONS=\$(curl -s -S \"https://registry.hub.docker.com/v2/repositories/futils/cli/tags/\" | jq -r '.\"results\"[][\"name\"]')" >> "$1"
    echo "if [[ \"\$( echo \"\$REMOTE_VERSIONS\" | sed -n 1p )\" == \"latest\" ]]; then" >> "$1"
    echo "REMOTE_VERSION=\"\$( echo \"\$REMOTE_VERSIONS\" | sed -n 2p )\"" >> "$1"
    echo "else" >> "$1"
    echo "REMOTE_VERSION=\"\$( echo \"\$REMOTE_VERSIONS\" | sed -n 1p )\"" >> "$1"
    echo "fi" >> "$1"
    echo "if [[ \"\$REMOTE_VERSION\" != \"\$VERSION\" ]]; then" >> "$1"
    echo "echo \"CLI is outdated, please run docker pull futils/cli then try again.\"" >> "$1"
    echo "exit 1" >> "$1"
    echo "fi" >> "$1"

    # --version
    echo "if [ \$1 = \"--version\" ]; then" >> "$1"
    echo "echo \"$CLI_VERSION\"" >> "$1"
    echo "fi" >> "$1"

    # --help
    echo "if [ \$1 = \"--help\" ]; then" >> "$1"
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
            echo "docker run --volumes-from \"\$(hostname)\" \"$a/$FORMAT_NAME:$CLI_VERSION\" \"\$@\"" >> "$1"
            echo "exit 0" >> "$1"
            echo "fi" >> "$1"
        done
        echo "fi" >> "$1"
    done
}


# OVERRIDES
if [ -n "$1" ]; then

    # TAVIS HELPER
    if [[ "$1" = "travis" ]]; then
        if [[ "$TRAVIS_BRANCH" = "master" ]]; then
            npx vuepress build docs
        fi
        for a in ${SERVICES[@]}; do
            cd "${CURRENT_DIR}/$a"
            for b in */ ; do
                if [ -f "$b/.ignore" ]; then
                    continue
                fi
                docker pull "$a/${b%?}:latest"
            done
            cd ..
        done
    fi

    # FORCE ALL
    if [[ "$1" = "all" ]]; then
        build_all
    fi

    # BUILD SPECIFIC
    build $1
    exit 0
fi

travis_master_force
git_changes
cli_generate futils/cli/cli.sh
docker_build

echo "Build script done."