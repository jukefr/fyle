#!/usr/bin/env bash
current_dir=$(pwd)
while IFS=, read -r col1 col2
do
    # the check allows to build a specific service directly for dev
    if [ -z "$1" ]; then
        echo "$col1|$col2"
        cd ${current_dir}/${col1}
        docker build -t ${col2} .
        docker push ${col2}
    else
        if [[ ${col1} = *"$1"* ]]; then
            echo "$col1|$col2"
            cd ${current_dir}/${col1}
            docker build -t ${col2} .
            docker push ${col2}
        fi
    fi

done < list.csv