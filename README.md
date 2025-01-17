# docker-adoptOpenJDK-21

Dockerfile for a dockerimage containing Adoptium OpenJDK 21 on [Debian 12](https://github.com/arthurpicht/docker-debian-12)

## Build image locally

    docker build -t arthurpicht/debian-12:latest https://github.com/arthurpicht/docker-debian-12.git#develop
    docker build -t arthurpicht/adoptopenjdk-21:latest https://github.com/arthurpicht/docker-adoptOpenJDK-21.git#develop

## Update History:

* 2024-11-13: Builds dynamically latest version of JDK 21
* 2024-11-13: jdk-21.0.5+11 from 16 October 2024
* 2024-04-23: jdk-21.0.3+9 from 18 April 2024

## References

* [adoptium releases](https://adoptium.net/de/temurin/releases/)
* [binaries on github](https://github.com/adoptium/temurin21-binaries)
* [adoptium API](https://github.com/adoptium/api.adoptium.net/blob/main/docs/cookbook.adoc#example-three-scripting-a-download-using-the-adoptium-api)
