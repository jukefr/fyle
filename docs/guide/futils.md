# futils
## :whale: alpha
remove a **png** image background
```bash
docker run --rm -v $PWD:/d/ futils/alpha $input
docker run --rm -v $PWD:/d/ futils/alpha https://www.sample-vid... White 10
```
1. `https://www.sample-vid...`→`$input`
2. `White`→`$color`
3. `10`→`$fuzziness`
## :whale: cli
cli for fyle
```bash
docker run --rm -v $PWD:/d/ futils/cli $command
docker run --rm -v $PWD:/d/ futils/cli --version
```
1. `--version`→`$command`
## :whale: monochrome
convert an image to monochrome
```bash
docker run --rm -v $PWD:/d/ futils/monochrome $input
docker run --rm -v $PWD:/d/ futils/monochrome https://www.sample-vid... Gray
```
1. `https://www.sample-vid...`→`$input`
2. `Gray`→`$color`
## :whale: resize
resize an image
```bash
docker run --rm -v $PWD:/d/ futils/resize $input
docker run --rm -v $PWD:/d/ futils/resize https://www.sample-vid... 50%
```
1. `https://www.sample-vid...`→`$input`
2. `50%`→`$size`
## :whale: rotate
rotate an image
```bash
docker run --rm -v $PWD:/d/ futils/rotate $input
docker run --rm -v $PWD:/d/ futils/rotate https://www.sample-vid... 90
```
1. `https://www.sample-vid...`→`$input`
2. `90`→`$angle`
