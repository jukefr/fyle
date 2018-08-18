#!/usr/bin/env bash

# $1=STRING="OUTPUT PATH"
# $2=STRING="VERSION"
# $3+=STRING="a" "b" "c"
generate_hub() {
    vuepress build docs
    # and pull diffs
}