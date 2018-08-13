# sound (mpg123)

1. takes an input.ext
2. spits out output.ext in the same folder

if it does not work with your formats, try with `fconvert/video` instead.

## Usage
```bash
$ docker run -v $(pwd):/d/ fconvert/sound input.ext1 output.ext2
$ docker run -v $(pwd):/d/ fconvert/sound "https://...ext1" output.ext2

$ docker run -v $(pwd):/d/ fconvert/sound demo.mp3 demo.wav 
$ docker run -v $(pwd):/d/ fconvert/sound demo.flv demo.mp3 
# ...
```