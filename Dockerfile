FROM maven:3.8.5 as builder

ARG LIBRESPOT_VERSION=v1.6.2

RUN cd /root \
    && wget -q https://github.com/librespot-org/librespot-java/archive/refs/tags/$LIBRESPOT_VERSION.zip \
    && unzip -q ./$LIBRESPOT_VERSION.zip \
    && cd ./librespot-java-$LIBRESPOT_VERSION \
    && mvn clean package \
    && mv ./player/target/librespot-player-*.jar /root/player.jar

FROM alpine:3.15

RUN apk add dumb-init alsa-utils openjdk17-jre-headless

COPY --from=builder /root/player.jar /app/player.jar

WORKDIR /config

ENTRYPOINT ["dumb-init", "java", "-jar", "/app/player.jar"]
