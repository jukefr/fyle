FROM fhub/alpine:v0.1-beta1
RUN apk add --no-cache mpg123=1.25.10-r0
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
WORKDIR /
COPY ./entrypoint.sh /e/entrypoint.sh
RUN chmod +x /e/entrypoint.sh
VOLUME /e
WORKDIR /d

ENTRYPOINT ["/e/entrypoint.sh"]