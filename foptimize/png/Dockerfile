FROM fhub/alpine-sdk:v0.1-beta1 as build
WORKDIR /
RUN apk add --no-cache zlib-dev=1.2.11-r1
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
RUN wget -O tar_pkg.tar.gz  https://github.com/amadvance/advancecomp/releases/download/v2.1/advancecomp-2.1.tar.gz
RUN tar -xvzf tar_pkg.tar.gz
WORKDIR /advancecomp-2.1/
RUN ./configure
RUN make

FROM fhub/alpine:v0.1-beta1
RUN apk add --no-cache optipng=0.7.7-r0 pngcrush=1.8.13-r0 pngquant=2.12.0-r0 zlib-dev=1.2.11-r1 libstdc++=6.4.0-r8
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
WORKDIR /
COPY --from=build /advancecomp-2.1/advpng /usr/local/bin/advpng
COPY ./entrypoint.sh /e/entrypoint.sh
RUN chmod +x /e/entrypoint.sh
VOLUME /e
WORKDIR /d

ENTRYPOINT ["/e/entrypoint.sh"]

