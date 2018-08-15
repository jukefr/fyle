#!/usr/bin/env bash
set -e
START_DIR=$(pwd)
SERVICES=("fconvert" "foptimize" "futils")

if [ -n "$1" ]; then
    SPECIFIC="$1"
    echo "$SPECIFIC"
fi

function testfn {
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
                testfn ${a} ${b}
                exit 0
            fi
        else
            testfn ${a} ${b}
        fi
    done
    cd "$START_DIR"
done
echo "Testing futils/cli"
./futils/cli/cli.sh --version
echo "Test script done."
