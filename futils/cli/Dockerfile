FROM fhub/alpine:v0.1-beta1
RUN apk add --no-cache curl=7.61.0-r0 docker=18.03.1-r0 jq=1.6_rc1-r1
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/*
COPY ./cli.sh /bin/fcli.sh
RUN chmod +x /bin/fcli.sh
WORKDIR /d
ENTRYPOINT ["/bin/fcli.sh"]