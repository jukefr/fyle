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

## :whale: CLI
I have created a small CLI to alias the docker commands and make using the project easier.
The way this works is :
1. You call the CLI with a `docker run` command, it creates a container that has the **host docker socket mounted**
2. This container calls the cli.sh script, it `docker runs` a container for the needed tool on the **host** 

Effectively you run a docker container, that will run a docker container. But not nested, both containers are on the host, because we bind the socket.

```bash
# Using the CLI
$ docker run -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/d/ futils/cli --help

# Installing (.bashrc example, adjust for your specific shell)
$ echo 'alias fcli="docker run -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/d/ futils/cli"' >> ~/.bashrc

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
