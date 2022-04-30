# librespot-java-docker

Dockerfiles for [librespot-java](https://github.com/librespot-org/librespot-java) with alsa backend.

Tested on Raspberry Pi 4.

## Deploy container

Compile executable from the code of the latest `librespot-java` tagged release.

```sh
git clone https://github.com/agneevX/librespot-java-docker

cd librespot-java-docker
docker-compose up -d
```

### Alternative methods

#### Pre-compiled release

The latest binary release is downloaded from GitHub Releases and ran in the container.

```sh
git clone https://github.com/agneevX/librespot-java-docker

cd librespot-java-docker
docker-compose -f docker-compose-gh-release.yml up -d
```

#### Compile from source

This compiles from the latest code in the `master` branch of the repository, and is bleeding edge, therefore prone to breaking.

```sh
git clone https://github.com/agneevX/librespot-java-docker

cd librespot-java-docker
docker-compose -f docker-compose-source.yml up -d

# Or build with Docker build
docker build . -f Dockerfile.source -t librespot-java:source
```

## Configuration

The main config file is available at `./user-data/config.toml`.

Some settings needed to be set to your liking, such as device name or sound quality.

Documentation available [here](https://github.com/librespot-org/librespot-java/blob/dev/player/README.md).

For audio output, I've set `player.mixerSearchKeywords` to `plughw:0,0` on the Raspberry Pi 4, so it's able to output properly.

## Network mode and auth

By default, the compose files use host networking (not available on Windows) so that local devices in the LAN are able to connect (although there's a delay).

Connecting a Spotify Premium account is recommended. The docs is linked above.

When connected, `network_mode: host` can be removed in the compose file and brought up.

