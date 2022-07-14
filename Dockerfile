FROM maven:3.8.5 as builder

ARG LIBRESPOT_VERSION=1.6.2

RUN apt-get update \
    && apt-get install -yq wget unzip

RUN cd /root \
    && wget -q https://github.com/librespot-org/librespot-java/archive/refs/tags/v$LIBRESPOT_VERSION.zip \
    && unzip -q ./v$LIBRESPOT_VERSION.zip \
    && cd ./librespot-java-$LIBRESPOT_VERSION \
    && mvn clean package \
    && mv ./player/target/librespot-player-*.jar /player.jar

FROM alpine:latest

RUN apk add dumb-init alsa-utils openjdk17-jre

COPY --from=builder /player.jar /app/
COPY config.toml /config/

VOLUME /config
WORKDIR /config

ENTRYPOINT ["dumb-init", "java", "-jar", "/app/player.jar"]
