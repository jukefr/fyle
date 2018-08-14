#!/usr/bin/env bash
set -e
while IFS=, read -r col1 col2 col3
do
    cd ${col1}
    ./test.sh
    cd ..
    cd ${col2}
    ./test.sh
    cd ..
    cd ${col3}
    ./test.sh
    cd ..
done <<< "fconvert,foptimize,futils"

./futils/cli/fcli --version