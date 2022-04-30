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

## Alternative methods

### Pre-compiled release

The latest binary release is downloaded from GitHub Releases and exectuted in the container.

```sh
git clone https://github.com/agneevX/librespot-java-docker

cd librespot-java-docker
docker-compose -f docker-compose-gh-release.yml up -d
```

### Compile from source

This compiles from the latest code in the `master` branch of the repository, and is bleeding edge, therefore prone to breaking.

```sh
git clone https://github.com/agneevX/librespot-java-docker

cd librespot-java-docker
docker-compose -f docker-compose-source.yml up -d

# Or build with Docker build
docker build . -f Dockerfile.source -t librespot-java:source
```
