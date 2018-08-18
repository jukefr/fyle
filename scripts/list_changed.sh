#!/usr/bin/env bash

# $@=STRING="a/1 a/2 b/1 ..."
# RET=STRING="a/2 ..."
list_changed() {
    unset GIT_DIR TMP_DIFFS

    TMP_LATEST_TAG=$(git describe --tags --abbrev=0)
    TMP_CHANGES=$(git diff --name-only "${TMP_LATEST_TAG}")

    # Create array of all tools that changed
    for TMP_TOOL in $1; do
      if [[ "$TMP_CHANGES" = *"$TMP_TOOL"* ]] ; then
        TMP_DIFFS+=("$TMP_TOOL")
      fi
    done

    echo "${TMP_DIFFS[@]}"
}
