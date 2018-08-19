FROM fhub/alpine-sdk:v0.1-beta1 as build
WORKDIR /
RUN mkdir svgcleaner
WORKDIR /svgcleaner/
RUN apk add --no-cache autoconf=2.69-r2 automake=1.16.1-r0
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
RUN wget -O tar_pkg.tar.gz https://github.com/RazrFalcon/svgcleaner-gui/releases/download/v0.9.5/svgcleaner_linux_x86_64_0.9.5.tar.gz
RUN tar -xvzf tar_pkg.tar.gz

# Multi-stage build to reduce image size
FROM fhub/alpine:v0.1-beta1
WORKDIR /
RUN apk add --no-cache npm=8.11.4-r0
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
RUN npm i -g svgo
COPY --from=build /svgcleaner/svgcleaner /usr/local/bin/svgcleaner
COPY ./entrypoint.sh /e/entrypoint.sh
RUN chmod +x /e/entrypoint.sh
VOLUME /e
WORKDIR /d

ENTRYPOINT ["/e/entrypoint.sh"]