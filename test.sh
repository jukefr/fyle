#!/usr/bin/env bash
set -eo pipefail
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
. scripts/test_docker.sh
. scripts/test_cli.sh
. scripts/test_lint.sh
. scripts/list_changed.sh
. scripts/list_tools.sh

init() {

    SERVICES="fhub futils fconvert foptimize"
    TOOLS="$(list_tools "$SERVICES")"
    CHANGED="$(list_changed "$TOOLS")"

    # Always lint build and test
    echo "Linting build.sh"
    docker run --rm -w="/d/" -v "$PWD:/d/" koalaman/shellcheck-alpine /bin/shellcheck -x -f gcc build.sh
    echo "Linting test.sh"
    docker run --rm -w="/d/" -v "$PWD:/d/" koalaman/shellcheck-alpine /bin/shellcheck -x -f gcc test.sh

    # Always test lint scripts
    echo "Linting scripts..."
    mapfile -t TMP_SCRIPTS < <(find "$PWD/scripts/" -name "*.sh" -print)
    for TMP_SCRIPT in "${TMP_SCRIPTS[@]}"; do
        TMP_REL_PATH="$(printf '%s\n' "${TMP_SCRIPT//$PWD/}" | cut -c2- )"
        echo "Linting $TMP_REL_PATH"
        docker run --rm -w="/d/" -v "$PWD:/d/" koalaman/shellcheck-alpine /bin/shellcheck -f gcc -x "$TMP_REL_PATH"
    done

}
init

test_all() {
    echo "Testing all tools..."
    for TOOL in $TOOLS; do
        echo "Testing ${TOOL::-1}..."
        # shellcheck source=/dev/null
        . "$TOOL"spec.cfg
        test_lint "${TOOL::-1}"
        echo "Docker testing ${TOOL::-1}..."
        test_docker "${TOOL::-1}" "$TAG" # SPEC IMPLIED
        echo "CLI testing ${TOOL::-1}..."
        test_cli "${TOOL::-1}" "$TAG" # SPEC IMPLIED
    done
}

test_changed() {
    echo "Testing changed tools..."
    for TOOL in $CHANGED; do
        echo "Testing changed ${TOOL::-1}..."
        # shellcheck source=/dev/null
        . "$TOOL"spec.cfg
        test_lint "${TOOL::-1}"
        echo "Docker testing ${TOOL::-1}..."
        test_docker "${TOOL::-1}" "$TAG" # SPEC IMPLIED
        echo "CLI testing ${TOOL::-1}..."
        test_cli "${TOOL::-1}" "$TAG" # SPEC IMPLIED
    done
}

test_specific() {
    echo "Testing $1..."
    # shellcheck source=/dev/null
    . "$1/spec.cfg"
    test_lint "$1"
    echo "Docker testing $1..."
    test_docker "$1" "$TAG" # SPEC IMPLIED
    echo "CLI testing $1..."
    test_cli "$1" "$TAG" # SPEC IMPLIED
}


# INVOCATION ARGUMENT PROCESSING
if [ "$1" ]; then
    if [ "$1" = "all" ]; then
        test_all
    elif [ "$1" = "lint" ]; then
        if [ "$2" ]; then
            test_lint "$2"
        else
            test_lint
        fi
    else
        # ASSUME SPECIFIC IMAGE OTHERWISE
        echo "Testing $1..."
        test_specific "$1"
    fi
    exit 0
fi

# FLOW LOGIC
if [ "$BRANCH" = "master" ]; then
    if [ "$LOCAL" -eq 1 ]; then
        test_changed
    else
        test_all
        gren release
    fi
fi

if [ "$BRANCH" = "release" ]; then
    TAG="v$(basename "$BRANCH")"
    if [ "$LOCAL" -eq 1 ]; then
        test_changed
    else
        test_changed
    fi
fi

if [ "$BRANCH" = "hotfix" ]; then
    if [ "$LOCAL" -eq 1 ]; then
        test_changed
    else
        test_changed
    fi
fi

if [ "$BRANCH" = "develop" ]; then
    if [ "$LOCAL" -eq 1 ]; then
        test_changed
    else
        test_changed
    fi
fi

if [ "$BRANCH" = "feature" ]; then
    if [ "$LOCAL" -eq 1 ]; then
        test_changed
    else
        test_changed
    fi
fi
