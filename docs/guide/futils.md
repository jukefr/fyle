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
argument order :
1. file
2. size (`100%`)

## :whale: alpha
remove a **png** image background
```bash
$ docker run -v $(pwd):/d/ futils/alpha file.png
$ docker run -v $(pwd):/d/ futils/alpha "https://...png"
$ docker run -v $(pwd):/d/ futils/alpha file.png Black
$ docker run -v $(pwd):/d/ futils/alpha file.png Black 5%
```
argument order :
1. file 
2. background color (`White`)
3. fuzz (`10%`)

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
