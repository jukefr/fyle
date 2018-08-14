# foptimize
Specialized optimisation and compression pipelines

::: warning
Every image currently uses **lossy** compression, meaning the 
picture quality will get reduced, however it should barely be noticeable. 
Arguments to allow lossless compression will be added at some point. (issue 
[#1](https://github.com/jukefr/fyle/issues/1))
:::

## :wrench: Formats
- [gif](#gif)
- [png](#png)
- [jpg](#jpg)
- [svg](#svg)

## :whale: gif
- :white_check_mark: giflossy

```bash
$ docker run -v $(pwd):/d/ foptimize/gif input.gif
$ docker run -v $(pwd):/d/ foptimize/gif "https://...gif"

# reducing the amount of colors will help greatly, so will reducing the size (see futils for that)
$ docker run -v $(pwd):/d/ -e colors=16 foptimize/gif input.gif
```

## :whale: png
- :ballot_box_with_check: pngcrush 
- :ballot_box_with_check: pngquant
- :ballot_box_with_check: optipng
- :white_check_mark: advpng

```bash
$ docker run -v $(pwd):/d/ foptimize/png input.png
$ docker run -v $(pwd):/d/ foptimize/png "https://...png"
```
## :whale: jpg
- :ballot_box_with_check: jpgtran
- :ballot_box_with_check: jpgoptim
- :white_check_mark: guetzli

```bash
$ docker run -v $(pwd):/d/ foptimize/jpg input.jpg
$ docker run -v $(pwd):/d/ foptimize/jpg "https://...jpg"
```

## :whale: svg
- :ballot_box_with_check: svgcleaner
- :white_check_mark: svgo

```bash
$ docker run -v $(pwd):/d/ foptimize/svg input.svg
$ docker run -v $(pwd):/d/ foptimize/svg "https://...svg"
```

## :tv: Demonstration
![foptimize](https://s3.eu-west-3.amazonaws.com/juke-github/foptimize1.gif)

## :heavy_check_mark: Testing
`test.sh` runs the built docker images against a test image url (found in
`test.csv`).
```bash
$ ./test.sh
Testing service image format gif with url https://upload.wikimedia.org/wikipedia/c...
tmp.gif is now 34% of its original size.
Testing service image format png with url http://www.pngmart.com/files/1/Cat-PNG-H...
tmp.png is now 33% of its original size.
Testing service image format jpg with url https://img.webmd.com/dtmcms/live/webmd/...
tmp.jpg is now 75% of its original size.
```

