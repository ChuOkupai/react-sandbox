FROM alpine

ARG USER

RUN apk add --no-cache nodejs npm

USER $USER
WORKDIR /app

ENTRYPOINT ["sh", "/app/start.sh"]
