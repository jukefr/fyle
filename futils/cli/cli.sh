#!/usr/bin/env bash
VERSION="v0.1-alpha4"
REMOTE_VERSIONS=($(curl -s -S "https://registry.hub.docker.com/v2/repositories/futils/cli/tags/" | jq -r '."results"[]["name"]'))

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

if [[ "${REMOTE_VERSIONS[0]}" == "latest" ]]; then
    REMOTE_VERSION="${REMOTE_VERSIONS[1]}"
else
    REMOTE_VERSION="${REMOTE_VERSIONS[0]}"
fi

if [[ "$REMOTE_VERSION" != "$VERSION" ]]; then
    echo -e "${RED}CLI is outdated, please run${NC} docker pull futils/cli${RED} then try again.${NC}"
    exit 1
fi

if [ -z "$1" ]; then
    echo -e "Usage documentation can be shown with fcli --help"
    exit 1
fi

if [ $1 = "--version" ]; then
    echo -e "$VERSION"
    exit 0
fi

if [ $1 = "--help" ]; then
    echo -e "${PURPLE}  __      _ _ "
    echo -e " / _| ___| (_)"
    echo -e "| |_ / __| | |"
    echo -e "|  _| (__| | |"
    echo -e "|_|  \___|_|_|${NC}"
    echo -e ""
    echo -e "FCONVERT :"
    echo -e "${RED}c, conv, convert          (1)"
    echo -e "${GREEN}  i, img, image           (2)"
    echo -e "${GREEN}  v, vid, video           (2)"
    echo -e "${GREEN}  s, snd, sound           (2)"
    echo -e "${CYAN}      input.ext1 (or url) (3)"
    echo -e "${PURPLE}      output.ext2         (4)${NC}"
    echo -e ""
    echo -e "ex. fcli ${RED}c ${GREEN}i ${CYAN}file.jpg ${PURPLE}file.png${NC}"
    echo -e "    fcli ${RED}conv ${GREEN}vid ${CYAN}\"https://...ext1\" ${PURPLE}file.gif${NC}"
    echo -e "    fcli ${RED}convert ${GREEN}sound ${CYAN}file.mp3 ${PURPLE}file.wav${NC}"
    echo -e ""
    echo -e "FOPTIMIZE :"
    echo -e "${RED}o, opt, optim, optimize   (1)"
    echo -e "${GREEN}  gif                     (2)"
    echo -e "${GREEN}  jpg                     (2)"
    echo -e "${GREEN}  png                     (2)"
    echo -e "${GREEN}  svg                     (2)"
    echo -e "${CYAN}      input.ext1 (or url) (3)${NC}"
    echo -e ""
    echo -e "ex. fcli ${RED}o ${GREEN}gif ${CYAN}file.gif${NC}"
    echo -e "    fcli ${RED}optim ${GREEN}jpg ${CYAN}\"https://...ext1\"${NC}"
    echo -e "    fcli ${RED}optimize ${GREEN}png ${CYAN}file.png${NC}"
    echo -e ""
    echo -e "FUTILS :"
    echo -e "${RED}u, utl, util, utils       (1)"
    echo -e "${GREEN}  r, res, rsz, resize     (2)"
    echo -e "${GREEN}  a, alpha                (2)"
    echo -e "${CYAN}      input.ext1 (or url) (3)"
    echo -e ""
    echo -e "ex. fcli ${RED}u ${GREEN}r ${CYAN}file.jpg"
    echo -e "    fcli ${RED}util ${GREEN}rsz ${CYAN}\"https://...ext1\"${NC}"
    echo -e ""
    echo -e "See https://jukefr.github.io/fyle/guide/ for more information."
    exit 0
fi

if [ $1 = "c" ] || [ $1 = "conv" ] || [ $1 = "convert" ]; then
    if [ $2 = "i" ] || [ $2 = "img" ] || [ $2 = "image" ]; then
        echo -e "fconvert/image"
        docker run --volumes-from "$(hostname)" "fconvert/image:$VERSION" "$3" "$4"
        exit 0
    fi
    if [ $2 = "v" ] || [ $2 = "vid" ] || [ $2 = "video" ]; then
        echo -e "fconvert/video"
        docker run --volumes-from "$(hostname)" "fconvert/video:$VERSION" "$3" "$4"
        exit 0
    fi
    if [ $2 = "s" ] || [ $2 = "snd" ] || [ $2 = "sound" ]; then
        echo -e "fconvert/sound"
        docker run --volumes-from "$(hostname)" "fconvert/sound:$VERSION" "$3" "$4"
        exit 0
    fi
    exit 0
fi

if [ $1 = "o" ] || [ $1 = "opt" ] || [ $1 = "optim" ] || [ $1 = "optimize" ]; then
    if [ $2 = "gif" ] ; then
        echo -e "foptimize/gif"
        docker run --volumes-from "$(hostname)" "foptimize/gif:$VERSION" "$3" "$4" "$5"
        exit 0
    fi
    if [ $2 = "jpg" ] ; then
        echo -e "foptimize/jpg"
        docker run --volumes-from "$(hostname)" "foptimize/jpg:$VERSION" "$3" "$4"
        exit 0
    fi
    if [ $2 = "png" ] ; then
        echo -e "foptimize/png"
        docker run --volumes-from "$(hostname)" "foptimize/png:$VERSION" "$3"
        exit 0
    fi
    if [ $2 = "svg" ] ; then
        echo -e "foptimize/svg"
        docker run --volumes-from "$(hostname)" "foptimize/svg:$VERSION" "$3"
        exit 0
    fi
    exit 0
fi

if [ $1 = "u" ] || [ $1 = "utl" ] || [ $1 = "util" ] || [ $1 = "utils" ]; then
    if [ $2 = "r" ] || [ $2 = "res" ] || [ $2 = "rsz" ] || [ $2 = "resize" ] ; then
        echo -e "futils/resize"
        docker run --volumes-from "$(hostname)" "futils/resize:$VERSION" "$3" "$4"
        exit 0
    fi
    if [ $2 = "a" ] || [ $2 = "alpha" ]; then
        echo -e "futils/alpha"
        docker run --volumes-from "$(hostname)" "futils/alpha:$VERSION" "$3" "$4" "$5"
        exit 0
    fi
    exit 0
fi
