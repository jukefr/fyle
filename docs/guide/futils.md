# futils
## :whale: alpha
remove a **png** image background
```bash
$ docker run -v $(pwd):/d/ futils/alpha file.ext
$ docker run -v $(pwd):/d/ futils/alpha https://www.sample-vid... White 10
```
1. `https://www.sample-vid...`→`input`
2. `White`→`color`
3. `10`→`fuzziness`
## :whale: alpine
base image for all tools
```bash
$ docker run -v $(pwd):/d/ futils/alpine file.ext
$ docker run -v $(pwd):/d/ futils/alpine uname
```
1. `uname`→`command`
## :whale: cli
cli for fyle
```bash
$ docker run -v $(pwd):/d/ futils/cli file.ext
$ docker run -v $(pwd):/d/ futils/cli --version
```
1. `--version`→`command`
## :whale: monochrome
convert an image to monochrome
```bash
$ docker run -v $(pwd):/d/ futils/monochrome file.ext
$ docker run -v $(pwd):/d/ futils/monochrome https://www.sample-vid... Gray
```
1. `https://www.sample-vid...`→`input`
2. `Gray`→`color`
## :whale: resize
resize an image
```bash
$ docker run -v $(pwd):/d/ futils/resize file.ext
$ docker run -v $(pwd):/d/ futils/resize https://www.sample-vid... 50%
```
1. `https://www.sample-vid...`→`input`
2. `50%`→`size`
## :whale: rotate
rotate an image
```bash
$ docker run -v $(pwd):/d/ futils/rotate file.ext
$ docker run -v $(pwd):/d/ futils/rotate https://www.sample-vid... 90
```
1. `https://www.sample-vid...`→`input`
2. `90`→`angle`
