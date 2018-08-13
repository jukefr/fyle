![banner](https://s3.eu-west-3.amazonaws.com/juke-github/futils-b.png)
![futils](https://s3.eu-west-3.amazonaws.com/juke-github/futils1.gif)

## API (Services)
1. image
    - [resize](/image/resize/README.md)
    
Every service supports passing an URL directly.
More to come later, feel free to contribute, I will add an automated build system at some point.

## CLI
I have created a small shell CLI to alias the docker commands and make using the project easier.
```bash
# Install the CLI (it will automatically update)
$ curl https://raw.githubusercontent.com/jukefr/futils/master/cli/install | sh

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
[More example workflows animations available here](/cli/README.md)

## Testing
`test.sh` runs the built docker images against a test image (found in `test.csv`). It's pretty basic for now.
```bash
$ ./test.sh
Testing service resize format png with url https://www.fnordware.com/superpng/pnggr...
tmp.png is now 100% of its original size.
```

## See also
- [fconvert](https://github.com/jukefr/fconvert) opinionated and easy file conversion
- [foptomize](https://github.com/jukefr/foptimize) opinionated and easy file optimization
