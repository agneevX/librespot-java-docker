FROM alpine:3.15

RUN apk add alsa-utils openjdk15

ADD https://github.com/librespot-org/librespot-java/releases/download/v1.6.2/librespot-player-1.6.2.jar /app/player.jar

WORKDIR /config

ENTRYPOINT ["java", "-jar", "/app/player.jar"]
