# librespot-java-docker

Dockerfile for [librespot-java](https://github.com/librespot-org/librespot-java) with alsa backend.

Tested on Raspberry Pi 4.

## Deploy and Run

### Precompiled binary

The latest binary release is downloaded from GitHub Releases and exectuted in the container.

```sh
git clone https://github.com/agneevX/librespot-java-docker

cd librespot-java-docker

# Using Docker-compose
docker-compose up -d -f docker-compose-precompiled-release.yml
```

### Compile from latest release

Recommended. This compiles from the code of the latest `librespot-java` tagged release.

```sh
git clone https://github.com/agneevX/librespot-java-docker

cd librespot-java-docker

docker-compose up -d
```

### Compile from source (`master`)

This compiles from the latest code in the `master` branch of the repository, and is bleeding edge, therefore prone to breaking.

```sh
git clone https://github.com/agneevX/librespot-java-docker

cd librespot-java-docker

docker-compose up -d -f docker-compose-source.yml

# Or build with Docker build
docker build . -f Dockerfile.source -t librespot-java:source
```
