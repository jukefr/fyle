#!/usr/bin/env bash

# $1=STRING="SERVICE/NAME"
# $2=STRING="VERSION"
# $3=STRING="CONTEXT"
build_docker() {
    docker build --cache-from "$1" -t "$1:$2" "$3"
}