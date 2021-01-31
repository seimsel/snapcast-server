FROM rust:alpine

EXPOSE 1704 1705 1780

RUN apk update && apk add \
  g++ \
  make \
  alsa-lib-dev

RUN cargo install librespot
RUN apk add snapcast-server

ENTRYPOINT ["snapserver"]
