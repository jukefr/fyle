FROM futils/alpine
RUN apk add mpg123
WORKDIR /
COPY ./entrypoint.sh /e/entrypoint.sh
VOLUME /e
WORKDIR /d
ENTRYPOINT ["/e/entrypoint.sh"]