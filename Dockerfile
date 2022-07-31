FROM maven:latest as builder

ARG LIBRESPOT_VERSION=1.6.2

RUN apt-get update \
    && apt-get install -yq wget unzip

RUN cd /root \
    && wget https://github.com/librespot-org/librespot-java/archive/refs/tags/v$LIBRESPOT_VERSION.zip \
    && unzip v*.zip \
    && cd librespot* \
    && mvn clean package

FROM alpine:latest as final

RUN apk -U add \
    dumb-init \
    openjdk17-jre \
    alsa-utils

COPY --from=builder /root/librespot*/player/target/librespot-player-*.jar /app/player.jar
COPY config.toml /config/

VOLUME /config
WORKDIR /config

ENTRYPOINT ["dumb-init", "java", "-jar", "/app/player.jar"]
