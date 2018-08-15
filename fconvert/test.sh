#!/bin/sh
set -e
mkdir -p tmp
cd tmp
while IFS="," read -r col1 col2 col3 col4; do
    echo "Testing service $col1 format $col2 to $col3 with url $(echo "$col4" | cut -c 1-40)..."
    # Conversions can take some time
    timeout 60 docker run -v $(pwd):/d/ fconvert/${col1} "$col4" tmp.${col3}
done < ../test.csv
cd ..
rm -rf tmp/