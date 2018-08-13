# gif
1. imagemagick
1. gifsicle

## Usage
```bash
$ docker run -v $(pwd):/d/ foptimize/gif input.gif
$ docker run -v $(pwd):/d/ foptimize/gif "https://...gif"

# reducing the amount of colors will help greatly, so will reducing the size (see futils for that)
$ docker run -v $(pwd):/d/ -e colors=16 foptimize/gif input.gif
```
