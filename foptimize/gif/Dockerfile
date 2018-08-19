FROM fhub/alpine-sdk:v0.1-beta1 as build
WORKDIR /
RUN apk add --no-cache autoconf=2.69-r2 automake=1.16.1-r0
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
RUN wget -O tar_pkg.tar.gz https://github.com/kornelski/giflossy/archive/1.91.tar.gz
RUN tar -xvzf tar_pkg.tar.gz
WORKDIR /giflossy-1.91/
RUN autoreconf -i
RUN ./configure
RUN make install

# Multi-stage build to reduce image size
FROM fhub/alpine:v0.1-beta1
WORKDIR /
COPY --from=build /usr/local/bin/gifsicle /usr/local/bin/gifsicle
COPY ./entrypoint.sh /e/entrypoint.sh
RUN chmod +x /e/entrypoint.sh
VOLUME /e
WORKDIR /d

ENTRYPOINT ["/e/entrypoint.sh"]