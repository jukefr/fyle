# Documentation

## Introduction
If you ever work on web projects and use any type of asset, you probably have
experienced first hand the lack of **openly available** and **easy to use**
file utilities. Most utilities that allow you to perform these operations are
often not maintained and perform poorly. One of the biggest problem might
that there are dozens of  options available for PNG image optimization for
instance, so which one is the right one ?

I created [futils](/futils), [fconvert](/fconvert) and [foptimize](/foptimize)
for this reason, so that everything can be available under one easy to use
repository, without the need for any parameter tuning (**by using opinionated 
default settings**). Anyone can run a single command to get their work done 
without having to worry about dependencies or calibration.

Calls may even be chained to achieve more complex workflows. Imagine recording
you screen in a `.mov` file for instance :
1. **convert** your `.mov` file to a `.gif` (with **fconvert**)
2. **resize** it to `50%` of its original size (with **futils**)
3. **optimize** the `screencast.gif` (with **foptimize**)

Then you may upload it to your newsletter. All it took was 3 commands.

::: warning
This project is in very early development, so things **will** break along the
way. This documentation will be held up to date to help with these transitions.
:::

## Essentials
![drawing skillz](https://s3.eu-west-3.amazonaws.com/juke-github/draw.jpg)

Each tool is contained in its own Dockerfile.
This dockerfile is built and pushed to the Docker Hub repository of the same 
name. (foptimize is foptimize on Docker Hub also, same for every other service)

A tool is composed of a **service** and a **format**, for instance **optimize** 
and **gif** becomes `foptimize/gif`, **convert** and **video** becomes 
`fconvert/video`.

:::tip
It was originally intended to have the image name for `video` be the specific
formats such as `mp4-mov`, however as it is impossible (to my knowledge) to 
alias a docker image without having to build it this would be a computational
waste and/or nightmare to deploy. 
:::

Each repository contains its own unique tool (service/format combo). **I try 
to keep their arguments consistent to ease memorization.** If in one repository
you type :
```bash
$ docker run -v $(pwd):/d/ foptimize/png input.png
```
then on another the command would be :
```bash
$ docker run -v $(pwd):/d/ fconvert/image input.png output.jpg
```

## CLI
[fcli](#fcli), a command line utility that aliases all the docker functions 
is also available, instead of writing :
```bash
$ docker run -v $(pwd):/d/ foptimize/png input.png
```
You run :
```bash
$ fcli o png input.png
```
To make using these tools even more convenient.

### Installing the CLI
```bash
$ curl https://raw.githubusercontent.com/jukefr/futils/master/cli/install | sh
```
::: warning
As this project is in a very early stage, I have made it so that this CLI will
automatically update to the latest version pushed to master. Expect some
breaking changes, I will keep the `--help` command up to date in accordance
with the current usages.
:::

## Contributing
If you feel like the way something works could be improved, or have a feature 
you want to add to this project, feel free open an issue to talk about it.
As this is early stage, you can open issues for minor questions if you happen
to have any troubles, this most probably will be caused by bad documentation on
my part so please do inform me.

## Testing
I wrote a very basic `test.sh` script for every service that reads a `.csv` 
with all the different services/formats you want to test with a given URL. It 
will simply run the docker container with the url in a temporary folder. If you 
see percentage reductions in your logs, congratulations 🎉 

I **need to** implement something more automated/reliable at some point...