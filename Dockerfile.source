FROM maven:3.8.5 as builder

RUN cd /root \
    && git clone https://github.com/librespot-org/librespot-java \
    && cd ./librespot-java \
    && mvn clean package \
    && mv ./player/target/librespot-player-*.jar /root/player.jar

FROM alpine:latest

RUN apk add dumb-init alsa-utils openjdk17-jre

COPY --from=builder /root/player.jar /app/player.jar
COPY config.toml /config/config.toml

VOLUME /config
WORKDIR /config

ENTRYPOINT ["dumb-init", "java", "-jar", "/app/player.jar"]
