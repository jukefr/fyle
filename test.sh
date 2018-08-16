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
    CHANGES=($(git diff --name-only HEAD ${LATEST_TAG}))
    echo "Changes: (since last git tag)"
    printf '%s\n' "${CHANGES[@]}"
    echo

    for SERVICE_NAME in ${SERVICES[@]}; do
        for TOOL in ${SERVICE_NAME}/*/; do
            TOOLS+=("$TOOL")
        done
    done
    echo "Tools:"
    printf '%s\n' "${TOOLS[@]}"
    echo

    SPACE_SEPARATED=" ${CHANGES[*]} "
    for TOOL in ${TOOLS[@]}; do
      if [[ "$SPACE_SEPARATED" = *"$TOOL"* ]] ; then
        DIFFS+=("$TOOL")
      fi
    done
    echo "Intersection:"
    echo  ${DIFFS[@]}
    echo
}
diff_calc

test_diffs() {
    for TOOL in ${DIFFS[@]}; do
        SERVICE_NAME=$(basename `dirname ${TOOL}`)
        TOOL_NAME=$(basename "$TOOL")
        SPEC=($(head -n 1 "$START_DIR/$SERVICE_NAME/$TOOL_NAME/.spec"))

        # Main
        if [[ "$1" == "" ]] || [[ "$1" == "docker" ]]; then
            echo "Testing diffed $SERVICE_NAME/$TOOL_NAME:$VERSION"
            docker run -v /tmp/:/d/ "$SERVICE_NAME/$TOOL_NAME:$VERSION" "${SPEC[@]}"
        fi
    done
}

test_all() {
    for TOOL in ${TOOLS[@]}; do
        SERVICE_NAME=$(basename `dirname ${TOOL}`)
        TOOL_NAME=$(basename "$TOOL")
        SPEC=($(head -n 1 "$START_DIR/$SERVICE_NAME/$TOOL_NAME/.spec"))
        # CLI ?
        if [[ "$1" == "cli" ]]; then
            echo "CLI Testing $SERVICE_NAME/$TOOL_NAME:$VERSION"
            docker run -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/:/d/ "futils/cli:$VERSION" "$SERVICE_NAME" "$TOOL_NAME" "${SPEC[@]}"
            continue
        fi
        echo "Testing $SERVICE_NAME/$TOOL_NAME:$VERSION"
        docker run -v /tmp/:/d/ "$SERVICE_NAME/$TOOL_NAME:$VERSION" "${SPEC[@]}"
    done
}

# Arguments
if [ -n "$1" ]; then
    # CLI
    if [[ "$1" == "cli" ]]; then
        echo "Testing CLI..."
        test_all "cli"
        exit 0
    fi

    # Force all ?
    if [[ "$1" == "all" ]]; then
        echo "Testing all"
        test_all
        exit 0
    fi

    # Otherwise, assume specific image
    for TOOL in ${TOOLS[@]}; do
        SERVICE_NAME=$(basename `dirname ${TOOL}`)
        TOOL_NAME=$(basename "$TOOL")
        SPEC=($(head -n 1 "$START_DIR/$SERVICE_NAME/$TOOL_NAME/.spec"))
        if [[ "$TOOL" =~ "$1" ]]; then
            echo "Specific Testing $SERVICE_NAME/$TOOL_NAME:$VERSION"
            docker run -v /tmp/:/d/ "$SERVICE_NAME/$TOOL_NAME:$VERSION" "${SPEC[@]}"
            exit 0
        fi
    done
fi

# New Release
if [ -n "$CURRENTLY_TAGGING" ] ; then
    echo "New Release detected."
    test_all
    test_all "cli"
    exit 0
fi

# Main
test_diffs

echo "Test script done."
