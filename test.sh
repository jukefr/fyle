#!/usr/bin/env bash
set -e
while IFS=, read -r col1
do
    cd ${col1}
    ./test.sh
    cd ..
done <<< "fconvert
foptimize
futils"

./futils/cli/fcli --version

echo "Test script done."