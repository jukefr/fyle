#!/usr/bin/env bash

# $1=STRING="a b c..."
travis_generate_hub() {
    npm i puppeteer
    for TMP_TOOL in $1; do
        TMP_TOOL_DIR=$(dirname "$TMP_TOOL")
        TMP_SERVICE_NAME=$(basename "$TMP_TOOL_DIR")
        TMP_TOOL_NAME=$(basename "$TMP_TOOL")
        TMP_REMOTE_RESPONSE=$(curl -o -I -L -s -w "%{http_code}" "https://registry.hub.docker.com/v2/repositories/$TMP_SERVICE_NAME/$TMP_TOOL_NAME/")
        if [ "$TMP_REMOTE_RESPONSE" -eq 404 ]; then
            echo "Creating Repo $TMP_SERVICE_NAME/$TMP_TOOL_NAME"
            if [ "$TMP_SERVICE_NAME" = "fhub" ]; then
                x="\$x" envsubst < scripts/create-repo-fhub.js 
            else
                x="\$x" envsubst < scripts/create-repo.js | node
            fi
            echo "Docker Hub Repository created"
        fi
    done
}