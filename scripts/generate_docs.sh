#!/usr/bin/env bash

# $1=STRINGS="a b c ..."
generate_docs() {
    unset TMP_TOOLS
    for TMP_SERVICE in $1; do
        for TMP_TOOL in "${TMP_SERVICE}"/*/; do
            TMP_TOOLS+=("$TMP_TOOL")
        done
        echo "# $TMP_SERVICE" > "docs/guide/$TMP_SERVICE.md"
    done
    for TMP_TOOL in "${TMP_TOOLS[@]}"; do
        TMP_TOOL_DIR=$(dirname "$TMP_TOOL")
        TMP_SERVICE_NAME=$(basename "$TMP_TOOL_DIR")
        TMP_TOOL_NAME=$(basename "$TMP_TOOL")
        # shellcheck source=/dev/null
        . "$TMP_SERVICE_NAME/$TMP_TOOL_NAME/spec.cfg"
        TMP_SHORTENED_ARGS=()
        for TMP_ARGUMENT in "${SPEC_TEST[@]}"; do
            TMP_SHORTENED_ARG=$(echo "$TMP_ARGUMENT" | awk -v len=25 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }')
            TMP_SHORTENED_ARGS+=("$TMP_SHORTENED_ARG")
        done
        TMP_INDEX=0
        TMP_FINAL_ARGS=()
        for TMP_ARGUMENT_NAME in "${SPEC_ARGS[@]}"; do
            TMP_FINAL_ARGS+=("\`${TMP_SHORTENED_ARGS[$TMP_INDEX]}\`→\`\$$TMP_ARGUMENT_NAME\`")
            TMP_INDEX=$((TMP_INDEX + 1))
        done

        # Then simply append every tool
        echo "
        ## :whale: $TMP_TOOL_NAME
        " >> "docs/guide/$TMP_SERVICE_NAME.md"

        # If it has a tagline, display it
        if [ -n "$SPEC_DESC" ]; then
            echo "
            $SPEC_DESC
            " >> "docs/guide/$TMP_SERVICE_NAME.md"
        fi

        # Usage
        echo "
        \`\`\`bash
        docker run --rm -v \$PWD:/d/ $TMP_SERVICE_NAME/$TMP_TOOL_NAME \$${SPEC_ARGS[0]} $([[ ${SPEC_ARGS[1]} == "output" ]] && echo \$"${SPEC_ARGS[1]}")
        docker run --rm -v \$PWD:/d/ $TMP_SERVICE_NAME/$TMP_TOOL_NAME ${TMP_SHORTENED_ARGS[*]}
        \`\`\`
        " >> "docs/guide/$TMP_SERVICE_NAME.md"

        # Instructions
        TMP_ARG_INDEX=1
        for TMP_ARGUMENT in "${TMP_FINAL_ARGS[@]}"; do
            echo "
            $TMP_ARG_INDEX. $TMP_ARGUMENT
            " >> "docs/guide/$TMP_SERVICE_NAME.md"
            TMP_ARG_INDEX=$((TMP_ARG_INDEX + 1))
        done

        # Clean up trailing spaces and blank lines
        sed -i 's/^[ \t]*//;s/[ \t]*$//' "docs/guide/$TMP_SERVICE_NAME.md"
        sed -i '/^$/d' "docs/guide/$TMP_SERVICE_NAME.md"
    done
}