# Tools & Tips & Tricks

## Cleaning up all docker containers
```
docker rm -f $(docker ps -aq)
docker volume rm -f $(docker volume ls -q)
docker rmi -f $(docker images -q)
```

> Remove files/directories docker were written to disk
```
rm -rf /var/lib/etcd/
rm -rf /etc/kubernetes/
rm -rf /etc/cni/
rm -rf /opt/cni/
rm -rf /var/lib/cni/
rm -rf /var/run/calico/
rm -rf /var/lib/rancher
```
