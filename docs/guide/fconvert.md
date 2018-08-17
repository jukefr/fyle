# fconvert
## :whale: image
image format conversion
```bash
$ docker run -v $(pwd):/d/ fconvert/image file.ext
$ docker run -v $(pwd):/d/ fconvert/image https://...ext
$ docker run -v $(pwd):/d/ fconvert/image https://www.sample-vid... ouput.jpg
```
1. `https://www.sample-vid...`→`input`
2. `ouput.jpg`→`output`
## :whale: sound
sound format conversion
```bash
$ docker run -v $(pwd):/d/ fconvert/sound file.ext
$ docker run -v $(pwd):/d/ fconvert/sound https://...ext
$ docker run -v $(pwd):/d/ fconvert/sound https://www.sample-vid... ouput.wav
```
1. `https://www.sample-vid...`→`input`
2. `ouput.wav`→`output`
## :whale: video
video format conversion
```bash
$ docker run -v $(pwd):/d/ fconvert/video file.ext
$ docker run -v $(pwd):/d/ fconvert/video https://...ext
$ docker run -v $(pwd):/d/ fconvert/video https://www.sample-vid... ouput.avi
```
1. `https://www.sample-vid...`→`input`
2. `ouput.avi`→`output`
