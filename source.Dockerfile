FROM maven:latest as builder

RUN cd /root \
    && git clone https://github.com/librespot-org/librespot-java \
    && cd librespot-java \
    && mvn clean package

FROM alpine:latest as final

RUN apk -U add \
    dumb-init \
    openjdk17-jre \
    alsa-utils 

COPY --from=builder /root/librespot-java/player/target/librespot-player-*.jar /app/player.jar
COPY config.toml /config/

VOLUME /config
WORKDIR /config

ENTRYPOINT ["dumb-init", "java", "-jar", "/app/player.jar"]
