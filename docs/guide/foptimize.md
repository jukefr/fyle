# foptimize
## :whale: gif
optimize gif images
```bash
$ docker run -v $(pwd):/d/ foptimize/gif $input 
$ docker run -v $(pwd):/d/ foptimize/gif https://www.sample-vid... 50 16
```
1. `https://www.sample-vid...`→`$input`
2. `50`→`$quality`
3. `16`→`$colors`
## :whale: jpg
optimize jpg images
```bash
$ docker run -v $(pwd):/d/ foptimize/jpg $input 
$ docker run -v $(pwd):/d/ foptimize/jpg https://www.sample-vid... 90
```
1. `https://www.sample-vid...`→`$input`
2. `90`→`$quality`
## :whale: png
optimize png images
```bash
$ docker run -v $(pwd):/d/ foptimize/png $input 
$ docker run -v $(pwd):/d/ foptimize/png https://www.sample-vid...
```
1. `https://www.sample-vid...`→`$input`
## :whale: svg
optimize svg images
```bash
$ docker run -v $(pwd):/d/ foptimize/svg $input 
$ docker run -v $(pwd):/d/ foptimize/svg https://www.sample-vid...
```
1. `https://www.sample-vid...`→`$input`
