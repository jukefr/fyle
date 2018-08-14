# fconvert
One tool, many formats

## :wrench: Formats
- [video](#video-ffmpeg)
- [image](#image-imagemagick)
- [sound](#sound-mpg123)

## :whale: video (ffmpeg)

```bash
$ docker run -v $(pwd):/d/ fconvert/video input.ext1 output.ext2
$ docker run -v $(pwd):/d/ fconvert/video "https://...ext1" output.ext2

$ docker run -v $(pwd):/d/ fconvert/video demo.mp4 demo.gif 
$ docker run -v $(pwd):/d/ fconvert/video demo.mkv demo.flv
# ...
```

### Supported formats
```bash
$ ffmpeg -formats
``` 

## :whale: image (imagemagick)

```bash
$ docker run -v $(pwd):/d/ fconvert/image input.ext1 output.ext2
$ docker run -v $(pwd):/d/ fconvert/image "https://...ext1" output.ext2 

$ docker run -v $(pwd):/d/ fconvert/image demo.png demo.jpg
$ docker run -v $(pwd):/d/ fconvert/image demo.pdf demo.jpg
# ...
```

### Supported formats
```bash
$ identify -list format
```

## :whale: sound (mpg123)

::: tip
If it does not work with your formats, try with `fconvert/video` instead.
:::

```bash
$ docker run -v $(pwd):/d/ fconvert/sound input.ext1 output.ext2
$ docker run -v $(pwd):/d/ fconvert/sound "https://...ext1" output.ext2

$ docker run -v $(pwd):/d/ fconvert/sound demo.mp3 demo.wav 
$ docker run -v $(pwd):/d/ fconvert/sound demo.flv demo.mp3 
# ...
```

## :tv: Demonstration
![fconvert](https://s3.eu-west-3.amazonaws.com/juke-github/fconvert1.gif)

## :heavy_check_mark: Testing
`test.sh` runs the built docker images against a test image (found in `test.csv`). 
```bash
$ ./test.sh
Testing service image format png to jpg with url http://www.pngmart.com/files/1/Cat-PNG-H...
tmp.png (1859294) is now tmp.jpg (405329).
Testing service sound format mp3 to wav with url https://archive.org/download/testmp3test...
tmp.mp3 (198658) is now tmp.wav (1094444).
Testing service video format mp4 to mkv with url https://archive.org/download/CatDoesYipp...
tmp.mp4 (484460) is now tmp.mkv (448110).
```

