# docker_ut2004
Unreal Tournament 2004 Docker Server  
Based on LinuxGSM server package  
  
`docker-compose.yml`
```
version: '3.3'

services:
  application:
    image: blenderoid/ut2004:latest
    container_name: ut2004
    ports:
      - 7777/udp
      - 7778/udp
    environment:
      - UT2K_DEFAULTMAP=${UT2K_DEFAULTMAP:-DM-Rankin}
    volumes:
      - type: bind
        source: ./data/ut2k4server.ini
        target: /srv/ut2004/System/ut2k4server.ini
        read_only: true
      - type: bind
        source: ./data/logs
        target: /srv/ut2004/logs
        read_only: true
    restart: always
```
