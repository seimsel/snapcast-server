FROM rust:alpine

EXPOSE 1704 1705 1780

RUN apk add \
  g++ \
  make \
  libasound2-dev

RUN cargo install librespot
RUN apk add snapcast-server
