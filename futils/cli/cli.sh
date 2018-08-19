#!/bin/sh
set -e
# show help message if no argument is passed
if [ -z "$1" ]; then
echo "--help to see available tools"
exit 1
fi
# update check
VERSION="v0.1-beta1"
REMOTE_VERSIONS=$(curl -s -S "https://registry.hub.docker.com/v2/repositories/futils/cli/tags/" | jq -r '."results"[]["name"]')
if [ "$( echo "$REMOTE_VERSIONS" | sed -n 1p )" = "latest" ]; then
REMOTE_VERSION="$( echo "$REMOTE_VERSIONS" | sed -n 2p )"
else
REMOTE_VERSION="$( echo "$REMOTE_VERSIONS" | sed -n 1p )"
fi
if [ "$REMOTE_VERSION" != "$VERSION" ]; then
echo "New release detected CLI please run"
echo "docker pull futils/cli"
fi
# --version
if [ "$1" = "--version" ]; then
echo "v0.1-beta1"
fi
if [ "$1" = "--help" ]; then
echo
echo ""H , HUB, FHUB":"
echo "> alpine ( command )"
echo "> alpine-sdk ( command )"
echo "> imagemagick ( command )"
echo
echo ""U , UTILS, FUTILS":"
echo "> alpha ( input color fuzziness )"
echo "> cli ( command )"
echo "> monochrome ( input color )"
echo "> resize ( input size )"
echo "> rotate ( input angle )"
echo
echo ""C , CONVERT, FCONVERT":"
echo "> image ( input output )"
echo "> sound ( input output )"
echo "> video ( input output )"
echo
echo ""O , OPTIMIZE, FOPTIMIZE":"
echo "> gif ( input quality colors )"
echo "> jpg ( input quality )"
echo "> png ( input )"
echo "> svg ( input )"
echo
echo "For more help, see https://jukefr.github.io/fyle/guide/"
fi
if [ "$1" = "h" ] || [ "$1" = "hub" ] || [ "$1" = "fhub" ]; then
if [ "$2" = "alpine" ]; then
shift 2
docker run --rm --volumes-from "$(hostname)" "fhub/alpine:v0.1-beta1" "$@"
exit 0
fi
if [ "$2" = "alpine-sdk" ]; then
shift 2
docker run --rm --volumes-from "$(hostname)" "fhub/alpine-sdk:v0.1-beta1" "$@"
exit 0
fi
if [ "$2" = "imagemagick" ]; then
shift 2
docker run --rm --volumes-from "$(hostname)" "fhub/imagemagick:v0.1-beta1" "$@"
exit 0
fi
fi
if [ "$1" = "u" ] || [ "$1" = "utils" ] || [ "$1" = "futils" ]; then
if [ "$2" = "alpha" ]; then
shift 2
docker run --rm --volumes-from "$(hostname)" "futils/alpha:v0.1-beta1" "$@"
exit 0
fi
if [ "$2" = "cli" ]; then
shift 2
docker run --rm --volumes-from "$(hostname)" "futils/cli:v0.1-beta1" "$@"
exit 0
fi
if [ "$2" = "monochrome" ]; then
shift 2
docker run --rm --volumes-from "$(hostname)" "futils/monochrome:v0.1-beta1" "$@"
exit 0
fi
if [ "$2" = "resize" ]; then
shift 2
docker run --rm --volumes-from "$(hostname)" "futils/resize:v0.1-beta1" "$@"
exit 0
fi
if [ "$2" = "rotate" ]; then
shift 2
docker run --rm --volumes-from "$(hostname)" "futils/rotate:v0.1-beta1" "$@"
exit 0
fi
fi
if [ "$1" = "c" ] || [ "$1" = "convert" ] || [ "$1" = "fconvert" ]; then
if [ "$2" = "image" ]; then
shift 2
docker run --rm --volumes-from "$(hostname)" "fconvert/image:v0.1-beta1" "$@"
exit 0
fi
if [ "$2" = "sound" ]; then
shift 2
docker run --rm --volumes-from "$(hostname)" "fconvert/sound:v0.1-beta1" "$@"
exit 0
fi
if [ "$2" = "video" ]; then
shift 2
docker run --rm --volumes-from "$(hostname)" "fconvert/video:v0.1-beta1" "$@"
exit 0
fi
fi
if [ "$1" = "o" ] || [ "$1" = "optimize" ] || [ "$1" = "foptimize" ]; then
if [ "$2" = "gif" ]; then
shift 2
docker run --rm --volumes-from "$(hostname)" "foptimize/gif:v0.1-beta1" "$@"
exit 0
fi
if [ "$2" = "jpg" ]; then
shift 2
docker run --rm --volumes-from "$(hostname)" "foptimize/jpg:v0.1-beta1" "$@"
exit 0
fi
if [ "$2" = "png" ]; then
shift 2
docker run --rm --volumes-from "$(hostname)" "foptimize/png:v0.1-beta1" "$@"
exit 0
fi
if [ "$2" = "svg" ]; then
shift 2
docker run --rm --volumes-from "$(hostname)" "foptimize/svg:v0.1-beta1" "$@"
exit 0
fi
fi
