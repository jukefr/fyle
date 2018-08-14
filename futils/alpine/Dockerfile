FROM alpine:3.8
RUN apk add wget
RUN mkdir /d
RUN addgroup -S docker && adduser -S -G docker docker
RUN chown -R docker:docker /d
RUN chmod g+s /d
VOLUME /d
