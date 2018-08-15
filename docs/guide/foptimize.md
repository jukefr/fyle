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
**name (`default`)**
1. file
2. quality (`85`)

## :whale: svg
- :ballot_box_with_check: svgcleaner
- :white_check_mark: svgo

```bash
$ docker run -v $(pwd):/d/ foptimize/svg input.svg
$ docker run -v $(pwd):/d/ foptimize/svg "https://...svg"
```

## :tv: Demonstration
![foptimize](https://s3.eu-west-3.amazonaws.com/juke-github/foptimize1.gif)

<script src="https://asciinema.org/a/174524.js" id="asciicast-174524" async></script>
<script>
export default {
    mounted () {
        document.querySelector(`.${this.$style.example}`) .textContent = 'This is rendered by inline script and styled by inline CSS'
    }
}
</script>
