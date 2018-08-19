# foptimize
## :whale: gif
optimize gif images
```bash
docker run --rm -v $PWD:/d/ foptimize/gif $input
docker run --rm -v $PWD:/d/ foptimize/gif https://www.sample-vid... 50 16
```
1. `https://www.sample-vid...`→`$input`
2. `50`→`$quality`
3. `16`→`$colors`
## :whale: jpg
optimize jpg images
```bash
docker run --rm -v $PWD:/d/ foptimize/jpg $input
docker run --rm -v $PWD:/d/ foptimize/jpg https://www.sample-vid... 90
```
1. `https://www.sample-vid...`→`$input`
2. `90`→`$quality`
## :whale: png
optimize png images
```bash
docker run --rm -v $PWD:/d/ foptimize/png $input
docker run --rm -v $PWD:/d/ foptimize/png https://www.sample-vid...
```
1. `https://www.sample-vid...`→`$input`
## :whale: svg
optimize svg images
```bash
docker run --rm -v $PWD:/d/ foptimize/svg $input
docker run --rm -v $PWD:/d/ foptimize/svg https://www.sample-vid...
```
1. `https://www.sample-vid...`→`$input`
