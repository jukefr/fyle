# CLI

![cli demo](https://s3.eu-west-3.amazonaws.com/juke-github/fyle-demo.gif)
*(this foptimized gif is 16KB)*

A CLI gets dynamically generated on new releases. It aliases the docker commands to make them shorter and easier to use/memorize.
The way this works is :
1. You call the CLI with a `docker run` command, it creates a container that has the **host docker socket mounted**
2. This container calls the cli.sh script, this script in turn `docker runs` a container for the needed tool.

Effectively you run a docker container, that will run a docker container. But not nested, both containers are on the host, because we bind the socket.

```bash
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v $PWD:/d/ futils/cli --help
```

### Installing the CLI (linux, macos)
To "install" on unix you simply need to create an alias for **fcli** that 
will run the `docker run ...` command for you.
```bash
# The function
fcli(){ docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD":/d/ futils/cli "$@";}

# Adding it to your .bashrc (or .zshrc) to make it persistent
echo 'fcli(){ docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD":/d/ futils/cli "$@";}' >> ~/.bashrc
```
Then relaunch your terminal or `source ~/.bashrc`.

### Installing the CLI (windows)
For Windows, you need to run this **inside the boot2docker or hyper-v instance
as Windows does not use sockets**. Other solution is to expose the daemon (see
[https://bit.ly/2MRAk5M](https://bit.ly/2MRAk5M)) then you pass the ENV variable
**DOCKER_HOST=tcp://0.0.0.0:2375 instead of mounting the socket**. 

### Usage
```bash
fcli --help

fcli optimize png file.png
fcli convert image file1.jpg file2.png
fcli c video "https://...mp4" file2.mkv  
fcli utils resize file1.jpg "50%"

# Example Workflow Chaining :
fcli c video screen_recording.mov demo.gif
fcli u resize demo.gif "50%"
fcli o gif demo.gif
```

::: tip
*Pssst...* `fcli` also supports the `lint` command for development of shell scripts.
:::
