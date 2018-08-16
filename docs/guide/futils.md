# futils
Common file operations 

## :wrench: Formats
- [resize](#resize)
- [alpha](#alpha)
    
## :whale: resize
```bash
$ docker run -v $(pwd):/d/ futils/resize file.ext 50%
$ docker run -v $(pwd):/d/ futils/resize "https://...ext" 50%
$ docker run -v $(pwd):/d/ futils/resize file.ext 300px
$ docker run -v $(pwd):/d/ futils/resize file.ext 400x200
```
**name (`default`)**
1. file
2. size (`100%`)

<Asciinema id="0O3U1bIuC7mQebNt3VadapT9h"/>

## :whale: alpha
remove a **png** image background
```bash
$ docker run -v $(pwd):/d/ futils/alpha file.png
$ docker run -v $(pwd):/d/ futils/alpha "https://...png"
$ docker run -v $(pwd):/d/ futils/alpha file.png Black
$ docker run -v $(pwd):/d/ futils/alpha file.png Black 5%
```
**name (`default`)**
1. file 
2. background color (`White`)
3. fuzz (`10%`)

<Asciinema id="5TXzMrMdT1hOJSGYUVeNRoSjn"/>

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