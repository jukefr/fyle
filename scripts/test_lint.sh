#!/usr/bin/env bash

# $1=STRING="SERVICE/NAME"
test_lint() {
    mapfile -t TMP_SCRIPTS < <(find "$PWD/$1" -name "*.sh" -print)
    for TMP_SCRIPT in "${TMP_SCRIPTS[@]}"; do
        TMP_REL_PATH="$(printf '%s\n' "${TMP_SCRIPT//$PWD/}" | cut -c2- )"
        echo "Linting $TMP_REL_PATH"
        docker run --rm -w="/d/" -v "$PWD:/d/" koalaman/shellcheck-alpine /bin/shellcheck -f gcc -x "$TMP_REL_PATH"
    done
    mapfile -t TMP_SCRIPTS < <(find "$PWD/$1" -name "Dockerfile" -print)
    for TMP_SCRIPT in "${TMP_SCRIPTS[@]}"; do
        TMP_REL_PATH="$(printf '%s\n' "${TMP_SCRIPT//$PWD/}" | cut -c2- )"
        echo "Linting $TMP_REL_PATH"
        docker run --rm -i hadolint/hadolint < "$TMP_REL_PATH"
    done
}