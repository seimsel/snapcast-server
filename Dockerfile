ARG ARCH=amd64
ARG SNAPCAST_VERSION=0.23.0

FROM rust:1.45 AS librespot

RUN apt-get update && apt-get --yes install \
  build-essential \
  libasound2-dev \
  avahi-daemon \
  gettext \
  && apt-get clean && rm -fR /var/lib/apt/lists

RUN cargo install librespot

FROM debian:buster

EXPOSE 1704 1705 1780

RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl libasound2 mpv \
 && curl -L -o /tmp/snapserver.deb "https://github.com/badaix/snapcast/releases/download/v${SNAPCAST_VERSION}/snapserver_${SNAPCAST_VERSION}-1_${ARCH}.deb" \
 && dpkg -i /tmp/snapserver.deb || apt-get install -f -y --no-install-recommends \
 && apt-get clean && rm -fR /var/lib/apt/lists
 
COPY --from=librespot /usr/local/cargo/bin/librespot /usr/local/bin/
COPY ./entrypoint.sh ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
