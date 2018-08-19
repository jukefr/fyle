#!/usr/bin/env bash
################################################################################
# GIT FLOW BASED STRUCTURE
BRANCH="$(git rev-parse --abbrev-ref HEAD | sed 's/\/.*//')"
# CURRENT VERSION
TAG="$(git describe --abbrev=0 --tags)"
################################################################################
# LOCAL OR TRAVIS
LOCAL=1
if [ "$TRAVIS_BRANCH" ]; then LOCAL=0; fi
################################################################################

# IMPORT FUNCTIONS
. scripts/build_docker.sh
. scripts/generate_cli.sh
. scripts/generate_docs.sh
. scripts/list_changed.sh
. scripts/list_tools.sh
. scripts/travis_generate_hub.sh
. scripts/travis_helper.sh

init() {
    SERVICES="fhub futils fconvert foptimize"
    TOOLS="$(list_tools "$SERVICES")"
    CHANGED="$(list_changed "$TOOLS")"
}
init

generate_all() {
    echo "Generating CLI..."
    generate_cli "$SERVICES" "$TAG"
    echo "Generating Documentation..."
    generate_docs "$SERVICES"
}
generate_all

build_all() {
    echo "Building all tools..."
    for TOOL in $TOOLS; do
        echo "Building ${TOOL::-1}..."
        build_docker "${TOOL::-1}" "$TAG" "$PWD/$TOOL"
    done
}

build_changed() {
    echo "Building changed tools..."
    for TOOL in $CHANGED; do
        echo "Building changed ${TOOL::-1}..."
        build_docker "${TOOL::-1}" "$TAG" "$PWD/$TOOL"
    done
}

# INVOCATION ARGUMENT PROCESSING
if [ "$1" ]; then
    if [ "$1" = "all" ]; then
        build_all

    else
        # ASSUME SPECIFIC IMAGE OTHERWISE
        echo "Building $1..."
        build_docker "${1}" "$TAG" "$PWD/$1"
    fi
    exit 0
fi

# FLOW LOGIC
if [ "$BRANCH" = "master" ]; then
    if [ "$LOCAL" -eq 1 ]; then
       build_changed
    else
        echo "Building Vuepress documentation..."
        vuepress build docs
        build_all
    fi
fi

if [ "$BRANCH" = "release" ]; then
    TAG="v$(basename "$BRANCH")"
    generate_all
    if [ "$LOCAL" -eq 1 ]; then
        build_changed
    else
        build_changed
        travis_generate_hub "$CHANGED"
        # Push new tagged images to fhub
        FHUB_TOOLS="$(list_tools fhub)"
        FHUB_CHANGED="$(list_changed "$FHUB_TOOLS")"
        for TOOL in $FHUB_CHANGED; do
            echo "Pushing ${TOOL::-1}..."
            echo "$HUB_PW" | docker login -u futils --password-stdin
            docker push "${TOOL::-1}:$TAG"
        done
    fi
fi

if [ "$BRANCH" = "hotfix" ]; then
    if [ "$LOCAL" -eq 1 ]; then
        build_changed
    else
        build_changed
    fi
fi

if [ "$BRANCH" = "develop" ]; then
    if [ "$LOCAL" -eq 1 ]; then
        build_changed
    else
        build_changed
    fi
fi

if [ "$BRANCH" = "feature" ]; then
    if [ "$LOCAL" -eq 1 ]; then
        build_changed
    else
        build_changed
    fi
fi
