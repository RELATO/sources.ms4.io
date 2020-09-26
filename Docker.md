# Docker

## docker easy installation

> Below is the command to install 19.03 version. You can change to another version if you want
```
curl https://releases.rancher.com/install-docker/19.03.sh | sh

```

## docker-compose easy installation
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
``` 

### docker-compose binaries for aarch64

Reference: https://github.com/ubiquiti/docker-compose-aarch64

This repository contains helpers to build a docker-compose binary for aarch64/arm64. This project exists because, currently, docker-compose [releases](https://github.com/docker/compose/releases) do not include an aarch64 binary.

> To build

You may wish to edit the docker-compose version inside the Dockerfile. Then:

```bash
docker build . -t docker-compose-aarch64-builder
docker run --rm -v "$(pwd)":/dist docker-compose-aarch64-builder
# this will generate a `docker-compose-Linux-aarch64` in "$(pwd)"
```

## Removing docker in a forced way and related contents
```
docker stop $(docker ps -aq) && docker rm $(docker ps -aq) && docker rmi $(docker images -q)
sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce  
sudo rm -rf /var/lib/docker
sudo rm /etc/apparmor.d/docker
sudo groupdel docker
sudo rm -rf /var/run/docker.sock

reboot 
sudo rm -rf /var/lib/docker
```
