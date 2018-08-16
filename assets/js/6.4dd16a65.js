(window.webpackJsonp=window.webpackJsonp||[]).push([[6],{168:function(t,e,s){"use strict";s.r(e);var a=s(0),i=Object(a.a)({},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"content"},[t._m(0),t._v(" "),t._m(1),t._v(" "),s("p",[t._v("If you feel like the way something works could be improved, or have a feature\nyou want to add to this project, feel free open an issue to talk about it.\nAs this is early stage, you can open issues for minor questions if you happen\nto have any troubles, this most probably will be caused by bad documentation on\nmy part so please do inform me.")]),t._v(" "),s("p",[t._v("Everything gets tested by Travis and built by Docker Hub automatically for\nthe deployment phase.")]),t._v(" "),s("p",[t._v("I use the standard "),s("a",{attrs:{href:"https://guides.github.com/introduction/flow/",target:"_blank",rel:"noopener noreferrer"}},[t._v("git flow"),s("OutboundLink")],1),t._v("\nmodel (master, develop, feature/, release/, hotfix/, v) in this repository\nso please familiarize yourself with this workflow. The building, testing and\ndeployment phase depend on it. I also like to keep my lines under 80\ncharacters but that is just personal taste you don't have to adhere.")]),t._v(" "),t._m(2),t._v(" "),t._m(3),t._v(" "),t._m(4),t._v(" "),s("p",[t._v("Here are the commands that the script supports :")]),t._v(" "),t._m(5),t._m(6),t._v(" "),t._m(7),t._v(" "),s("p",[t._v("Here are the commands that the script supports :")]),t._v(" "),t._m(8),t._m(9),t._v(" "),t._m(10),t._v(" "),s("ol",[s("li",[t._v("Start off by submitting the proposal as an issue to the repository to get the discussion going.")]),t._v(" "),s("li",[t._v("Once the proposal is accepted, get to implementing.")]),t._v(" "),s("li",[t._v("Start by cloning the repository.\n"),s("ol",[t._m(11),t._v(" "),s("li",[t._v("Create a new feature branch.")]),t._v(" "),t._m(12),t._v(" "),t._m(13),t._v(" "),t._m(14),t._v(" "),s("li",[t._v("Do some testing of your own of the new tool on some of your assets try check it works great.")]),t._v(" "),s("li",[t._v("🔥 Add the corresponding documentation to "),s("code",[t._v("docs/guide")]),t._v(" (plans to automate this, see "),s("a",{attrs:{href:"https://github.com/jukefr/fyle/issues/19",target:"_blank",rel:"noopener noreferrer"}},[t._v("#19"),s("OutboundLink")],1),t._v(")")])])]),t._v(" "),t._m(15),t._v(" "),s("li",[t._v("Wait for a moderator (me) to review your pull request.")]),t._v(" "),s("li",[t._v("If the feature is good it is merged to develop.")]),t._v(" "),t._m(16)]),t._v(" "),s("p",[t._v("Pat yourself on the back, you are now an open-source contributor ! 🎉")])])},[function(){var t=this.$createElement,e=this._self._c||t;return e("h1",{attrs:{id:"contributing"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#contributing","aria-hidden":"true"}},[this._v("#")]),this._v(" Contributing")])},function(){var t=this.$createElement,e=this._self._c||t;return e("h2",{attrs:{id:"introduction"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#introduction","aria-hidden":"true"}},[this._v("#")]),this._v(" 🚀 Introduction")])},function(){var t=this.$createElement,e=this._self._c||t;return e("h2",{attrs:{id:"building"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#building","aria-hidden":"true"}},[this._v("#")]),this._v(" 🐳 Building")])},function(){var t=this.$createElement,e=this._self._c||t;return e("p",[this._v("To build the images dynamically I have made a "),e("code",[this._v("build.sh")]),this._v(" script that loops over\nevery folder for every service, so every tool. It builds\nan image tagged with the service name and the format.")])},function(){var t=this.$createElement,e=this._self._c||t;return e("p",[this._v("It will also automatically generate a "),e("code",[this._v("cli.sh")]),this._v(" in "),e("code",[this._v("futils/cli")]),this._v(" with every tool inside it. This should be done on every new tag (release).")])},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"language-bash extra-class"},[s("pre",{pre:!0,attrs:{class:"language-bash"}},[s("code",[t._v("$ ./build.sh\n"),s("span",{attrs:{class:"token comment"}},[t._v("# Builds images that have changed since last git tag")]),t._v("\n\n$ ./build.sh all\n"),s("span",{attrs:{class:"token comment"}},[t._v("# Force build all")]),t._v("\n\n$ ./build.sh "),s("span",{attrs:{class:"token variable"}},[t._v("$service")]),t._v("/"),s("span",{attrs:{class:"token variable"}},[t._v("$format")]),t._v("\n"),s("span",{attrs:{class:"token comment"}},[t._v("# Force build a specific tool")]),t._v("\n")])])])},function(){var t=this.$createElement,e=this._self._c||t;return e("h2",{attrs:{id:"testing"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#testing","aria-hidden":"true"}},[this._v("#")]),this._v(" ✔️ Testing")])},function(){var t=this.$createElement,e=this._self._c||t;return e("p",[this._v("I wrote a very basic "),e("code",[this._v("test.sh")]),this._v(" script that loops over every\ntool that should be tested. You can use the "),e("code",[this._v(".spec")]),this._v(" file to configure the passed parameters during the test. It will\nsimply run the docker container with those parameters, inside a temporary\nfolder. If you see % reductions in your logs, "),e("strong",[this._v("congratulations the test\npassed")]),this._v(" 🎉")])},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"language-bash extra-class"},[s("pre",{pre:!0,attrs:{class:"language-bash"}},[s("code",[t._v("$ ./test.sh\n"),s("span",{attrs:{class:"token comment"}},[t._v("# Tests all images that have changed since last git tag")]),t._v("\n\n$ ./test.sh all\n"),s("span",{attrs:{class:"token comment"}},[t._v("# Force test all")]),t._v("\n\n$ ./test.sh "),s("span",{attrs:{class:"token variable"}},[t._v("$service")]),t._v("/"),s("span",{attrs:{class:"token variable"}},[t._v("$format")]),t._v("\n"),s("span",{attrs:{class:"token comment"}},[t._v("# Force test a specific tool")]),t._v("\n\n$ ./test.sh cli\n"),s("span",{attrs:{class:"token comment"}},[t._v("# Tests all tools against their .spec file, but with fcli directly")]),t._v("\n")])])])},function(){var t=this.$createElement,e=this._self._c||t;return e("h2",{attrs:{id:"example-contribution-workflow"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#example-contribution-workflow","aria-hidden":"true"}},[this._v("#")]),this._v(" 👥 Example Contribution Workflow")])},function(){var t=this.$createElement,e=this._self._c||t;return e("p",[this._v("Let's say you have a proposal : "),e("strong",[this._v("add an image filter (black and white, sepia...) tool to futils")])])},function(){var t=this.$createElement,e=this._self._c||t;return e("li",[this._v("Check out "),e("code",[this._v("develop")])])},function(){var t=this.$createElement,e=this._self._c||t;return e("li",[this._v("Copy "),e("code",[this._v("futils/resize")]),this._v(" to "),e("code",[this._v("futils/filter")]),this._v(" and do some magic ✨")])},function(){var t=this.$createElement,e=this._self._c||t;return e("li",[this._v("Use "),e("code",[this._v("./build.sh")]),this._v(" at the root of the repository to build the new tool.")])},function(){var t=this.$createElement,e=this._self._c||t;return e("li",[this._v("Use "),e("code",[this._v("./test.sh")]),this._v(" at the root of the repository to test the new tool.")])},function(){var t=this.$createElement,e=this._self._c||t;return e("li",[this._v("Push your feature branch and create a pull request pointing to "),e("code",[this._v("develop")]),this._v(" on the repository.")])},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("li",[t._v("The feature will be available publicly on the next release (tag and merge to master).\n"),s("ol",[s("li",[t._v("Travis builds doc and deploys it.")]),t._v(" "),s("li",[t._v("Travis builds and tests all tools and the cli.")]),t._v(" "),s("li",[t._v("Docker Hub builds and deploy all tools with tag "),s("code",[t._v("latest")]),t._v(" and "),s("code",[t._v("$VERSION")])])])])}],!1,null,null,null);i.options.__file="Contributing.md";e.default=i.exports}}]);