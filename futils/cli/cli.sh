#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

if [ -z "$1" ]; then
    echo "Usage documentation can be shown with fcli --help"
    exit 1
fi

if [ $1 = "--version" ]; then
    echo "v0.1-alpha3"
    exit 0
fi

if [ $1 = "--help" ]; then
    echo "${PURPLE}  __      _ _ "
    echo " / _| ___| (_)"
    echo "| |_ / __| | |"
    echo "|  _| (__| | |"
    echo "|_|  \___|_|_|${NC}"
    echo ""
    echo "FCONVERT :"
    echo "${RED}c, conv, convert          (1)"
    echo "${GREEN}  i, img, image           (2)"
    echo "${GREEN}  v, vid, video           (2)"
    echo "${GREEN}  s, snd, sound           (2)"
    echo "${CYAN}      input.ext1 (or url) (3)"
    echo "${PURPLE}      output.ext2         (4)${NC}"
    echo ""
    echo "ex. fcli ${RED}c ${GREEN}i ${CYAN}file.jpg ${PURPLE}file.png${NC}"
    echo "    fcli ${RED}conv ${GREEN}vid ${CYAN}\"https://...ext1\" ${PURPLE}file.gif${NC}"
    echo "    fcli ${RED}convert ${GREEN}sound ${CYAN}file.mp3 ${PURPLE}file.wav${NC}"
    echo ""
    echo "FOPTIMIZE :"
    echo "${RED}o, opt, optim, optimize   (1)"
    echo "${GREEN}  gif                     (2)"
    echo "${GREEN}  jpg                     (2)"
    echo "${GREEN}  png                     (2)"
    echo "${GREEN}  svg                     (2)"
    echo "${CYAN}      input.ext1 (or url) (3)${NC}"
    echo ""
    echo "ex. fcli ${RED}o ${GREEN}gif ${CYAN}file.gif${NC}"
    echo "    fcli ${RED}optim ${GREEN}jpg ${CYAN}\"https://...ext1\"${NC}"
    echo "    fcli ${RED}optimize ${GREEN}png ${CYAN}file.png${NC}"
    echo ""
    echo "FUTILS :"
    echo "${RED}u, utl, util, utils       (1)"
    echo "${GREEN}  r, res, rsz, resize     (2)"
    echo "${GREEN}  a, alpha                (2)"
    echo "${CYAN}      input.ext1 (or url) (3)"
    echo ""
    echo "ex. fcli ${RED}u ${GREEN}r ${CYAN}file.jpg"
    echo "    fcli ${RED}util ${GREEN}rsz ${CYAN}\"https://...ext1\""
    echo ""
    exit 0
fi

if [ $1 = "c" ] || [ $1 = "conv" ] || [ $1 = "convert" ]; then
    if [ $2 = "i" ] || [ $2 = "img" ] || [ $2 = "image" ]; then
        echo "fconvert/image"
        docker run -v $(pwd):/d/ fconvert/image "$3" "$4"
        exit 0
    fi
    if [ $2 = "v" ] || [ $2 = "vid" ] || [ $2 = "video" ]; then
        echo "fconvert/video"
        docker run -v $(pwd):/d/ fconvert/video "$3" "$4"
        exit 0
    fi
    if [ $2 = "s" ] || [ $2 = "snd" ] || [ $2 = "sound" ]; then
        echo "fconvert/sound"
        docker run -v $(pwd):/d/ fconvert/sound "$3" "$4"
        exit 0
    fi
    exit 0
fi

if [ $1 = "o" ] || [ $1 = "opt" ] || [ $1 = "optim" ] || [ $1 = "optimize" ]; then
    if [ $2 = "gif" ] ; then
        echo "foptimize/gif"
        docker run -v $(pwd):/d/ foptimize/gif "$3" "$4" "$5"
        exit 0
    fi
    if [ $2 = "jpg" ] ; then
        echo "foptimize/jpg"
        docker run -v $(pwd):/d/ foptimize/jpg "$3" "$4"
        exit 0
    fi
    if [ $2 = "png" ] ; then
        echo "foptimize/png"
        docker run -v $(pwd):/d/ foptimize/png "$3"
        exit 0
    fi
    if [ $2 = "svg" ] ; then
        echo "foptimize/svg"
        docker run -v $(pwd):/d/ foptimize/svg "$3"
        exit 0
    fi
    exit 0
fi

if [ $1 = "u" ] || [ $1 = "utl" ] || [ $1 = "util" ] || [ $1 = "utils" ]; then
    if [ $2 = "r" ] || [ $2 = "res" ] || [ $2 = "rsz" ] || [ $2 = "resize" ] ; then
        echo "futils/resize"
        docker run -v $(pwd):/d/ futils/resize "$3" "$4"
        exit 0
    fi
    if [ $2 = "a" ] || [ $2 = "alpha" ]; then
        echo "futils/alpha"
        docker run -v $(pwd):/d/ futils/alpha "$3" "$4" "$5"
        exit 0
    fi
    exit 0
fi
