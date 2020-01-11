FROM        quay.io/pterodactyl/core:java-glibc

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN apt update --yes \
 && apt install curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 iptables ipset sudo --yes\
 && useradd -D -h /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]