# syntax=docker.io/docker/dockerfile:1.4.0
FROM python:3.11-alpine

LABEL org.opencontainers.image.source https://github.com/chorrell/docker-diceware

RUN set -ex \
    && pip install diceware

COPY --link docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["diceware"]