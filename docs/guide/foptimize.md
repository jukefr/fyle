# foptimize
## :whale: gif
optimize gif images
```bash
$ docker run -v $(pwd):/d/ foptimize/gif file.ext
$ docker run -v $(pwd):/d/ foptimize/gif https://...ext
$ docker run -v $(pwd):/d/ foptimize/gif https://www.sample-vid... 50 16
```
1. `https://www.sample-vid...`→`input`
2. `50`→`quality`
3. `16`→`colors`
## :whale: jpg
optimize jpg images
```bash
$ docker run -v $(pwd):/d/ foptimize/jpg file.ext
$ docker run -v $(pwd):/d/ foptimize/jpg https://...ext
$ docker run -v $(pwd):/d/ foptimize/jpg https://www.sample-vid... 90
```
1. `https://www.sample-vid...`→`input`
2. `90`→`quality`
## :whale: png
optimize png images
```bash
$ docker run -v $(pwd):/d/ foptimize/png file.ext
$ docker run -v $(pwd):/d/ foptimize/png https://...ext
$ docker run -v $(pwd):/d/ foptimize/png https://www.sample-vid...
```
1. `https://www.sample-vid...`→`input`
## :whale: svg
optimize svg images
```bash
$ docker run -v $(pwd):/d/ foptimize/svg file.ext
$ docker run -v $(pwd):/d/ foptimize/svg https://...ext
$ docker run -v $(pwd):/d/ foptimize/svg https://www.sample-vid...
```
1. `https://www.sample-vid...`→`input`
