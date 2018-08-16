# foptimize
Specialized optimisation and compression pipelines

### Tools
- [gif](#gif)
- [png](#png)
- [jpg](#jpg)
- [svg](#svg)

## :whale: gif
- giflossy

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
- pngcrush 
- pngquant
- optipng
- advpng

```bash
$ docker run -v $(pwd):/d/ foptimize/png input.png
$ docker run -v $(pwd):/d/ foptimize/png "https://...png"
```
<Asciinema id="PEIe959sirjcn92xGbyF8hyvR"/>

## :whale: jpg
- jpgtran
- jpgoptim
- guetzli

```bash
$ docker run -v $(pwd):/d/ foptimize/jpg input.jpg
$ docker run -v $(pwd):/d/ foptimize/jpg "https://...jpg"
```
**name (`default`)**
1. file
2. quality (`85`)

<Asciinema id="PilzrrZesuDBvjen4ycEbwulY"/>

## :whale: svg
- svgcleaner
- svgo

```bash
$ docker run -v $(pwd):/d/ foptimize/svg input.svg
$ docker run -v $(pwd):/d/ foptimize/svg "https://...svg"
```

<Asciinema id="3iRRUqnxFNf9a5xEDI9KtxpyG"/>
