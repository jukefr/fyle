#!/usr/bin/env bash
set -e
START_DIR=$(pwd)
SERVICES=("fconvert" "foptimize" "futils")

function testfn {
    for a in ${SERVICES[@]}; do
        # Loop folders in service (formats)
        cd "$START_DIR/$a"
        for b in */ ; do
            # Allow to ignore specific folders
            if [ -f "$START_DIR/$a/$b/.ignore" ]; then
                continue
            fi
            # Test a specific image or all
            if [ -n "$SPECIFIC" ]; then
                if [[ "$SPECIFIC" = *"$a/${b%?}"* ]]; then
                    $1 ${a} ${b}
                    exit 0
                fi
            else
                $1 ${a} ${b}
            fi
        done
        cd "$START_DIR"
    done
}

function dockerrun {
    cd "$START_DIR/$1/$2"
    SPEC=($(head -n 1 .spec))
    mkdir tmp_test
    cd tmp_test
    echo "Testing $1/${2%?}"
    timeout 30 docker run -v $(pwd):/d/ "$1/${2%?}" "${SPEC[@]}"
    cd ..
    rm -rf tmp_test
    cd "$START_DIR"
}

function clirun {
    cd "$START_DIR/$1/$2"
    SPEC=($(head -n 1 .spec))
    mkdir tmp_test
    cd tmp_test
    echo "Testing $1/${2%?}"
    timeout 30 docker run -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/d/ futils/cli "$1" "${2%?}" "${SPEC[@]}"
    cd ..
    rm -rf tmp_test
    cd "$START_DIR"
}

if [ -n "$1" ]; then
    # CLI testing should only be done against new tagged versions (new master merge)
    if [[ "$1" == "cli" ]]; then
        echo "Testing CLI..."
        testfn clirun
        exit 0
    fi
    SPECIFIC="$1"
fi

testfn dockerrun

if [[ "$TRAVIS_BRANCH" = "master" ]]; then
    echo "Testing CLI..."
    testfn clirun
    exit 0
fi

echo "Test script done."
