# fhub
## :whale: alpine
base docker image for all tools
```bash
docker run --rm -v $PWD:/d/ fhub/alpine $command
docker run --rm -v $PWD:/d/ fhub/alpine uname -r
```
1. `uname`→`$command`
## :whale: alpine-sdk
alpine sdk preinstalled for caching
```bash
docker run --rm -v $PWD:/d/ fhub/alpine-sdk $command
docker run --rm -v $PWD:/d/ fhub/alpine-sdk make --version
```
1. `make`→`$command`
## :whale: imagemagick
alpine with imagemagick preinstalled for caching
```bash
docker run --rm -v $PWD:/d/ fhub/imagemagick $command
docker run --rm -v $PWD:/d/ fhub/imagemagick identify -version
```
1. `identify`→`$command`
