(window.webpackJsonp=window.webpackJsonp||[]).push([[7],{167:function(e,t,s){"use strict";s.r(t);var a=s(0),o=Object(a.a)({},function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"content"},[e._m(0),e._v(" "),e._m(1),e._v(" "),s("p",[e._v("If you feel like the way something works could be improved, or have a feature\nyou want to add to this project, feel free open an issue to talk about it.\nAs this is early stage, you can open issues for minor questions if you happen\nto have any troubles, this most probably will be caused by bad documentation on\nmy part so please do inform me.")]),e._v(" "),s("p",[e._v("Everything gets tested by Travis and built by Docker Hub automatically for\nthe deployment phase.")]),e._v(" "),s("p",[e._v("I use the standard "),s("a",{attrs:{href:"https://guides.github.com/introduction/flow/",target:"_blank",rel:"noopener noreferrer"}},[e._v("git flow"),s("OutboundLink")],1),e._v("\nmodel (master, develop, feature/, release/, hotfix/, v) in this repository\nso please familiarize yourself with this workflow. The building, testing and\ndeployment phase depend on it. I also like to keep my lines under 80\ncharacters but that is just personal taste you don't have to adhere.")]),e._v(" "),e._m(2),e._v(" "),e._m(3),e._v(" "),e._m(4),e._v(" "),s("p",[e._v("Here are the commands that the script supports :")]),e._v(" "),e._m(5),e._m(6),e._v(" "),e._m(7),e._v(" "),s("p",[e._v("Here are the commands that the script supports :")]),e._v(" "),e._m(8),e._m(9),e._v(" "),e._m(10),e._v(" "),e._m(11),e._v(" "),s("p",[e._v("Pat yourself on the back, you are now an open-source contributor ! 🎉")]),e._v(" "),e._m(12),e._v(" "),s("p",[e._v("Here is what happens automatically (or dynamically at least) for every step of development :")]),e._v(" "),e._m(13),e._v(" "),s("p",[e._v("And now the entire process is done. I tried to make everything automated/dynamic, currently if you want to add a new tool, the bare minimum you have to edit is :")]),e._v(" "),e._m(14),e._v(" "),s("p",[e._v("The rest is done for you !")])])},[function(){var e=this.$createElement,t=this._self._c||e;return t("h1",{attrs:{id:"contributing"}},[t("a",{staticClass:"header-anchor",attrs:{href:"#contributing","aria-hidden":"true"}},[this._v("#")]),this._v(" Contributing")])},function(){var e=this.$createElement,t=this._self._c||e;return t("h2",{attrs:{id:"introduction"}},[t("a",{staticClass:"header-anchor",attrs:{href:"#introduction","aria-hidden":"true"}},[this._v("#")]),this._v(" 🚀 Introduction")])},function(){var e=this.$createElement,t=this._self._c||e;return t("h2",{attrs:{id:"building"}},[t("a",{staticClass:"header-anchor",attrs:{href:"#building","aria-hidden":"true"}},[this._v("#")]),this._v(" 🐳 Building")])},function(){var e=this.$createElement,t=this._self._c||e;return t("p",[this._v("To build the images dynamically I have made a "),t("code",[this._v("build.sh")]),this._v(" script that loops over\nevery folder for every service, so every tool. It builds\nan image tagged with the service name and the format.")])},function(){var e=this.$createElement,t=this._self._c||e;return t("p",[this._v("It will also automatically generate a "),t("code",[this._v("cli.sh")]),this._v(" in "),t("code",[this._v("futils/cli")]),this._v(" with every tool inside it. This should be done on every new tag (release).")])},function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"language-bash extra-class"},[s("pre",{pre:!0,attrs:{class:"language-bash"}},[s("code",[e._v("$ ./build.sh\n"),s("span",{attrs:{class:"token comment"}},[e._v("# Builds images that have changed since last git tag")]),e._v("\n\n$ ./build.sh all\n"),s("span",{attrs:{class:"token comment"}},[e._v("# Force build all")]),e._v("\n\n$ ./build.sh "),s("span",{attrs:{class:"token variable"}},[e._v("$service")]),e._v("/"),s("span",{attrs:{class:"token variable"}},[e._v("$format")]),e._v("\n"),s("span",{attrs:{class:"token comment"}},[e._v("# Force build a specific tool")]),e._v("\n")])])])},function(){var e=this.$createElement,t=this._self._c||e;return t("h2",{attrs:{id:"testing"}},[t("a",{staticClass:"header-anchor",attrs:{href:"#testing","aria-hidden":"true"}},[this._v("#")]),this._v(" ✔️ Testing")])},function(){var e=this.$createElement,t=this._self._c||e;return t("p",[this._v("I wrote a very basic "),t("code",[this._v("test.sh")]),this._v(" script that loops over every\ntool that should be tested. You can use the "),t("code",[this._v("spec.txt")]),this._v(" file to configure the passed parameters during the test. It will\nsimply run the docker container with those parameters, inside a temporary\nfolder. If you see % reductions in your logs, "),t("strong",[this._v("congratulations the test\npassed")]),this._v(" 🎉")])},function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"language-bash extra-class"},[s("pre",{pre:!0,attrs:{class:"language-bash"}},[s("code",[e._v("$ ./test.sh\n"),s("span",{attrs:{class:"token comment"}},[e._v("# Tests all images that have changed since last git tag")]),e._v("\n\n$ ./test.sh all\n"),s("span",{attrs:{class:"token comment"}},[e._v("# Force test all")]),e._v("\n\n$ ./test.sh "),s("span",{attrs:{class:"token variable"}},[e._v("$service")]),e._v("/"),s("span",{attrs:{class:"token variable"}},[e._v("$format")]),e._v("\n"),s("span",{attrs:{class:"token comment"}},[e._v("# Force test a specific tool")]),e._v("\n\n$ ./test.sh cli\n"),s("span",{attrs:{class:"token comment"}},[e._v("# Tests all tools against their spec.txt file, but with fcli directly")]),e._v("\n")])])])},function(){var e=this.$createElement,t=this._self._c||e;return t("h2",{attrs:{id:"contribution-workflow"}},[t("a",{staticClass:"header-anchor",attrs:{href:"#contribution-workflow","aria-hidden":"true"}},[this._v("#")]),this._v(" 👥 Contribution Workflow")])},function(){var e=this.$createElement,t=this._self._c||e;return t("p",[this._v("Let's say you have a proposal : "),t("strong",[this._v("add an image filter (black and white, sepia...) tool to futils")])])},function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("ol",[s("li",[e._v("Start off by submitting the proposal as an issue to the repository to get the discussion going.")]),e._v(" "),s("li",[e._v("Once the proposal is accepted, get to implementing.")]),e._v(" "),s("li",[e._v("Start by cloning the repository.\n"),s("ol",[s("li",[e._v("Check out "),s("code",[e._v("develop")])]),e._v(" "),s("li",[e._v("Create a new feature branch.")]),e._v(" "),s("li",[e._v("Copy "),s("code",[e._v("futils/resize")]),e._v(" to "),s("code",[e._v("futils/filter")]),e._v(" and do some magic ✨")]),e._v(" "),s("li",[e._v("Use "),s("code",[e._v("./build.sh")]),e._v(" at the root of the repository to build the new tool.")]),e._v(" "),s("li",[e._v("Use "),s("code",[e._v("./test.sh")]),e._v(" at the root of the repository to test the new tool.")]),e._v(" "),s("li",[e._v("Do some testing of your own of the new tool on some of your assets try check it works great.")])])]),e._v(" "),s("li",[e._v("Push your feature branch and create a pull request pointing to "),s("code",[e._v("develop")]),e._v(" on the repository.")]),e._v(" "),s("li",[e._v("Wait for a moderator (me) to review your pull request.")]),e._v(" "),s("li",[e._v("If the feature is good it is merged to develop.")]),e._v(" "),s("li",[e._v("The feature will be available publicly on the next release (tag and merge to master).")])])},function(){var e=this.$createElement,t=this._self._c||e;return t("h2",{attrs:{id:"automation"}},[t("a",{staticClass:"header-anchor",attrs:{href:"#automation","aria-hidden":"true"}},[this._v("#")]),this._v(" 🤖 Automation")])},function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("ol",[s("li",[s("strong",[e._v("feature/$T")]),e._v(", let's say you are creating a new tool named "),s("code",[e._v("T")]),e._v(" in service "),s("code",[e._v("S")]),e._v(" "),s("ul",[s("li",[s("code",[e._v("./build.sh")]),e._v(" will build every image that has changed since last git tag by default")]),e._v(" "),s("li",[s("strong",[e._v("it will also dynamically generate the CLI and the Vuepress documentation for the tool")]),e._v(" (make sure the "),s("code",[e._v("spec.txt")]),e._v(" file is configured properly)")]),e._v(" "),s("li",[s("code",[e._v("./test.sh")]),e._v(" will test every image that has changed since last git tag by default")])])]),e._v(" "),s("li",[s("strong",[e._v("develop")]),e._v(", let's say the pull request for "),s("code",[e._v("T")]),e._v(" gets accepted and merged into develop\n"),s("ul",[s("li",[s("code",[e._v("./build.sh")]),e._v(" will behave the same as on a "),s("strong",[e._v("feature")]),e._v(" branch")]),e._v(" "),s("li",[s("code",[e._v("./test.sh")]),e._v(" will behave the same as on a "),s("strong",[e._v("feature")]),e._v(" branch")])])]),e._v(" "),s("li",[s("strong",[e._v("release/$VERSION")]),e._v(", let's say everything went smoothly and we want to prepare a new release\n"),s("ul",[s("li",[s("code",[e._v("./build.sh")]),e._v(" will automatically set the CLI version to the current release name")]),e._v(" "),s("li",[s("strong",[e._v("if a new tool has been introduced in this release, Travis will automatically create the corresponding Docker Hub repository so that everything will deploy automatically when merged to master.")])])])]),e._v(" "),s("li",[s("strong",[e._v("master")]),e._v(", when anything is pushed to master, it is automatically built, tested and deployed\n"),s("ul",[s("li",[e._v("Travis compiles the Vuepress docs (that have already automatically been generated) and deploys to Github Pages")]),e._v(" "),s("li",[e._v("Travis pulls all the latest tools from Docker Hub to use as build cache.")]),e._v(" "),s("li",[e._v("Travis builds all the tools and tags them with the new $VERSION")]),e._v(" "),s("li",[e._v("Travis tests all the tools locally")]),e._v(" "),s("li",[e._v("Travis tests all the tools with the CLI locally")]),e._v(" "),s("li",[e._v("Docker Hub builds all the tools with tags "),s("code",[e._v("latest")]),e._v(" and "),s("code",[e._v("$VERSION")])]),e._v(" "),s("li",[e._v("Docker Hub deploys the built images publicly")])])])])},function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("ol",[s("li",[s("code",[e._v("entrypoint.sh")]),e._v(" of the tool, "),s("code",[e._v("Dockerfile")]),e._v(" will usually remain the same.")]),e._v(" "),s("li",[s("code",[e._v("spec.txt")]),e._v(" of the tool to configure "),s("strong",[e._v("cli generation")]),e._v(", "),s("strong",[e._v("doc generation")]),e._v(" and "),s("strong",[e._v("testing")]),e._v(".")])])}],!1,null,null,null);o.options.__file="Contributing.md";t.default=o.exports}}]);