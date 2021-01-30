FROM rust:alpine

RUN apk add
  g++ \
  make \
  libasound2-dev

RUN cargo install librespot
RUN apk add snapcast-server

COPY snapserver.conf /etc/snapserver.conf
