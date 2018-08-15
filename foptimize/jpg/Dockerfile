FROM futils/alpine:latest as build
WORKDIR /
RUN apk add alpine-sdk libpng-dev
RUN wget -O tar_pkg.tar.gz https://github.com/google/guetzli/archive/v1.0.1.tar.gz
RUN tar -xvzf tar_pkg.tar.gz
WORKDIR guetzli-1.0.1/
RUN make

# Multi-stage build to reduce image size
FROM futils/alpine:latest
WORKDIR /
RUN apk add jpegoptim libjpeg-turbo-utils libpng libstdc++
COPY --from=build /guetzli-1.0.1/bin/Release/guetzli /usr/local/bin/guetzli
COPY ./entrypoint.sh /e/entrypoint.sh
RUN chmod +x /e/entrypoint.sh
VOLUME /e
WORKDIR /d

ENTRYPOINT ["/e/entrypoint.sh"]