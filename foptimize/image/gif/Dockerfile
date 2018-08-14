FROM futils/alpine as build
WORKDIR /
RUN apk add alpine-sdk autoconf automake
RUN wget -O tar_pkg.tar.gz https://github.com/kornelski/giflossy/archive/1.91.tar.gz
RUN tar -xvzf tar_pkg.tar.gz
WORKDIR giflossy-1.91/
RUN autoreconf -i
RUN ./configure
RUN make install

# Multi-stage build to reduce image size
FROM futils/alpine
WORKDIR /
COPY --from=build /usr/local/bin/gifsicle /usr/local/bin/gifsicle
COPY ./entrypoint.sh /e/entrypoint.sh
RUN chmod +x /e/entrypoint.sh
VOLUME /e
WORKDIR /d
ENTRYPOINT ["/e/entrypoint.sh"]