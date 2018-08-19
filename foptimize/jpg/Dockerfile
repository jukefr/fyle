FROM fhub/alpine-sdk:v0.1-beta1 as build
WORKDIR /
RUN apk add --no-cache libpng-dev=1.6.34-r1
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
RUN wget -O tar_pkg.tar.gz https://github.com/google/guetzli/archive/v1.0.1.tar.gz
RUN tar -xvzf tar_pkg.tar.gz
WORKDIR /guetzli-1.0.1/
RUN make

# Multi-stage build to reduce image size
FROM fhub/alpine:v0.1-beta1
WORKDIR /
RUN apk add --no-cache jpegoptim=1.4.6-r0 libjpeg-turbo-utils=1.5.3-r1 libpng=1.6.34-r1	 libstdc++=6.4.0-r8
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
COPY --from=build /guetzli-1.0.1/bin/Release/guetzli /usr/local/bin/guetzli
COPY ./entrypoint.sh /e/entrypoint.sh
RUN chmod +x /e/entrypoint.sh
VOLUME /e
WORKDIR /d

ENTRYPOINT ["/e/entrypoint.sh"]