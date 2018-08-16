FROM futils/alpine:latest
RUN apk add curl docker jq
COPY ./cli.sh /bin/fcli.sh
RUN chmod +x /bin/fcli.sh
WORKDIR /d
ENTRYPOINT ["/bin/fcli.sh"]