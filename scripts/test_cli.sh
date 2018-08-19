#!/usr/bin/env bash

# $1=STRING="SERVICE/NAME"
# $2=STRING="VERSION"
test_cli() {
    TMP_TOOL_DIR=$(dirname "$1")
    TMP_SERVICE_NAME=$(basename "$TMP_TOOL_DIR")
    TMP_TOOL_NAME=$(basename "$1")
    docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$(mktemp -d):/d/" "futils/cli:$2" "$TMP_SERVICE_NAME" "$TMP_TOOL_NAME" "${SPEC_TEST[@]}"
}