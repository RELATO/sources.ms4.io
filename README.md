# kubernetes, microservices and things like that

## Cheapest datacenters we have found

- [hetzner](https://console.hetzner.cloud/projects)
- [scaleway](https://console.scaleway.com/dashboard)
- [vultr](https://my.vultr.com)
- [linode](https://login.linode.com/login)
- [digitalocean](https://cloud.digitalocean.com/login)
- [upcloud](https://hub.upcloud.com)
- [ssdnodes](https://www.ssdnodes.com/manage/clientarea.php)

## Make things easyer

```
for IP in ${IPS[@]}; do  ssh -o StrictHostKeyChecking=no -t root@$IP "echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections; apt update; apt -y -q upgrade; apt -y -q autoremove; reboot;" ;  done
``` 

### Installing docker remotely via SSH 
``` 
for IP in ${IPS[@]}; do  ssh -o StrictHostKeyChecking=no -t root@$IP "echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections; curl https://releases.rancher.com/install-docker/18.06.sh | sh; apt-mark hold docker-ce; " ;  done

``` 


