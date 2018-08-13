FROM foptimize/image
WORKDIR /
COPY ./entrypoint.sh /e/entrypoint.sh
VOLUME /e
WORKDIR /d
ENTRYPOINT ["/e/entrypoint.sh"]