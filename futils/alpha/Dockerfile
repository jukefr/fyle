FROM fhub/imagemagick:v0.1-beta1
WORKDIR /
COPY entrypoint.sh /e/entrypoint.sh
RUN chmod +x /e/entrypoint.sh
VOLUME /e
WORKDIR /d

ENTRYPOINT ["/e/entrypoint.sh"]
