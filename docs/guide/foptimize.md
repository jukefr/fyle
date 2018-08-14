# foptimize
::: warning
Every optimization format currently used **lossy** compression, meaning the picture quality will get reduced, however it should barely be noticeable. Arguments to allow lossless compression will be added at some point.
:::

## :wrench: Formats
- image
    - [gif](#gif)
    - [png](#png)
    - [jpg](#jpg)
    - [svg](#svg)

## :whale: gif
- giflossy

```bash
$ docker run -v $(pwd):/d/ foptimize/gif input.gif
$ docker run -v $(pwd):/d/ foptimize/gif "https://...gif"

# reducing the amount of colors will help greatly, so will reducing the size (see futils for that)
$ docker run -v $(pwd):/d/ -e colors=16 foptimize/gif input.gif
```

## :whale: png
- pngcrush
- pngquant
- optipng
- advpng

```bash
$ docker run -v $(pwd):/d/ foptimize/png input.png
$ docker run -v $(pwd):/d/ foptimize/png "https://...png"
```
## :whale: jpg
- jpgtran
- jpgoptim
- guetzli

```bash
$ docker run -v $(pwd):/d/ foptimize/jpg input.jpg
$ docker run -v $(pwd):/d/ foptimize/jpg "https://...jpg"
```

## :whale: svg
- svgcleaner
- svgo

```bash
$ docker run -v $(pwd):/d/ foptimize/svg input.svg
$ docker run -v $(pwd):/d/ foptimize/svg "https://...svg"
```

## :tv: Demonstration
![foptimize](https://s3.eu-west-3.amazonaws.com/juke-github/foptimize1.gif)

## :heavy_check_mark: Testing
`test.sh` runs the built docker images against a test image url (found in
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

