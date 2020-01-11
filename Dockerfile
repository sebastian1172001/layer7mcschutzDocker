
# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        openjdk:8-jre-slim

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN apk update  \
 && apk add --no-cache --update curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 iptables ipset sudo \
 && useradd -D -h /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]