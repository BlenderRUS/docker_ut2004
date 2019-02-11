FROM ubuntu:18.04 as stage1

RUN dpkg --add-architecture i386 && apt update && apt install -y curl wget file bzip2 gzip unzip file python util-linux ca-certificates binutils bc jq \
lib32gcc1 libstdc++6 libstdc++6:i386 libsdl1.2debian libstdc++5:i386

WORKDIR /tmp

### Get server files
RUN wget https://files.linuxgsm.com/UnrealTournament2004/ut2004-server-3369-2-ultimate-linux.tar.bz2

### Create server/logs folder
RUN mkdir -p /srv/ut2004/logs

### Unpack server files
RUN tar -xvjf ut2004-server-3369-2-ultimate-linux.tar.bz2 -C /srv/ut2004

### Copy config file
COPY ut2k4server.ini /srv/ut2004/System

### Copy entrypoint
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /srv/ut2004/System

### Open ports
EXPOSE 7777/udp
EXPOSE 7778/udp

ENTRYPOINT ["docker-entrypoint.sh"]