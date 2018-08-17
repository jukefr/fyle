#!/bin/sh
if [ -z "$1" ]; then
echo "--help to see available tools"
exit 1
fi
VERSION="v0.1-alpha8"
REMOTE_VERSIONS=$(curl -s -S "https://registry.hub.docker.com/v2/repositories/futils/cli/tags/" | jq -r '."results"[]["name"]')
if [[ "$( echo "$REMOTE_VERSIONS" | sed -n 1p )" == "latest" ]]; then
REMOTE_VERSION="$( echo "$REMOTE_VERSIONS" | sed -n 2p )"
else
REMOTE_VERSION="$( echo "$REMOTE_VERSIONS" | sed -n 1p )"
fi
if [[ "$REMOTE_VERSION" != "$VERSION" ]]; then
echo "CLI is outdated, please run docker pull futils/cli to update."
fi
if [ $1 = "--version" ]; then
echo "v0.1-alpha8"
fi
if [ $1 = "--help" ]; then
echo ""
echo ""C , CONVERT, FCONVERT":"
echo "> image ( input output )"
echo "> sound ( input output )"
echo "> video ( input output )"
echo ""
echo ""O , OPTIMIZE, FOPTIMIZE":"
echo "> gif ( input quality colors )"
echo "> jpg ( input quality )"
echo "> png ( input )"
echo "> svg ( input )"
echo ""
echo ""U , UTILS, FUTILS":"
echo "> alpha ( input color fuzziness )"
echo "> alpine ( command )"
echo "> cli ( command )"
echo "> monochrome ( input color )"
echo "> resize ( input size )"
echo "> rotate ( input angle )"
echo ""
echo "For more help, see https://jukefr.github.io/fyle/guide/"
fi
if [ $1 = "c" ] || [ $1 = "convert" ] || [ $1 = "fconvert" ]; then
if [ $2 = "image" ]; then
echo "fconvert/image/"
shift 2
docker run --volumes-from "$(hostname)" "fconvert/image:v0.1-alpha8" "$@"
exit 0
fi
if [ $2 = "sound" ]; then
echo "fconvert/sound/"
shift 2
docker run --volumes-from "$(hostname)" "fconvert/sound:v0.1-alpha8" "$@"
exit 0
fi
if [ $2 = "video" ]; then
echo "fconvert/video/"
shift 2
docker run --volumes-from "$(hostname)" "fconvert/video:v0.1-alpha8" "$@"
exit 0
fi
fi
if [ $1 = "o" ] || [ $1 = "optimize" ] || [ $1 = "foptimize" ]; then
if [ $2 = "gif" ]; then
echo "foptimize/gif/"
shift 2
docker run --volumes-from "$(hostname)" "foptimize/gif:v0.1-alpha8" "$@"
exit 0
fi
if [ $2 = "jpg" ]; then
echo "foptimize/jpg/"
shift 2
docker run --volumes-from "$(hostname)" "foptimize/jpg:v0.1-alpha8" "$@"
exit 0
fi
if [ $2 = "png" ]; then
echo "foptimize/png/"
shift 2
docker run --volumes-from "$(hostname)" "foptimize/png:v0.1-alpha8" "$@"
exit 0
fi
if [ $2 = "svg" ]; then
echo "foptimize/svg/"
shift 2
docker run --volumes-from "$(hostname)" "foptimize/svg:v0.1-alpha8" "$@"
exit 0
fi
fi
if [ $1 = "u" ] || [ $1 = "utils" ] || [ $1 = "futils" ]; then
if [ $2 = "alpha" ]; then
echo "futils/alpha/"
shift 2
docker run --volumes-from "$(hostname)" "futils/alpha:v0.1-alpha8" "$@"
exit 0
fi
if [ $2 = "alpine" ]; then
echo "futils/alpine/"
shift 2
docker run --volumes-from "$(hostname)" "futils/alpine:v0.1-alpha8" "$@"
exit 0
fi
if [ $2 = "cli" ]; then
echo "futils/cli/"
shift 2
docker run --volumes-from "$(hostname)" "futils/cli:v0.1-alpha8" "$@"
exit 0
fi
if [ $2 = "monochrome" ]; then
echo "futils/monochrome/"
shift 2
docker run --volumes-from "$(hostname)" "futils/monochrome:v0.1-alpha8" "$@"
exit 0
fi
if [ $2 = "resize" ]; then
echo "futils/resize/"
shift 2
docker run --volumes-from "$(hostname)" "futils/resize:v0.1-alpha8" "$@"
exit 0
fi
if [ $2 = "rotate" ]; then
echo "futils/rotate/"
shift 2
docker run --volumes-from "$(hostname)" "futils/rotate:v0.1-alpha8" "$@"
exit 0
fi
fi
