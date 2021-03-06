FROM        quay.io/pterodactyl/core:java

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

USER root

RUN apt update --yes \
 && apt install curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 iptables ipset sudo --yes

ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]