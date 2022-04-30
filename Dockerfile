FROM maven:3.8.5 as builder

RUN mkdir /compile \
    && cd /compile \
    && git clone https://github.com/librespot-org/librespot-java \
    && cd ./librespot-java \
    && mvn clean package

FROM alpine:3.15

RUN apk add dumb-init alsa-utils openjdk17-jre-headless

COPY --from=builder /compile/librespot-java/player/target/librespot-player-*.jar /app/player.jar

WORKDIR /config

ENTRYPOINT ["dumb-init", "java", "-jar", "/app/player.jar"]
