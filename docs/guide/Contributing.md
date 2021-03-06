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

## :whale: Building

To build the images dynamically I have made a `build.sh` script that loops over 
every folder for every service, so every tool. It builds 
an image tagged with the service name and the format.

It will also automatically generate a `cli.sh` in `futils/cli` with every tool inside it. This should be done on every new tag (release).

Here are the commands that the script supports :
```bash
./build.sh
# Builds images that have changed since last git tag

./build.sh all
# Force build all

./build.sh service/tool
# Force build a specific tool
```

## :heavy_check_mark: Testing
I wrote a very basic `test.sh` script that loops over every 
tool that should be tested. You can use the `
spec.cfg` file to configure the passed parameters during the test. It will 
simply run the docker container with those parameters, inside a temporary 
folder. If you see % reductions in your logs, **congratulations the test 
passed** :tada:

Here are the commands that the script supports :
```bash
./test.sh
# Tests all images that have changed since last git tag

./test.sh all
# Force test all

./test.sh service/tool
# Force test a specific tool

./test.sh cli
# Tests all tools against their spec.cfg file, but with fcli directly
```

## :busts_in_silhouette: Contribution Workflow
Let's say you have a proposal : **add an image filter (black and white, sepia...) tool to futils**

1. Start off by submitting the proposal as an issue to the repository to get the discussion going.
2. Once the proposal is accepted, get to implementing.
3. Start by cloning the repository.
    1. Check out `develop`
    2. Create a new feature branch.
    3. Copy `futils/resize` to `futils/filter` and do some magic :sparkles:
    4. Use `./build.sh` at the root of the repository to build the new tool.
    5. Use `./test.sh` at the root of the repository to test the new tool.
    6. Do some testing of your own of the new tool on some of your assets try check it works great.
4. Push your feature branch and create a pull request pointing to `develop` on the repository.
5. Wait for a moderator (me) to review your pull request.
6. If the feature is good it is merged to develop.
7. The feature will be available publicly on the next release (tag and merge to master).

Pat yourself on the back, you are now an open-source contributor ! :tada:

## :robot: Automation
Here is what happens automatically (or dynamically at least) for every step of development :
1. **feature/$T**, let's say you are creating a new tool named `T` in service `S`
    - `./build.sh` will build every image that has changed since last git tag by default
    - **it will also dynamically generate the CLI and the Vuepress documentation for the tool** (make sure the `spec.cfg` file is configured properly)
    - `./test.sh` will test every image that has changed since last git tag by default
2. **develop**, let's say the pull request for `T` gets accepted and merged into develop
    - `./build.sh` will behave the same as on a **feature** branch
    - `./test.sh` will behave the same as on a **feature** branch
3. **release/$VERSION**, let's say everything went smoothly and we want to prepare a new release
    - `./build.sh` will automatically set the CLI version to the current release name
    - **if a new tool has been introduced in this release, Travis will automatically create the corresponding Docker Hub repository so that everything will deploy automatically when merged to master.**
4. **master**, when anything is pushed to master, it is automatically built, tested and deployed
    - Travis compiles the Vuepress docs (that have already automatically been generated) and deploys to Github Pages
    - Travis pulls all the latest tools from Docker Hub to use as build cache.
    - Travis builds all the tools and tags them with the new $VERSION
    - Travis tests all the tools locally
    - Travis tests all the tools with the CLI locally
    - Docker Hub builds all the tools with tags `latest` and `$VERSION`
    - Docker Hub deploys the built images publicly

And now the entire process is done. I tried to make everything automated/dynamic, currently if you want to add a new tool, the bare minimum you have to edit is :
1. `entrypoint.sh` of the tool, `Dockerfile` will usually remain the same.
2. `spec.cfg` of the tool to configure **cli generation**, **doc generation** and **testing**.

The rest is done for you !