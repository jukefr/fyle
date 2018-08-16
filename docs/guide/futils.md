# futils
Common file operations 

### Tools
- [resize](#resize)
- [alpha](#alpha)
- [CLI](#cli)
- [alpine](#alpine)
    
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
A CLI gets dynamically generated on new releases. It aliases the docker commands to make them shorter and easier to use/memorize.
The way this works is :
1. You call the CLI with a `docker run` command, it creates a container that has the **host docker socket mounted**
2. This container calls the cli.sh script, this script in turn `docker runs` a container for the needed tool.

Effectively you run a docker container, that will run a docker container. But not nested, both containers are on the host, because we bind the socket.

```bash
$ docker run -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/d/ futils/cli --help
```

### Installing the CLI (linux, macos)
To "install" on unix you simply need to create an alias for **fcli** that 
will run the `docker run ...` command for you.
```bash
$ echo 'alias fcli="docker run -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/d/ futils/cli"' >> ~/.bashrc
```

### Installing the CLI (windows)
For Windows, you need to run this **inside the boot2docker or hyper-v instance
as Windows does not use sockets**. Other solution is to expose the daemon (see
[https://bit.ly/2MRAk5M](https://bit.ly/2MRAk5M)) then you pass the ENV variable
**DOCKER_HOST=tcp://0.0.0.0:2375 instead of mounting the socket**. 

### Usage
```bash
$ fcli --help

$ fcli o png file.png
$ fcli c image file1.jpg file2.png
$ fcli c video "https://...mp4" file2.mkv  
$ fcli u resize file1.jpg "50%"

# Example Workflow Chaining :
$ fcli c video screen_recording.mov demo.gif
$ fcli u resize demo.gif "50%"
$ fcli o gif demo.gif
```

## :whale: alpine
A base Alpine image used by all tools. You shouldn't need this unless creating a new tool.

