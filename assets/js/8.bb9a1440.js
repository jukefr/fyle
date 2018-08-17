(window.webpackJsonp=window.webpackJsonp||[]).push([[8],{166:function(t,e,s){"use strict";s.r(e);var i=s(0),a=Object(i.a)({},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"content"},[t._m(0),t._v(" "),t._m(1),t._v(" "),t._m(2),t._v(" "),t._m(3),t._v(" "),s("p",[s("router-link",{attrs:{to:"/guide/futils.html"}},[t._v("futils")]),t._v(", "),s("router-link",{attrs:{to:"/guide/fconvert.html"}},[t._v("fconvert")]),t._v(" and\n"),s("router-link",{attrs:{to:"/guide/foptimize.html"}},[t._v("foptimize")]),t._v(" were\ncreated for this reason, so that everything can be available easily, without\nthe need for any parameter tuning, "),s("strong",[t._v("by using opinionated defaults")]),t._v(".\nAnyone can run a single command to get their task done without having to\nworry about dependencies or calibration.")],1),t._v(" "),t._m(4),t._v(" "),t._m(5),t._v(" "),s("p",[t._v("Then you may upload it to your newsletter. All it took was 3 commands.")]),t._v(" "),t._m(6),t._v(" "),t._m(7),t._v(" "),t._m(8),t._v(" "),s("p",[t._v("Each tool is contained in its own Dockerfile.\nThis dockerfile is pushed and built on the Docker Hub repository of the same\nname. (foptimize is foptimize on Docker Hub also, same for every other service)")]),t._v(" "),t._m(9),t._v(" "),t._m(10),t._v(" "),t._m(11),t._v(" "),t._m(12),s("p",[t._v("then on another the command would be :")]),t._v(" "),t._m(13),t._m(14),t._v(" "),s("p",[s("router-link",{attrs:{to:"/guide/CLI.html"}},[t._v("fcli")]),t._v(", a command line utility that aliases all the\ndocker functions\nis also available, instead of writing :")],1),t._v(" "),t._m(15),s("p",[t._v("You run :")]),t._v(" "),t._m(16),s("p",[t._v("To make using these tools even more convenient. Instructions on "),s("router-link",{attrs:{to:"/guide/CLI.html#installing-the-cli-linux-macos"}},[t._v("how to\ninstall the CLI are available on the futils documentation")])],1)])},[function(){var t=this.$createElement,e=this._self._c||t;return e("h1",{attrs:{id:"documentation"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#documentation","aria-hidden":"true"}},[this._v("#")]),this._v(" Documentation")])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"danger custom-block"},[e("p",{staticClass:"custom-block-title"},[this._v("WARNING")]),this._v(" "),e("p",[this._v("This project is in very early development, so things "),e("strong",[this._v("will")]),this._v(" break along the\nway. This documentation will be held up to date to help ease these transitions.")])])},function(){var t=this.$createElement,e=this._self._c||t;return e("h2",{attrs:{id:"introduction"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#introduction","aria-hidden":"true"}},[this._v("#")]),this._v(" 🚀 Introduction")])},function(){var t=this.$createElement,e=this._self._c||t;return e("p",[this._v("If you ever work on web projects and use any type of asset, you probably have\nexperienced first hand the lack of "),e("strong",[this._v("openly available")]),this._v(" and "),e("strong",[this._v("easy to use")]),this._v("\nfile utilities. Most utilities that allow you to perform these operations are\noften not maintained and perform poorly. One of the biggest problem I\nencountered for instance was that that there are dozens of options\navailable for PNG image optimization, so which one is the right one ?")])},function(){var t=this.$createElement,e=this._self._c||t;return e("p",[this._v("Calls may even be chained to achieve more complex workflows. Imagine recording\nyou screen in a "),e("code",[this._v(".mov")]),this._v(" file for instance :")])},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("ol",[s("li",[s("strong",[t._v("convert")]),t._v(" your "),s("code",[t._v(".mov")]),t._v(" file to a "),s("code",[t._v(".gif")]),t._v(" (with "),s("strong",[t._v("fconvert")]),t._v(")")]),t._v(" "),s("li",[s("strong",[t._v("resize")]),t._v(" it to "),s("code",[t._v("50%")]),t._v(" of its original size (with "),s("strong",[t._v("futils")]),t._v(")")]),t._v(" "),s("li",[s("strong",[t._v("optimize")]),t._v(" the "),s("code",[t._v("screencast.gif")]),t._v(" (with "),s("strong",[t._v("foptimize")]),t._v(")")])])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"tip custom-block"},[e("p",{staticClass:"custom-block-title"},[this._v("NOTE")]),this._v(" "),e("p",[this._v("There is work to be done to allow passing options to container, as of now these\nare very limited.")])])},function(){var t=this.$createElement,e=this._self._c||t;return e("h2",{attrs:{id:"how-it-works"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#how-it-works","aria-hidden":"true"}},[this._v("#")]),this._v(" ✨ How It Works")])},function(){var t=this.$createElement,e=this._self._c||t;return e("p",[e("img",{attrs:{src:"https://s3.eu-west-3.amazonaws.com/juke-github/draw.jpg",alt:"drawing skillz"}})])},function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("p",[t._v("A tool is composed of a "),s("strong",[t._v("service")]),t._v(" and a "),s("strong",[t._v("format")]),t._v(", for instance "),s("strong",[t._v("optimize")]),t._v("\nand "),s("strong",[t._v("gif")]),t._v(" becomes "),s("code",[t._v("foptimize/gif")]),t._v(", "),s("strong",[t._v("convert")]),t._v(" and "),s("strong",[t._v("video")]),t._v(" becomes\n"),s("code",[t._v("fconvert/video")]),t._v(".")])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"tip custom-block"},[e("p",{staticClass:"custom-block-title"},[this._v("NOTE")]),this._v(" "),e("p",[this._v("It was originally intended to have the image name for "),e("code",[this._v("video")]),this._v(" be the specific\nformats such as "),e("code",[this._v("mp4-mov")]),this._v(", however as it is impossible (to my knowledge) to\nalias an image without building anything. So this would be a computational\nwaste and/or nightmare to deploy. If you know of a way to achieve such a\nresult please do open a ticket about it.")])])},function(){var t=this.$createElement,e=this._self._c||t;return e("p",[this._v("Each repository contains its own unique tool (service/format combo). "),e("strong",[this._v("I try\nto keep their arguments consistent to ease memorization.")]),this._v(" If in one repository\nyou type :")])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"language-bash extra-class"},[e("pre",{pre:!0,attrs:{class:"language-bash"}},[e("code",[this._v("$ docker run -v "),e("span",{attrs:{class:"token variable"}},[e("span",{attrs:{class:"token variable"}},[this._v("$(")]),e("span",{attrs:{class:"token function"}},[this._v("pwd")]),e("span",{attrs:{class:"token variable"}},[this._v(")")])]),this._v(":/d/ foptimize/png input.png\n")])])])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"language-bash extra-class"},[e("pre",{pre:!0,attrs:{class:"language-bash"}},[e("code",[this._v("$ docker run -v "),e("span",{attrs:{class:"token variable"}},[e("span",{attrs:{class:"token variable"}},[this._v("$(")]),e("span",{attrs:{class:"token function"}},[this._v("pwd")]),e("span",{attrs:{class:"token variable"}},[this._v(")")])]),this._v(":/d/ fconvert/image input.png output.jpg\n")])])])},function(){var t=this.$createElement,e=this._self._c||t;return e("h2",{attrs:{id:"cli"}},[e("a",{staticClass:"header-anchor",attrs:{href:"#cli","aria-hidden":"true"}},[this._v("#")]),this._v(" 🐳 CLI")])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"language-bash extra-class"},[e("pre",{pre:!0,attrs:{class:"language-bash"}},[e("code",[this._v("$ docker run -v "),e("span",{attrs:{class:"token variable"}},[e("span",{attrs:{class:"token variable"}},[this._v("$(")]),e("span",{attrs:{class:"token function"}},[this._v("pwd")]),e("span",{attrs:{class:"token variable"}},[this._v(")")])]),this._v(":/d/ foptimize/png input.png\n")])])])},function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"language-bash extra-class"},[e("pre",{pre:!0,attrs:{class:"language-bash"}},[e("code",[this._v("$ fcli o png input.png\n")])])])}],!1,null,null,null);a.options.__file="README.md";e.default=a.exports}}]);