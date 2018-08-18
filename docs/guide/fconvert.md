# fconvert
## :whale: image
image format conversion
```bash
docker run --rm -v $PWD:/d/ fconvert/image $input $output
docker run --rm -v $PWD:/d/ fconvert/image https://www.sample-vid... ouput.jpg
```
1. `https://www.sample-vid...`→`$input`
2. `ouput.jpg`→`$output`
## :whale: sound
sound format conversion
```bash
docker run --rm -v $PWD:/d/ fconvert/sound $input $output
docker run --rm -v $PWD:/d/ fconvert/sound https://www.sample-vid... ouput.wav
```
1. `https://www.sample-vid...`→`$input`
2. `ouput.wav`→`$output`
## :whale: video
video format conversion
```bash
docker run --rm -v $PWD:/d/ fconvert/video $input $output
docker run --rm -v $PWD:/d/ fconvert/video https://www.sample-vid... ouput.avi
```
1. `https://www.sample-vid...`→`$input`
2. `ouput.avi`→`$output`
