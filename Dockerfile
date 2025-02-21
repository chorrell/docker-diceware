# syntax=docker/dockerfile:1
FROM python:3.13-alpine

LABEL org.opencontainers.image.source=https://github.com/chorrell/docker-diceware

RUN set -ex \
    && pip install --no-cache-dir diceware

COPY --link docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["diceware"]