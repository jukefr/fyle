FROM alpine:3.8
RUN apk add --no-cache wget=1.19.5-r0
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
RUN mkdir /d
RUN addgroup -S docker && adduser -S -G docker docker
RUN chown -R docker:docker /d
RUN chmod g+s /d
VOLUME /d
