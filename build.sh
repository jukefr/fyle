#!/usr/bin/env bash

# CONFIG
START_DIR=$(pwd)
SERVICES=("fconvert" "foptimize" "futils")
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
# Bump CLI version if needed
CLI_VERSION=$(git describe --abbrev=0 --tags)

# CHECK IF CURRENT COMMIT IS A TAG
CURRENTLY_TAGGING=$(git name-rev --name-only --tags --no-undefined HEAD 2>/dev/null | sed -n 's/^\([^^~]\{1,\}\)\(\^0\)\{0,1\}$/\1/p')
if [ -n "$CURRENTLY_TAGGING" ]; then
    VERSION="$CURRENTLY_TAGGING"
else
    VERSION="latest"
fi

diff_calc() {
    unset GIT_DIR
    LATEST_TAG=$(git describe --tags --abbrev=0)
    CURRENT_REVISION=$(git describe)
    NUMBER_FILES_CHANGED=$(git diff --name-only HEAD ${LATEST_TAG} | wc -l)
    # List of files changed since last tagged release (new docker images)
    CHANGES=($(git diff --name-only HEAD ${LATEST_TAG}))
    echo "Changes: (since last git tag)"
    printf '%s\n' "${CHANGES[@]}"
    echo

    for SERVICE_NAME in ${SERVICES[@]}; do
        for TOOL in ${SERVICE_NAME}/*/; do
            TOOLS+=("$TOOL")
        done
    done
    echo "Tools:"
    printf '%s\n' "${TOOLS[@]}"
    echo

    SPACE_SEPARATED=" ${CHANGES[*]} "
    for TOOL in ${TOOLS[@]}; do
      if [[ "$SPACE_SEPARATED" = *"$TOOL"* ]] ; then
        DIFFS+=("$TOOL")
      fi
    done
    echo "Intersection:"
    echo  ${DIFFS[@]}
    echo
}
diff_calc

# DOCKER BUILD
build() {
    docker build --cache-from "$1:latest" -t "$1:$VERSION" "$2"
}

build_diffs() {
    for TOOL in ${DIFFS[@]}; do
        SERVICE_NAME=$(basename `dirname ${TOOL}`)
        TOOL_NAME=$(basename "$TOOL")
        SPEC=($(head -n 1 "$START_DIR/$SERVICE_NAME/$TOOL_NAME/.spec"))
        echo "Building diffed $SERVICE_NAME/$TOOL_NAME:$VERSION"
        build "$SERVICE_NAME/$TOOL_NAME" "$START_DIR/$TOOL"
    done
}

pull_diffs() {
    for TOOL in ${DIFFS[@]}; do
        SERVICE_NAME=$(basename `dirname ${TOOL}`)
        TOOL_NAME=$(basename "$TOOL")
        SPEC=($(head -n 1 "$START_DIR/$SERVICE_NAME/$TOOL_NAME/.spec"))
        echo "Pulling latest diffed $SERVICE_NAME/$TOOL_NAME"
        docker pull "$SERVICE_NAME/$TOOL_NAME"
    done
}

build_all() {
    for TOOL in ${TOOLS[@]}; do
        SERVICE_NAME=$(basename `dirname ${TOOL}`)
        TOOL_NAME=$(basename "$TOOL")
        SPEC=($(head -n 1 "$START_DIR/$SERVICE_NAME/$TOOL_NAME/.spec"))
        echo "Building $SERVICE_NAME/$TOOL_NAME:$VERSION"
        build "$SERVICE_NAME/$TOOL_NAME" "$START_DIR/$TOOL"
    done
}

# Very ugly but does the job for now...
cli_generate() {
    echo "Generating CLI..."
    echo "#!/bin/sh" > "$1"

    # show help message if no argument is passed
    echo "if [ -z \"\$1\" ]; then" >> "$1"
    echo "echo \"--help to see available tools\"" >> "$1"
    echo "exit 1" >> "$1"
    echo "fi" >> "$1"

    # update check
    echo "VERSION=\"$CLI_VERSION\"" >> "$1"
    echo "REMOTE_VERSIONS=\$(curl -s -S \"https://registry.hub.docker.com/v2/repositories/futils/cli/tags/\" | jq -r '.\"results\"[][\"name\"]')" >> "$1"
    echo "if [[ \"\$( echo \"\$REMOTE_VERSIONS\" | sed -n 1p )\" == \"latest\" ]]; then" >> "$1"
    echo "REMOTE_VERSION=\"\$( echo \"\$REMOTE_VERSIONS\" | sed -n 2p )\"" >> "$1"
    echo "else" >> "$1"
    echo "REMOTE_VERSION=\"\$( echo \"\$REMOTE_VERSIONS\" | sed -n 1p )\"" >> "$1"
    echo "fi" >> "$1"
    echo "if [[ \"\$REMOTE_VERSION\" != \"\$VERSION\" ]]; then" >> "$1"
    echo "echo \"CLI is outdated, please run docker pull futils/cli to update.\"" >> "$1"
    echo "fi" >> "$1"

    # --version
    echo "if [ \$1 = \"--version\" ]; then" >> "$1"
    echo "echo \"$CLI_VERSION\"" >> "$1"
    echo "fi" >> "$1"

    # --help
    echo "if [ \$1 = \"--help\" ]; then" >> "$1"
    for SERVICE in ${SERVICES[@]}; do
        SERVICE_NAME=${SERVICE:1}
        FIRST_LETTER=$(echo "$SERVICE_NAME" | cut -c1-1)
        echo "echo \"\"" >> "$1"
        echo "echo \"$(echo \"$FIRST_LETTER , $SERVICE_NAME, $SERVICE\" | awk '{print toupper($0)}'):\"" >> "$1"
        for TOOL in ${SERVICE}/*/; do
            TOOL_NAME=$(basename "$TOOL")
            SPEC=($(cat "$START_DIR/$SERVICE/$TOOL_NAME/.spec"| sed -n 2p))
            echo "echo \"> $TOOL_NAME ( ${SPEC[@]} )\"" >> "$1"
        done
    done
    echo "echo \"\"" >> "$1"
    echo "echo \"For more help, see https://jukefr.github.io/fyle/guide/\"" >> "$1"
    echo "fi" >> "$1"

    # Services
    for SERVICE in ${SERVICES[@]}; do
        SERVICE_NAME=${SERVICE:1}
        FIRST_LETTER=$(echo "$SERVICE_NAME" | cut -c1-1)
        echo "if [ \$1 = \"$FIRST_LETTER\" ] || [ \$1 = \"$SERVICE_NAME\" ] || [ \$1 = \"$SERVICE\" ]; then" >> "$1"
        for TOOL in ${SERVICE}/*/; do
            TOOL_NAME=$(basename "$TOOL")
            echo "if [ \$2 = \"$TOOL_NAME\" ]; then" >> "$1"
            echo "echo \"$TOOL\"" >> "$1"
            echo "shift 2" >> "$1"
            echo "docker run --volumes-from \"\$(hostname)\" \"$SERVICE/$TOOL_NAME:$CLI_VERSION\" \"\$@\"" >> "$1"
            echo "exit 0" >> "$1"
            echo "fi" >> "$1"
        done
        echo "fi" >> "$1"
    done
}

docs_generate() {
    echo "Generating Documentation"
    # First line
    for SERVICE in ${SERVICES[@]}; do
         echo "# $SERVICE" > "docs/guide/$SERVICE.md"
    done
    for TOOL in ${TOOLS[@]}; do
        SERVICE_NAME=$(basename `dirname ${TOOL}`)
        TOOL_NAME=$(basename "$TOOL")
        SPEC_1=($(head -n 1 "$START_DIR/$SERVICE_NAME/$TOOL_NAME/.spec"))
        SPEC_2=($(cat "$START_DIR/$SERVICE_NAME/$TOOL_NAME/.spec"| sed -n 2p))
        SPEC_3=$(cat "$START_DIR/$SERVICE_NAME/$TOOL_NAME/.spec"| sed -n 3p)
        SHORTENED_ARGS=()
        for ARGUMENT in ${SPEC_1[@]}; do
            SHORTENED_ARG=$(echo "$ARGUMENT" | awk -v len=25 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }')
            SHORTENED_ARGS+=("$SHORTENED_ARG")
        done
        TMP_INDEX=0
        FINAL_ARGS=()
        for ARGUMENT_NAME in ${SPEC_2[@]}; do
            FINAL_ARGS+=("\`${SHORTENED_ARGS[$TMP_INDEX]}\`→\`$ARGUMENT_NAME\`")
            TMP_INDEX=$((TMP_INDEX + 1))
        done

        # Then simply append every tool
        echo "## :whale: $TOOL_NAME" >> "docs/guide/$SERVICE_NAME.md"

        # If it has a tagline, display it
        if [ -n "$SPEC_3" ]; then
            echo "$SPEC_3" >> "docs/guide/$SERVICE_NAME.md"
        fi

        # Usage
        echo "\`\`\`bash" >> "docs/guide/$SERVICE_NAME.md"
        echo "\$ docker run -v \$(pwd):/d/ $SERVICE_NAME/$TOOL_NAME file.ext" >> "docs/guide/$SERVICE_NAME.md"
        echo "\$ docker run -v \$(pwd):/d/ $SERVICE_NAME/$TOOL_NAME https://...ext" >> "docs/guide/$SERVICE_NAME.md"
        echo "\$ docker run -v \$(pwd):/d/ $SERVICE_NAME/$TOOL_NAME ${SHORTENED_ARGS[@]}" >> "docs/guide/$SERVICE_NAME.md"
        echo "\`\`\`" >> "docs/guide/$SERVICE_NAME.md"

        # Instructions
        echo "**Arguments (in order)**" >> "docs/guide/$SERVICE_NAME.md"
        ARG_INDEX=1
        for ARGUMENT in ${FINAL_ARGS[@]}; do
            echo "$ARG_INDEX. $ARGUMENT" >> "docs/guide/$SERVICE_NAME.md"
            ARG_INDEX=$((ARG_INDEX + 1))
        done
    done
}

create_hub_repos() {
    HUB_USERNAME="futils"
    npm i puppeteer
    for TOOL in ${DIFFS[@]}; do
        SERVICE_NAME=$(basename `dirname ${TOOL}`)
        TOOL_NAME=$(basename "$TOOL")
        SPEC=($(head -n 1 "$START_DIR/$SERVICE_NAME/$TOOL_NAME/.spec"))
        REMOTE_RESPONSE=$(curl -o -I -L -s -w "%{http_code}" "https://registry.hub.docker.com/v2/repositories/$SERVICE_NAME/$TOOL_NAME/")
        if [ "$REMOTE_RESPONSE" -eq 404 ]; then
            echo "Creating Repo $SERVICE_NAME/$TOOL_NAME"
            echo "const puppeteer = require(\"puppeteer\");
(async () => {
    const browser = await puppeteer.launch({args: ['--no-sandbox']});
    const page = await browser.newPage();
    await page.goto(\"https://hub.docker.com/sso/start/\");
    await page.type(\"#nw_username\", \"$HUB_USERNAME\");
    await page.type(\"#nw_password\", \"$HUB_PW\");
    await page.click(\"#nw_submit\");
    await page.waitFor(1000);
    await page.goto(\"https://hub.docker.com/add/automated-build/$SERVICE_NAME/github/orgs/\");
    const search = await page.\$x(\"//*[@id='app']/main/div[3]/div[2]/div/div[2]/div/div/div/form/div/div[1]/input\");
    await Promise.all(search.map(handle => handle.type(\"fyle\")));
    await page.waitFor(1000);
    const result = await page.\$x(\"//*[@id='app']/main/div[3]/div[2]/div/div[2]/div/ul/li/a\");
    await Promise.all(result.map(handle => handle.click()));
    await page.waitFor(1000);
    const tool = await page.\$x(\"//*[@id='app']/main/div[3]/div[2]/div/div/div/form/div[1]/div[1]/div[2]/div[2]/div/input\");
    await Promise.all(tool.map(handle => {
        handle.click({clickCount: 3})
    }));
    await page.waitFor(500);
    await Promise.all(tool.map(handle => {
        handle.type(\"$TOOL_NAME\")
    }));
    await page.waitFor(500);
    const description = await page.\$x(\"//*[@id='app']/main/div[3]/div[2]/div/div/div/form/div[3]/textarea\");
    await Promise.all(description.map(handle => handle.type(\"$SERVICE_NAME/$TOOL_NAME\")));
    await page.waitFor(500);
    const customizeLink = await page.\$x(\"//*[@id='app']/main/div[3]/div[2]/div/div/div/form/label[2]/a\");
    await Promise.all(customizeLink.map(handle => handle.click()));
    const dockerfile1 = await page.\$x(\"//*[@id='app']/main/div[3]/div[2]/div/div/div/form/div[4]/div[2]/div[2]/div[3]/input\");
    await Promise.all(dockerfile1.map(handle => handle.type(\"$SERVICE_NAME/$TOOL_NAME/Dockerfile\")));
    await page.waitFor(500);
    const dockerfile2 = await page.\$x(\"//*[@id='app']/main/div[3]/div[2]/div/div/div/form/div[4]/div[2]/div[3]/div[3]/input\");
    await Promise.all(dockerfile2.map(handle => handle.type(\"$SERVICE_NAME/$TOOL_NAME/Dockerfile\")));
    await page.waitFor(500);
    const typeSelect = await page.\$x(\"//*[@id='app']/main/div[3]/div[2]/div/div/div/form/div[4]/div[2]/div[3]/div[1]/select\");
    await Promise.all(typeSelect.map(handle => handle.click()));
    await page.select(\"#app > main > div:nth-child(3) > div.row > div > div > div > form > div:nth-child(6) > div > div:nth-child(3) > div:nth-child(1) > select\", \"Tag\");
    const submitForm = await page.\$x(\"//*[@id='app']/main/div[3]/div[2]/div/div/div/form/div[5]/div/button\")
    await Promise.all(submitForm.map(handle => handle.click()));
    await page.waitFor(2000)

    await browser.close();
})();" | node
    echo "Docker Hub Repository created"
        fi
    done

}

# Arguments
if [ -n "$1" ]; then

    # TAVIS HELPER
    if [[ "$1" = "travis" ]]; then
        if [[ "$TRAVIS_BRANCH" = "master" ]]; then
            echo "Building docs (am on master branch)"
            vuepress build docs
        fi
        pull_diffs
        exit 0
    fi

    # FORCE ALL
    if [[ "$1" = "all" ]]; then
        build_all
        exit 0
    fi

    # Otherwise, assume specific image
    for TOOL in ${TOOLS[@]}; do
        SERVICE_NAME=$(basename `dirname ${TOOL}`)
        TOOL_NAME=$(basename "$TOOL")
        SPEC=($(head -n 1 "$START_DIR/$SERVICE_NAME/$TOOL_NAME/.spec"))
        if [[ "$TOOL" =~ "$1" ]]; then
            echo "Specific building $SERVICE_NAME/$TOOL_NAME:$VERSION"
            build "$SERVICE_NAME/$TOOL_NAME" "$START_DIR/$TOOL"
            exit 0
        fi
    done
fi

# dont build cli on travis
if [ -z "$TRAVIS_BRANCH" ]; then
    cli_generate "futils/cli/cli.sh"
    docs_generate
fi

if [[ "$TRAVIS_BRANCH" = *"release/"* ]]; then
    create_hub_repos
    docs_generate
fi

# On release/* ?
if [[ $CURRENT_BRANCH = *"release/"* ]]; then
    CLI_VERSION="v$(basename "$CURRENT_BRANCH")"
    cli_generate "futils/cli/cli.sh"
    docs_generate
fi

# new tag ?
if [[ -n "$CURRENTLY_TAGGING" ]]; then
    echo "New Release detected."
    build_all
    docs_generate
    exit 0
fi

build_diffs

echo "Build script done."