# 📂fyle
If you ever work on web projects that use any assets, you probably have already experienced the lack of openly available and easy to use file utilities. Most packages that allow you to perform such operations are often not maintained, perform poorly, and a myriad of other problems. There are dozens of options available for PNG image optimization for instance, which one is the right one ?

I created [futils](/futils), [fconvert](/fconvert) and [foptimize](/foptimize) for this reason, so that everything can be available under one easy to use domain, without the need for any parameter tunning (opiniated default settings). So that anyone can simply run a single command to get their work done. Maybe even chain commands for any specific workflow.

### Essentials 
The inner workings of these tools, or at least the way they are made available here is relatively simple. Each service (by service I mean for instance optimize/gif or convert/video) is contained in its own Dockerfile.

This dockerfile is built and pushed to the appropriate Docker Hub repository, as of now we have the following :
1. [fconvert](https://hub.docker.com/u/fconvert/)
2. [foptimize](https://hub.docker.com/u/foptimize/)
3. [futils](https://hub.docker.com/u/futils/)

Each of these repositories contains its own unique services for different formats. **They are all the same to use.** Meaning if on one repository you type :
```bash
$ docker run -v $(pwd):/d/ foptimize/png input.png
```
then on another repository/service/format the command would be :
```bash
$ docker run -v $(pwd):/d/ fconvert/image input.png output.jpg
```
This was done to make it easier to remember how to use the tools, eventually outgrowing the need to look at the documentation at every usage.

### CLI
You might want to check out [fcli](#fcli), a command line utility that aliases all the docker functions, so instead of writing :
```bash
$ docker run -v $(pwd):/d/ foptimize/png input.png
```
You simply run :
```bash
$ fcli o png input.png
```
To make using these tools even more convenient.
