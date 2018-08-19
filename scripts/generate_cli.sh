#!/usr/bin/env bash

# $1=STRING="a b c ..."
# $2=STRING="v1.0.4-alpha3"
generate_cli() {
    TMP_OUTPUT_PATH="futils/cli/cli.sh"
    echo "#!/bin/sh
set -e
    # show help message if no argument is passed
    if [ -z \"\$1\" ]; then
        echo \"--help to see available tools\"
        exit 1
    fi

    # update check
    VERSION=\"$2\"
    REMOTE_VERSIONS=\$(curl -s -S \"https://registry.hub.docker.com/v2/repositories/futils/cli/tags/\" | jq -r '.\"results\"[][\"name\"]')
    if [ \"\$( echo \"\$REMOTE_VERSIONS\" | sed -n 1p )\" = \"latest\" ]; then
        REMOTE_VERSION=\"\$( echo \"\$REMOTE_VERSIONS\" | sed -n 2p )\"
    else
        REMOTE_VERSION=\"\$( echo \"\$REMOTE_VERSIONS\" | sed -n 1p )\"
    fi
    if [ \"\$REMOTE_VERSION\" != \"\$VERSION\" ]; then
        echo \"New release detected CLI please run\"
        echo \"docker pull futils/cli\"
    fi

    # --version
    if [ \"\$1\" = \"--version\" ]; then
        echo \"$2\"
    fi
    " > "$TMP_OUTPUT_PATH"

    # --help
    echo "
    if [ \"\$1\" = \"--help\" ]; then
    " >> "$TMP_OUTPUT_PATH"
    for TMP_SERVICE in $1; do
        TMP_SERVICE_NAME=${TMP_SERVICE:1}
        TMP_FIRST_LETTER=$(echo "$TMP_SERVICE_NAME" | cut -c1-1)
        TMP_ALIASES_SERVICE=$(echo "$TMP_FIRST_LETTER , $TMP_SERVICE_NAME, $TMP_SERVICE" | awk '{print toupper($0)}')
        echo "
        echo
        echo \"\"$TMP_ALIASES_SERVICE\":\"
        " >> "$TMP_OUTPUT_PATH"
        for TMP_TOOL in "${TMP_SERVICE}"/*/; do
            TMP_TOOL_NAME=$(basename "$TMP_TOOL")
            # shellcheck source=/dev/null
            . "$TMP_SERVICE/$TMP_TOOL_NAME/spec.cfg"
            echo "
            echo \"> $TMP_TOOL_NAME ( ${SPEC_ARGS[*]} )\"
            " >> "$TMP_OUTPUT_PATH"
        done
    done
    echo "
    echo
    echo \"For more help, see https://jukefr.github.io/fyle/guide/\"
    fi
    " >> "$TMP_OUTPUT_PATH"

    # Services
    for TMP_SERVICE in $1; do
        TMP_SERVICE_NAME=${TMP_SERVICE:1}
        TMP_FIRST_LETTER=$(echo "$TMP_SERVICE_NAME" | cut -c1-1)
        echo "
        if [ \"\$1\" = \"$TMP_FIRST_LETTER\" ] || [ \"\$1\" = \"$TMP_SERVICE_NAME\" ] || [ \"\$1\" = \"$TMP_SERVICE\" ]; then
        " >> "$TMP_OUTPUT_PATH"
        for TMP_TOOL in "${TMP_SERVICE}"/*/; do
            TMP_TOOL_NAME=$(basename "$TMP_TOOL")
            echo "
            if [ \"\$2\" = \"$TMP_TOOL_NAME\" ]; then
                shift 2
                docker run --rm --volumes-from \"\$(hostname)\" \"$TMP_SERVICE/$TMP_TOOL_NAME:$2\" \"\$@\"
                exit 0
            fi
            " >> "$TMP_OUTPUT_PATH"
        done
        echo "
        fi
        " >> "$TMP_OUTPUT_PATH"
    done

    # Clean up trailing spaces and blank lines
    sed -i 's/^[ \t]*//;s/[ \t]*$//' "$TMP_OUTPUT_PATH"
    sed -i '/^$/d' "$TMP_OUTPUT_PATH"
}
