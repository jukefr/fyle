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

[futils](/futils), [fconvert](/fconvert) and [foptimize](/foptimize) were 
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

## :zap: Essentials
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
$ docker run -v $(pwd):/d/ foptimize/png input.png
```
then on another the command would be :
```bash
$ docker run -v $(pwd):/d/ fconvert/image input.png output.jpg
```

## :crystal_ball: CLI
[fcli](/guide/futils.html#cli), a command line utility that aliases all the 
docker functions 
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
$ curl https://raw.githubusercontent.com/jukefr/fyle/master/futils/cli/install | sh
```
::: danger
As this project is in a very early stage, I have made it so that this CLI will
automatically update to the latest version pushed to master. Expect some
breaking changes, I will keep the `--help` command up to date in accordance
with the current usages.
:::

## :busts_in_silhouette: Contributing
If you feel like the way something works could be improved, or have a feature 
you want to add to this project, feel free open an issue to talk about it.
As this is early stage, you can open issues for minor questions if you happen
to have any troubles, this most probably will be caused by bad documentation on
my part so please do inform me.

Everything gets tested by Travis and built by Docker Hub automatically for
the deployment phase.

I use the standard [git flow](https://guides.github.com/introduction/flow/) 
model (master, develop, feature/, release/, hotfix/, v) in this repository 
so please familiarize yourself with this workflow. The building, testing and
deployment phase depend on it. I also like to keep my lines under 80 
characters but that is just personal taste you don't have to adhere.

To build the images dynamically I have made a `build.sh` script that for each
service loops over every folder inside the service, so every tool and builds 
an image tagged with the service name and folder name for the format.
You can also pass a directory to the build script like so `./build.sh 
futils/resize` to force a build only on this image.

## :heavy_check_mark: Testing
I wrote a very basic `test.sh` script. For each service it loops over the 
folders inside of it to know what tools should be tested. You can use the `
.spec` file to configure the passed parameters during the test. It will 
simply run the docker container a URL, inside a temporary 
folder. If you see % reductions in your logs, **congratulations the test 
passed** :tada:

You can also pass a directory to the test script like so `./test.sh 
futils/resize` to force a test only on this image.