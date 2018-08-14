#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

echo -e "${PURPLE}  __      _ _ "
echo -e " / _| ___| (_)"
echo -e "| |_ / __| | |"
echo -e "|  _| (__| | |"
echo -e "|_|  \___|_|_|${NC}"
echo "==================================================================================="


if [ -z "$1" ]; then
    echo -e "Usage documentation can be shown with fcli --help"
    exit 1
fi

if [ $1 = "--version" ]; then
    echo -e "alpha 0.0.5"
    exit 0
fi

if [ $1 = "--help" ]; then
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
    echo -e "==================================================================================="
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
    echo -e "==================================================================================="
    echo -e "FUTILS :"
    echo -e "${RED}u, utl, util, utils       (1)"
    echo -e "${GREEN}  r, res, rsz, resize     (2)"
    echo -e "${CYAN}      input.ext1 (or url) (3)"
    echo -e "${PURPLE}      \"size\"              (4)${NC}"
    echo -e ""
    echo -e "ex. fcli ${RED}u ${GREEN}r ${CYAN}file.jpg ${PURPLE}\"50%\"${NC}"
    echo -e "    fcli ${RED}util ${GREEN}rsz ${CYAN}\"https://...ext1\" ${PURPLE}\"300px\"${NC}"
    echo -e "==================================================================================="
    exit 0
fi

if [ $1 = "c" ] || [ $1 = "conv" ] || [ $1 = "convert" ]; then
    if [ $2 = "i" ] || [ $2 = "img" ] || [ $2 = "image" ]; then
        echo -e "fconvert/image"
        docker run -v $(pwd):/d/ fconvert/image "$3" "$4"
        exit 0
    fi
    if [ $2 = "v" ] || [ $2 = "vid" ] || [ $2 = "video" ]; then
        echo -e "fconvert/video"
        docker run -v $(pwd):/d/ fconvert/video "$3" "$4"
        exit 0
    fi
    if [ $2 = "s" ] || [ $2 = "snd" ] || [ $2 = "sound" ]; then
        echo -e "fconvert/sound"
        docker run -v $(pwd):/d/ fconvert/sound "$3" "$4"
        exit 0
    fi
    exit 0
fi

if [ $1 = "o" ] || [ $1 = "opt" ] || [ $1 = "optim" ] || [ $1 = "optimize" ]; then
    if [ $2 = "gif" ] ; then
        echo -e "foptimize/gif"
        docker run -v $(pwd):/d/ -e colors="$4" foptimize/gif "$3"
        exit 0
    fi
    if [ $2 = "jpg" ] ; then
        echo -e "foptimize/jpg"
        docker run -v $(pwd):/d/ foptimize/jpg "$3"
        exit 0
    fi
    if [ $2 = "png" ] ; then
        echo -e "foptimize/png"
        docker run -v $(pwd):/d/ foptimize/png "$3"
        exit 0
    fi
    if [ $2 = "svg" ] ; then
        echo -e "foptimize/svg"
        docker run -v $(pwd):/d/ foptimize/svg "$3"
        exit 0
    fi
    exit 0
fi

if [ $1 = "u" ] || [ $1 = "utl" ] || [ $1 = "util" ] || [ $1 = "utils" ]; then
    if [ $2 = "r" ] || [ $2 = "res" ] || [ $2 = "rsz" ] || [ $2 = "resize" ] ; then
        echo -e "futils/resize"
        docker run -v $(pwd):/d/ -e size="$4" futils/resize "$3"
        exit 0
    fi
    exit 0
fi