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