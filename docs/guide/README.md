# Documentation
::: danger
This project is in very early development, so things **will** break along the
way. This documentation will be held up to date to help ease these transitions.
:::

## :rocket: Introduction
If you ever work on web projects and use any type of asset, you probably have
experienced first hand the lack of **openly available** and **easy to use**
file utilities. Most utilities that allow you to perform these operations are
often not maintained and perform poorly. One of the biggest problem I 
encountered for instance was that that there are dozens of options
available for PNG image optimization, so which one is the right one ?

[futils](/guide/futils.html), [fconvert](/guide/fconvert.html) and 
[foptimize](/guide/foptimize.html) were 
created for this reason, so that everything can be available easily, without 
the need for any parameter tuning, **by using opinionated defaults**.
Anyone can run a single command to get their task done without having to 
worry about dependencies or calibration.

Calls may even be chained to achieve more complex workflows. Imagine recording
you screen in a `.mov` file for instance :
1. **convert** your `.mov` file to a `.gif` (with **fconvert**)
2. **resize** it to `50%` of its original size (with **futils**)
3. **optimize** the `screencast.gif` (with **foptimize**)

Then you may upload it to your newsletter. All it took was 3 commands.

::: tip NOTE
There is work to be done to allow passing options to container, as of now these 
are very limited.
:::

## :sparkles: How It Works
![drawing skillz](https://s3.eu-west-3.amazonaws.com/juke-github/draw.jpg)

Each tool is contained in its own Dockerfile.
This dockerfile is pushed and built on the Docker Hub repository of the same 
name. (foptimize is foptimize on Docker Hub also, same for every other service)

A tool is composed of a **service** and a **format**, for instance **optimize** 
and **gif** becomes `foptimize/gif`, **convert** and **video** becomes 
`fconvert/video`.

::: tip NOTE
It was originally intended to have the image name for `video` be the specific
formats such as `mp4-mov`, however as it is impossible (to my knowledge) to 
alias an image without building anything. So this would be a computational 
waste and/or nightmare to deploy. If you know of a way to achieve such a 
result please do open a ticket about it. 
:::

Each repository contains its own unique tool (service/format combo). **I try 
to keep their arguments consistent to ease memorization.** If in one repository
you type :
```bash
docker run --rm -v $PWD:/d/ foptimize/png input.png
```
then on another the command would be :
```bash
docker run --rm -v $PWD:/d/ fconvert/image input.png output.jpg
```

## :whale: CLI
[fcli](/guide/CLI.html), a command line utility that aliases all the 
docker functions 
is also available, instead of writing :
```bash
docker run --rm -v $PWD:/d/ foptimize/png input.png
```
You run :
```bash
fcli o png input.png
```
To make using these tools even more convenient. Instructions on [how to 
install the CLI are available on the futils documentation](/guide/CLI.html#installing-the-cli-linux-macos)