#!/usr/bin/env bash

# $1=STRING="SERVICE/NAME"
# $2=STRING="VERSION"
# $3=STRING="CONTEXT"
build_docker() {
    docker build -t "$1:$2" "$3"
}