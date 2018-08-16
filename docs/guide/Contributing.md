# Contributing

## :rocket: Introduction
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

## :construction_worker: Building

To build the images dynamically I have made a `build.sh` script that loops over 
every folder for every service, so every tool. It builds 
an image tagged with the service name and the format.

It will also automatically generate a `cli.sh` in `futils/cli` with every tool inside it. This should be done on every new tag (release).

Here are the commands that the script supports :
```bash
$ ./build.sh
# Builds images that have changed since last git tag

$ ./build.sh all
# Force build all

$ ./build.sh $service/$format
# Force build a specific tool

$ ./build.sh travis
# Travis CI pre-install helper
```

## :heavy_check_mark: Testing
I wrote a very basic `test.sh` script that loops over every 
tool that should be tested. You can use the `
.spec` file to configure the passed parameters during the test. It will 
simply run the docker container with those parameters, inside a temporary 
folder. If you see % reductions in your logs, **congratulations the test 
passed** :tada:

Here are the commands that the script supports :
```bash
$ ./test.sh
# Tests all tools against their .spec file

$ ./test.sh $service/$format
# Force test a specific tool

$ ./test.sh cli
# Tests all tools against their .spec file, but with fcli instead of direct docker run.
```