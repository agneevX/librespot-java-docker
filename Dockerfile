FROM maven:3.8.5 as builder

ARG LIBRESPOT_VERSION=1.6.2

RUN apt-get update \
    && apt-get install -yq wget unzip

RUN cd /root \
    && wget -q https://github.com/librespot-org/librespot-java/archive/refs/tags/v$LIBRESPOT_VERSION.zip \
    && unzip -q ./v$LIBRESPOT_VERSION.zip \
    && cd ./librespot-java-$LIBRESPOT_VERSION \
    && mvn -T $(grep -c ^processor /proc/cpuinfo) --batch-mode clean package \
    && mv ./player/target/librespot-player-*.jar /root/player.jar

FROM alpine:3.15

RUN apk add dumb-init alsa-utils openjdk17-jre-headless

COPY --from=builder /root/player.jar /app/player.jar
COPY config.toml /config/config.toml

VOLUME /config
WORKDIR /config

ENTRYPOINT ["dumb-init", "java", "-jar", "/app/player.jar"]
