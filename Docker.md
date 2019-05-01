# Docker

## docker easy installation

> Below is the command to install 18.06 version. You can change to another version if you want
```
curl https://releases.rancher.com/install-docker/18.06.sh | sh

```

## docker-compose easy installation
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
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
