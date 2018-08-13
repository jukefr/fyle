# foptimize

## Formats
1. image
    - [gif](#gif)
    - [png](#png)
    - [jpg](#jpg)

Every service supports passing an URL directly.
More to come later, feel free to contribute, I will add an automated build
system at some point.

## Demonstration
![foptimize](https://s3.eu-west-3.amazonaws.com/juke-github/foptimize1.gif)

## Testing
`test.sh` runs the built docker images against a test image (found in
`test.csv`). It's pretty basic for now.
```bash
$ ./test.sh
Testing service image format gif with url https://upload.wikimedia.org/wikipedia/c...
tmp.gif is now 34% of its original size.
Testing service image format png with url http://www.pngmart.com/files/1/Cat-PNG-H...
tmp.png is now 33% of its original size.
Testing service image format jpg with url https://img.webmd.com/dtmcms/live/webmd/...
tmp.jpg is now 75% of its original size.
```

## gif
1. imagemagick
1. gifsicle

```bash
$ docker run -v $(pwd):/d/ foptimize/gif input.gif
$ docker run -v $(pwd):/d/ foptimize/gif "https://...gif"

# reducing the amount of colors will help greatly, so will reducing the size (see futils for that)
$ docker run -v $(pwd):/d/ -e colors=16 foptimize/gif input.gif
```

## png
1. pngcrush
2. pngquant

```bash
$ docker run -v $(pwd):/d/ foptimize/png input.png
$ docker run -v $(pwd):/d/ foptimize/png "https://...png"
```
## jpg
0. imagemagick
1. jpgtran
2. jpgoptim

```bash
$ docker run -v $(pwd):/d/ foptimize/jpg input.jpg
$ docker run -v $(pwd):/d/ foptimize/jpg "https://...jpg"
```

