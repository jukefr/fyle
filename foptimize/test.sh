#!/bin/sh
mkdir -p tmp
cd tmp
while IFS="," read -r col1 col2 col3; do
    echo "Testing service $col1 format $col2 with url $(echo "$col3" | cut -c 1-40)..."
    docker run -v $(pwd):/d/ foptimize/${col2} "$col3"
done < ../test.csv
cd ..
rm -rf tmp/