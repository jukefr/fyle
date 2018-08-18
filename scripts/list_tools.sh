#!/usr/bin/env bash

# $1=STRING="a b c ..."
# RET=STRING="a/1 a/2 b/1 ..."
list_tools() {
    unset TMP_TOOLS

    # Create array of all tool directories
    for TMP_SERVICE in $1; do
        for TMP_TOOL in "${TMP_SERVICE}"/*/; do
            TMP_TOOLS+=("$TMP_TOOL")
        done
    done

    echo "${TMP_TOOLS[@]}"
}
