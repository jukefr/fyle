#!/usr/bin/env bash
set -e
START_DIR=$(pwd)
SERVICES=("fconvert" "foptimize" "futils")

CURRENTLY_TAGGING=$(git name-rev --name-only --tags --no-undefined HEAD 2>/dev/null | sed -n 's/^\([^^~]\{1,\}\)\(\^0\)\{0,1\}$/\1/p')
if [ -n "$CURRENTLY_TAGGING" ]; then
    VERSION="$CURRENTLY_TAGGING"
else
    VERSION="latest"
fi

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
diff_calc

test_runner() {
    for SERVICE in ${SERVICES[@]}; do
        for TOOL in ${SERVICE}/*/; do

            TOOL_NAME=$(basename "$TOOL")

            # Ignored ?
            if [ -f "$START_DIR/$SERVICE/$TOOL_NAME/.ignore" ]; then
                continue
            fi

            SPEC=($(head -n 1 "$START_DIR/$SERVICE/$TOOL_NAME/.spec"))

            # Specific ?
            if [ -n "$SPECIFIC" ]; then
                if [[ "$SPECIFIC" = *"$SERVICE/$TOOL_NAME"* ]]; then
                    echo "Specific Testing $SERVICE/$TOOL_NAME:$VERSION"
                    docker run -v /tmp/:/d/ "$SERVICE/$TOOL_NAME:$VERSION" "${SPEC[@]}"
                    exit 0
                fi
            fi

            # CLI ?
            if [[ "$1" == "cli" ]]; then
                echo "CLI Testing $SERVICE/$TOOL_NAME:$VERSION"
                docker run -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/:/d/ "futils/cli:$VERSION" "$SERVICE" "$TOOL_NAME" "${SPEC[@]}"
            fi

            # TRAVIS ?
            if [ -n "$TRAVIS_BRANCH" ]; then
                echo "Travis Detected, only testing changed/new tools to save cycles."
                for CHANGE in "${CHANGES[@]}"; do
                    # Test if the file is in the list
                    if [[ ${CHANGE} = *"$SERVICE/$TOOL_NAME"* ]]; then
                        echo "Testing $SERVICE/$TOOL_NAME:$VERSION"
                        docker run -v /tmp/:/d/ "$SERVICE/$TOOL_NAME:$VERSION" "${SPEC[@]}"
                    fi
                done
            fi

            # Main
            if [[ "$1" == "" ]] || [[ "$1" == "docker" ]]; then
                echo "Testing $SERVICE/$TOOL_NAME:$VERSION"
                docker run -v /tmp/:/d/ "$SERVICE/$TOOL_NAME:$VERSION" "${SPEC[@]}"
            fi
        done
    done
}

# Arguments
if [ -n "$1" ]; then
    # CLI
    if [[ "$1" == "cli" ]]; then
        echo "Testing CLI..."
        test_runner "cli"
        exit 0
    fi
    # Otherwise, assume specific image
    SPECIFIC="$1"
fi

# Main
test_runner

# CLI test if new tag (new release)
if [ -n "$CURRENTLY_TAGGING" ] ; then
    echo "Testing CLI..."
    test_runner "cli"
fi

echo "Test script done."