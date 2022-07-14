# librespot-java-docker

Dockerfiles and image for [librespot-java](https://github.com/librespot-org/librespot-java) with alsa backend.

> librespot-java is a port of [librespot](https://github.com/librespot-org/librespot), originally written in Rust, which has evolved into the most up-to-date open-source Spotify client.

## Deploy image

Pull and deploy (multiarch) image in a Docker container:

```text
docker run -d --network host agneev/librespot-java
```

### Using Docker Compose

```sh
git clone https://github.com/agneevX/librespot-java-docker

cd librespot-java-docker
docker compose up -d
```

To pull the image only, run:

```text
docker pull agneev/librespot-java
```

### Build from source

This compiles from the latest code in the `master` branch of `librespot-java`.

```sh
git clone https://github.com/agneevX/librespot-java-docker

docker build . -f ./Dockerfile.source -t librespot-java:master

docker run -d --network host librespot-java:master
```

## Configuration

The main config file is available in `./user-data/config.toml`. Settings such as device name or sound quality can be customized here.

librespot-java documentation available [here](https://github.com/librespot-org/librespot-java/blob/dev/player/README.md).

For audio output, I've set `player.mixerSearchKeywords` to `plughw:0,0` on the Raspberry Pi 4, so it's able to output properly.

## Network mode and auth

By default, the compose files use host networking (not available on Windows) so that devices in the LAN are able to connect (although there's a delay).

Connecting to a Spotify Premium account is recommended. The docs is linked above.

When connected, `network_mode: host` can be removed in the compose file and brought up.

