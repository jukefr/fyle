#!/usr/bin/env bash

# CONFIG
START_DIR=$(pwd)
SERVICES=("fconvert" "foptimize" "futils")

# CHECK IF CURRENT COMMIT IS A TAG
CURRENTLY_TAGGING=$(git name-rev --name-only --tags --no-undefined HEAD 2>/dev/null | sed -n 's/^\([^^~]\{1,\}\)\(\^0\)\{0,1\}$/\1/p')
if [ -n "$CURRENTLY_TAGGING" ]; then
    VERSION="$CURRENTLY_TAGGING"
else
    VERSION="latest"
fi

# DOCKER BUILD
build() {
    docker build --cache-from "$1:latest" -t "$1:$VERSION" "$2"
}

# DOCKER BUILD ALL
force_build_all() {
    for SERVICE in ${SERVICES[@]}; do
        for TOOL in ${SERVICE}/*/; do
            TOOL_NAME=$(basename "$TOOL")
            # Allow to ignore specific folders
            if [ -f "${TOOL}.ignore" ]; then
                continue
            fi
            build "$SERVICE/$TOOL_NAME" "$START_DIR/$TOOL"
        done
    done
    exit 0
}


# FORCE BUILD ALL IF NEW TAG
new_tag_force_all() {
    if [[ -n "$CURRENTLY_TAGGING" ]]; then
        force_build_all
    fi
}

diff_calc() {
    unset GIT_DIR
    LATEST_TAG=$(git describe --tags --abbrev=0)
    CURRENT_REVISION=$(git describe)
    NUMBER_FILES_CHANGED=$(git diff --name-only HEAD ${LATEST_TAG} | wc -l)
    # List of files changed since last tagged release (new docker images)
    CHANGES=($(git diff --name-only HEAD ${LATEST_TAG}))
    echo "Changes since last git tag :"
    printf '%s\n' "${CHANGES[@]}"
}

diff_build() {
    for SERVICE in ${SERVICES[@]}; do
        for TOOL in ${SERVICE}/*/; do
            TOOL_NAME=$(basename "$TOOL")
            # Allow to ignore specific folders
            if [ -f "${TOOL}.ignore" ]; then
                continue
            fi
            for CHANGE in "${CHANGES[@]}"; do
                # Build if the file is in the list and continue to next tool
                if [[ ${CHANGE} = *"$SERVICE/$TOOL_NAME"* ]]; then
                    build "$SERVICE/$TOOL_NAME" "$START_DIR/$TOOL"
                    break
                fi
            done
        done
    done
}

# Very ugly but does the job for now...
cli_generate() {
    echo "Generating CLI..."
    echo "#!/bin/sh" > "$1"

    # show help message if no argument is passed
    echo "if [ -z \"\$1\" ]; then" >> "$1"
    echo "echo \"--help to see available tools\"" >> "$1"
    echo "exit 1" >> "$1"
    echo "fi" >> "$1"

    # Bump CLI version if needed
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
    echo "echo \"CLI is outdated, please run docker pull futils/cli to update.\"" >> "$1"
    echo "fi" >> "$1"

    # --version
    echo "if [ \$1 = \"--version\" ]; then" >> "$1"
    echo "echo \"$CLI_VERSION\"" >> "$1"
    echo "fi" >> "$1"

    # --help
    echo "if [ \$1 = \"--help\" ]; then" >> "$1"
    for SERVICE in ${SERVICES[@]}; do
        SERVICE_NAME=${SERVICE:1}
        FIRST_LETTER=$(echo "$SERVICE_NAME" | cut -c1-1)
        echo "echo \"\"" >> "$1"
        echo "echo \"$FIRST_LETTER, $SERVICE_NAME, $SERVICE:\"" >> "$1"
        for TOOL in ${SERVICE}/*/; do
            TOOL_NAME=$(basename "$TOOL")
            if [ -f "${TOOL}.ignore" ]; then
                continue
            fi
            echo "echo \">$TOOL_NAME\"" >> "$1"
        done
    done
    echo "echo \"\"" >> "$1"
    echo "echo \"For more help, see https://jukefr.github.io/fyle/guide/\"" >> "$1"
    echo "fi" >> "$1"

    # Services
    for SERVICE in ${SERVICES[@]}; do
        SERVICE_NAME=${SERVICE:1}
        FIRST_LETTER=$(echo "$SERVICE_NAME" | cut -c1-1)
        echo "if [ \$1 = \"$FIRST_LETTER\" ] || [ \$1 = \"$SERVICE_NAME\" ] || [ \$1 = \"$SERVICE\" ]; then" >> "$1"
        for TOOL in ${SERVICE}/*/; do
            TOOL_NAME=$(basename "$TOOL")
            if [ -f "${TOOL}.ignore" ]; then
                continue
            fi
            echo "if [ \$2 = \"$TOOL_NAME\" ]; then" >> "$1"
            echo "echo \"$TOOL\"" >> "$1"
            echo "shift 2" >> "$1"
            echo "docker run --volumes-from \"\$(hostname)\" \"$SERVICE/$TOOL_NAME:$CLI_VERSION\" \"\$@\"" >> "$1"
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
        for SERVICE in ${SERVICES[@]}; do
            for TOOL in ${SERVICE}/*/; do
                TOOL_NAME=$(basename "$TOOL")
                # Allow to ignore specific folders
                if [ -f "${TOOL}.ignore" ]; then
                    continue
                fi
                docker pull "$SERVICE/$TOOL_NAME:latest"
            done
        done
    fi

    # FORCE ALL
    if [[ "$1" = "all" ]]; then
        force_build_all
    fi

    # BUILD SPECIFIC
    build $1
    exit 0
fi

diff_calc
cli_generate "futils/cli/cli.sh"
new_tag_force_all
diff_build

echo "Build script done."