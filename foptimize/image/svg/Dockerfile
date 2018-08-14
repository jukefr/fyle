FROM futils/alpine:latest as build
WORKDIR /
RUN mkdir svgcleaner
WORKDIR svgcleaner/
RUN apk add alpine-sdk autoconf automake
RUN wget -O tar_pkg.tar.gz https://github.com/RazrFalcon/svgcleaner-gui/releases/download/v0.9.5/svgcleaner_linux_x86_64_0.9.5.tar.gz
RUN tar -xvzf tar_pkg.tar.gz

# Multi-stage build to reduce image size
FROM futils/alpine:latest
WORKDIR /
RUN apk add npm
RUN npm i -g svgo
COPY --from=build /svgcleaner/svgcleaner /usr/local/bin/svgcleaner
COPY ./entrypoint.sh /e/entrypoint.sh
RUN chmod +x /e/entrypoint.sh
VOLUME /e
WORKDIR /d

ENTRYPOINT ["/e/entrypoint.sh"]