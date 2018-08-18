#!/usr/bin/env bash

# $1=STRING="SERVICE/NAME"
# $2=STRING="VERSION"
test_docker() {
    docker run --rm -v "$(mktemp -d):/d/" "$1:$2" "${SPEC_TEST[@]}"
}