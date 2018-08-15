(window.webpackJsonp=window.webpackJsonp||[]).push([[5],{165:function(t,e,s){"use strict";s.r(e);var i=s(0),a=Object(i.a)({},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"content"},[t._m(0),t._v(" "),t._m(1),t._v(" "),t._m(2),t._v(" "),t._m(3),t._v(" "),t._m(4),t._v(" "),t._m(5),t._v(" "),t._m(6),t._v(" "),s("p",[t._v("Then you may upload it to your newsletter. All it took was 3 commands.")]),t._v(" "),t._m(7),t._v(" "),t._m(8),t._v(" "),t._m(9),t._v(" "),s("p",[t._v("Each tool is contained in its own Dockerfile.\nThis dockerfile is pushed and built on the Docker Hub repository of the same\nname. (foptimize is foptimize on Docker Hub also, same for every other service)")]),t._v(" "),t._m(10),t._v(" "),t._m(11),t._v(" "),t._m(12),t._v(" "),t._m(13),s("p",[t._v("then on another the command would be :")]),t._v(" "),t._m(14),t._m(15),t._v(" "),s("p",[s("router-link",{attrs:{to:"/guide/futils.html#cli"}},[t._v("fcli")]),t._v(", a command line utility that aliases all the\ndocker functions\nis also available, instead of writing :")],1),t._v(" "),t._m(16),s("p",[t._v("You run :")]),t._v(" "),t._m(17),s("p",[t._v("To make using these tools even more convenient.")]),t._v(" "),t._m(18),t._v(" "),t._m(19),t._m(20),t._v(" "),t._m(21),t._v(" "),s("p",[t._v("If you feel like the way something works could be improved, or have a feature\nyou want to add to this project, feel free open an issue to talk about it.\nAs this is early stage, you can open issues for minor questions if you happen\nto have any troubles, this most probably will be caused by bad documentation on\nmy part so please do inform me.")]),t._v(" "),s("p",[t._v("Everything gets tested by Travis and built by Docker Hub automatically for\nthe deployment phase.")]),t._v(" "),s("p",[t._v("I use the standard "),s("a",{attrs:{href:"https://guides.github.com/introduction/flow/",target:"_blank",rel:"noopener noreferrer"}},[t._v("git flow"),s("OutboundLink")],1),t._v("\nmodel (master, develop, feature/, release/, hotfix/, v) in this repository\nso please familiarize yourself with this workflow. The building, testing and\ndeployment phase depend on it. I also like to keep my lines under 80\ncharacters but that is just personal taste you don't have to adhere.")]),t._v(" "),t._m(22),t._v(" "),t._m(23),t._v(" "),t._m(24),t._v(" "),t._m(25)])},[function(){var t=this.$createElement,e=this._self._c||t;return e("h1",{attrs:{id:"documentation"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#documentation","aria-hidden":"true"}},[this._v("#")]),this._v(" Documentation")])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"danger custom-block"},[e("p",{staticClass:"custom-block-title"},[this._v("WARNING")]),this._v(" "),e("p",[this._v("This project is in very early development, so things "),e("strong",[this._v("will")]),this._v(" break along the\nway. This documentation will be held up to date to help ease these transitions.")])])},function(){var t=this.$createElement,e=this._self._c||t;return e("h2",{attrs:{id:"introduction"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#introduction","aria-hidden":"true"}},[this._v("#")]),this._v(" 🚀 Introduction")])},function(){var t=this.$createElement,e=this._self._c||t;return e("p",[this._v("If you ever work on web projects and use any type of asset, you probably have\nexperienced first hand the lack of "),e("strong",[this._v("openly available")]),this._v(" and "),e("strong",[this._v("easy to use")]),this._v("\nfile utilities. Most utilities that allow you to perform these operations are\noften not maintained and perform poorly. One of the biggest problem I\nencountered for instance was that that there are dozens of options\navailable for PNG image optimization, so which one is the right one ?")])},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("p",[s("a",{attrs:{href:"/futils"}},[t._v("futils")]),t._v(", "),s("a",{attrs:{href:"/fconvert"}},[t._v("fconvert")]),t._v(" and "),s("a",{attrs:{href:"/foptimize"}},[t._v("foptimize")]),t._v(" were\ncreated for this reason, so that everything can be available easily, without\nthe need for any parameter tuning, "),s("strong",[t._v("by using opinionated defaults")]),t._v(".\nAnyone can run a single command to get their task done without having to\nworry about dependencies or calibration.")])},function(){var t=this.$createElement,e=this._self._c||t;return e("p",[this._v("Calls may even be chained to achieve more complex workflows. Imagine recording\nyou screen in a "),e("code",[this._v(".mov")]),this._v(" file for instance :")])},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("ol",[s("li",[s("strong",[t._v("convert")]),t._v(" your "),s("code",[t._v(".mov")]),t._v(" file to a "),s("code",[t._v(".gif")]),t._v(" (with "),s("strong",[t._v("fconvert")]),t._v(")")]),t._v(" "),s("li",[s("strong",[t._v("resize")]),t._v(" it to "),s("code",[t._v("50%")]),t._v(" of its original size (with "),s("strong",[t._v("futils")]),t._v(")")]),t._v(" "),s("li",[s("strong",[t._v("optimize")]),t._v(" the "),s("code",[t._v("screencast.gif")]),t._v(" (with "),s("strong",[t._v("foptimize")]),t._v(")")])])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"tip custom-block"},[e("p",{staticClass:"custom-block-title"},[this._v("NOTE")]),this._v(" "),e("p",[this._v("There is work to be done to allow passing options to container, as of now these\nare very limited.")])])},function(){var t=this.$createElement,e=this._self._c||t;return e("h2",{attrs:{id:"essentials"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#essentials","aria-hidden":"true"}},[this._v("#")]),this._v(" ⚡️ Essentials")])},function(){var t=this.$createElement,e=this._self._c||t;return e("p",[e("img",{attrs:{src:"https://s3.eu-west-3.amazonaws.com/juke-github/draw.jpg",alt:"drawing skillz"}})])},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("p",[t._v("A tool is composed of a "),s("strong",[t._v("service")]),t._v(" and a "),s("strong",[t._v("format")]),t._v(", for instance "),s("strong",[t._v("optimize")]),t._v("\nand "),s("strong",[t._v("gif")]),t._v(" becomes "),s("code",[t._v("foptimize/gif")]),t._v(", "),s("strong",[t._v("convert")]),t._v(" and "),s("strong",[t._v("video")]),t._v(" becomes\n"),s("code",[t._v("fconvert/video")]),t._v(".")])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"tip custom-block"},[e("p",{staticClass:"custom-block-title"},[this._v("NOTE")]),this._v(" "),e("p",[this._v("It was originally intended to have the image name for "),e("code",[this._v("video")]),this._v(" be the specific\nformats such as "),e("code",[this._v("mp4-mov")]),this._v(", however as it is impossible (to my knowledge) to\nalias an image without building anything. So this would be a computational\nwaste and/or nightmare to deploy. If you know of a way to achieve such a\nresult please do open a ticket about it.")])])},function(){var t=this.$createElement,e=this._self._c||t;return e("p",[this._v("Each repository contains its own unique tool (service/format combo). "),e("strong",[this._v("I try\nto keep their arguments consistent to ease memorization.")]),this._v(" If in one repository\nyou type :")])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"language-bash extra-class"},[e("pre",{pre:!0,attrs:{class:"language-bash"}},[e("code",[this._v("$ docker run -v "),e("span",{attrs:{class:"token variable"}},[e("span",{attrs:{class:"token variable"}},[this._v("$(")]),e("span",{attrs:{class:"token function"}},[this._v("pwd")]),e("span",{attrs:{class:"token variable"}},[this._v(")")])]),this._v(":/d/ foptimize/png input.png\n")])])])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"language-bash extra-class"},[e("pre",{pre:!0,attrs:{class:"language-bash"}},[e("code",[this._v("$ docker run -v "),e("span",{attrs:{class:"token variable"}},[e("span",{attrs:{class:"token variable"}},[this._v("$(")]),e("span",{attrs:{class:"token function"}},[this._v("pwd")]),e("span",{attrs:{class:"token variable"}},[this._v(")")])]),this._v(":/d/ fconvert/image input.png output.jpg\n")])])])},function(){var t=this.$createElement,e=this._self._c||t;return e("h2",{attrs:{id:"cli"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#cli","aria-hidden":"true"}},[this._v("#")]),this._v(" 🔮 CLI")])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"language-bash extra-class"},[e("pre",{pre:!0,attrs:{class:"language-bash"}},[e("code",[this._v("$ docker run -v "),e("span",{attrs:{class:"token variable"}},[e("span",{attrs:{class:"token variable"}},[this._v("$(")]),e("span",{attrs:{class:"token function"}},[this._v("pwd")]),e("span",{attrs:{class:"token variable"}},[this._v(")")])]),this._v(":/d/ foptimize/png input.png\n")])])])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"language-bash extra-class"},[e("pre",{pre:!0,attrs:{class:"language-bash"}},[e("code",[this._v("$ fcli o png input.png\n")])])])},function(){var t=this.$createElement,e=this._self._c||t;return e("h3",{attrs:{id:"installing-the-cli"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#installing-the-cli","aria-hidden":"true"}},[this._v("#")]),this._v(" Installing the CLI")])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"language-bash extra-class"},[e("pre",{pre:!0,attrs:{class:"language-bash"}},[e("code",[this._v("$ "),e("span",{attrs:{class:"token function"}},[this._v("curl")]),this._v(" https://raw.githubusercontent.com/jukefr/fyle/master/futils/cli/install "),e("span",{attrs:{class:"token operator"}},[this._v("|")]),this._v(" sh\n")])])])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"danger custom-block"},[e("p",{staticClass:"custom-block-title"},[this._v("WARNING")]),this._v(" "),e("p",[this._v("As this project is in a very early stage, I have made it so that this CLI will\nautomatically update to the latest version pushed to master. Expect some\nbreaking changes, I will keep the "),e("code",[this._v("--help")]),this._v(" command up to date in accordance\nwith the current usages.")])])},function(){var t=this.$createElement,e=this._self._c||t;return e("h2",{attrs:{id:"contributing"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#contributing","aria-hidden":"true"}},[this._v("#")]),this._v(" 👥 Contributing")])},function(){var t=this.$createElement,e=this._self._c||t;return e("p",[this._v("To build the images dynamically I have made a "),e("code",[this._v("build.sh")]),this._v(" script that for each\nservice loops over every folder inside the service, so every tool and builds\nan image tagged with the service name and folder name for the format.\nYou can also pass a directory to the build script like so "),e("code",[this._v("./build.sh futils/resize")]),this._v(" to force a build only on this image.")])},function(){var t=this.$createElement,e=this._self._c||t;return e("h2",{attrs:{id:"testing"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#testing","aria-hidden":"true"}},[this._v("#")]),this._v(" ✔️ Testing")])},function(){var t=this.$createElement,e=this._self._c||t;return e("p",[this._v("I wrote a very basic "),e("code",[this._v("test.sh")]),this._v(" script. For each service it loops over the\nfolders inside of it to know what tools should be tested. You can use the "),e("code",[this._v(".spec")]),this._v(" file to configure the passed parameters during the test. It will\nsimply run the docker container a URL, inside a temporary\nfolder. If you see % reductions in your logs, "),e("strong",[this._v("congratulations the test\npassed")]),this._v(" 🎉")])},function(){var t=this.$createElement,e=this._self._c||t;return e("p",[this._v("You can also pass a directory to the test script like so "),e("code",[this._v("./test.sh futils/resize")]),this._v(" to force a test only on this image.")])}],!1,null,null,null);a.options.__file="README.md";e.default=a.exports}}]);