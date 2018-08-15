# foptimize
Specialized optimisation and compression pipelines

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
```
**name (`default`)**
1. file
2. quality (`80`)
3. colors (`128`)

<Asciinema id="le6xZKz4DHK3cLQX0x5ymR8bJ"/>

## :whale: png
- :ballot_box_with_check: pngcrush 
- :ballot_box_with_check: pngquant
- :ballot_box_with_check: optipng
- :white_check_mark: advpng

```bash
$ docker run -v $(pwd):/d/ foptimize/png input.png
$ docker run -v $(pwd):/d/ foptimize/png "https://...png"
```
<Asciinema id="PEIe959sirjcn92xGbyF8hyvR"/>

## :whale: jpg
- :ballot_box_with_check: jpgtran
- :ballot_box_with_check: jpgoptim
- :white_check_mark: guetzli

```bash
$ docker run -v $(pwd):/d/ foptimize/jpg input.jpg
$ docker run -v $(pwd):/d/ foptimize/jpg "https://...jpg"
```
**name (`default`)**
1. file
2. quality (`85`)

<Asciinema id="PilzrrZesuDBvjen4ycEbwulY"/>

## :whale: svg
- :ballot_box_with_check: svgcleaner
- :white_check_mark: svgo

```bash
$ docker run -v $(pwd):/d/ foptimize/svg input.svg
$ docker run -v $(pwd):/d/ foptimize/svg "https://...svg"
```

<Asciinema id="3iRRUqnxFNf9a5xEDI9KtxpyG"/>
