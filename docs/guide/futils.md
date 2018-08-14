# futils

## :wrench: Formats
1. image
    - [resize](#resize)
    
## :whale: resize
```bash
$ docker run -v $(pwd):/d/ -e size="50%" futils/resize file.ext
$ docker run -v $(pwd):/d/ -e size="50%" futils/resize "https://...ext"
$ docker run -v $(pwd):/d/ -e size="300px" futils/resize file.ext
```

## :crystal_ball: CLI
I have created a small shell CLI to alias the docker commands and make using the project easier.
```bash
# Install the CLI (it will automatically update)
$ curl https://raw.githubusercontent.com/jukefr/fyle/master/futils/cli/install | sh

# Usage
$ fcli --help

$ fcli o png file.png
$ fcli opt gif file.gif
$ fcli optimize jpg "https://...jpg" 

$ fcli c i file1.jpg file2.png
$ fcli conv vid "https://...mp4" file2.mkv  

$ fcli u resize file1.jpg "50%"
$ fcli util resize "https://...mp4" "300px" 

# Example Workflow Chaining :
$ fcli c v screen_recording.mov demo.gif
$ fcli u resize demo.gif "50%"
$ fcli o gif demo.gif
```

## :tv: Example Workflows
asciinema
![asciinema](https://s3.eu-west-3.amazonaws.com/juke-github/asciinema.gif)
::: tip
Append `.gif` to the asciinema URL to get the docker command)
:::

screencast
![screencast](https://s3.eu-west-3.amazonaws.com/juke-github/screencast.gif)

## :tv: Demonstration
![futils](https://s3.eu-west-3.amazonaws.com/juke-github/futils1.gif)

## :heavy_check_mark: Testing
`test.sh` runs the built docker images against a test image (found in
`test.csv`). It's pretty basic for now.
```bash
$ ./test.sh
Testing service resize format png with url https://www.fnordware.com/superpng/pnggr...
tmp.png is now 100% of its original size.
```
