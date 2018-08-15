FROM futils/alpine:latest as build
WORKDIR /
RUN apk add alpine-sdk zlib-dev
RUN wget -O tar_pkg.tar.gz  https://github.com/amadvance/advancecomp/releases/download/v2.1/advancecomp-2.1.tar.gz
RUN tar -xvzf tar_pkg.tar.gz
WORKDIR advancecomp-2.1
RUN ./configure
RUN make

FROM futils/alpine:latest
RUN apk add optipng pngcrush pngquant zlib-dev libstdc++
WORKDIR /
COPY --from=build /advancecomp-2.1/advpng /usr/local/bin/advpng
COPY ./entrypoint.sh /e/entrypoint.sh
RUN chmod +x /e/entrypoint.sh
VOLUME /e
WORKDIR /d

ENTRYPOINT ["/e/entrypoint.sh"]

