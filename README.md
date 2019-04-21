# kubernetes, microservices and things like that

## Cheapest datacenters we have found

- [hetzner](https://console.hetzner.cloud/projects)
- [scaleway](https://console.scaleway.com/dashboard)
- [vultr](https://my.vultr.com)
- [linode](https://login.linode.com/login)
- [digitalocean](https://cloud.digitalocean.com/login)
- [upcloud](https://hub.upcloud.com)
- [ssdnodes](https://www.ssdnodes.com/manage/clientarea.php) * does not have block storage, load balancer or even hourly based prices

## Make things easyer (tested in ubuntu)

Before running the commands below you need to send your public ssh key to the datacenter of your choid (like one of those listed above / I.E. one you created your VPS)

To do that, copy the content showed after issueing the command below
```
cat ~/.ssh/id_rsa.pub
``` 
You should be able to see something like this:
```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCoiGIFGGS/Q40t4/Cvp3E4as8w0qqgPsxytsjr3Cdf2pTVVVctItXZVdLp2BbPeSTt68njJEpE1pmkL3AIKVyWco41Au4DS8Put2mgpYiqmyCDe/YnG8Z7DTR7zEUQeMpGjs3deyiNBPBVYi061y0sdGZmswN9PkMKFkZzLpNbLgV/QMWFlAEC0mDaFm5x5R4WE4+FdPyRKm/5wSo+WQjXrPp33iP5QI/vkjDmkjuaaN4fVmQEunV3+3H9cK32i6+B7mVF/24CBZJ4Q9ALGTtDGMIY6lU/cqpTN67DZrsenoiL6UJYIy3XNh32Niro6Hy1QcszJM8jV/hC1xtK4N8yY49cipSEATUa692m/VFlP1ekvCt5NmxSell4pofZ4Rk5fvxIkui7H9n0vMmdYHn9pkTCjK0Cy7Wik7+ZHk+ywov487kdfAI4EdnMGWbC3UMBdaNp30vdi+UKCUXBDCtQTHjDBCE1hTknZfcIwraBnEKpTIjlca+12OP4Dtku/V9Ca8zcaIZSDY8PQ2/+2y7Pv6gxPf1Pcmcj6yjn02DrwjdINj41LeTnSm26yErg0fRWDtel9GkCD/pEjHCJ9uuIxiQT9ZAvH8J9d+Ub/1PiUN3XRSiyZNmiGFHkfa1qcRRhwakwhv0ARSC07IOMR8zcAHww80o02QXQJG2VmwDqGw== e-mail-account@exampledomain.com
```
If you see the message below instead
``` 
/Users/[home]/.ssh/id_rsa.pub: No such file or directory
```
than create a brand new ssh key using the command below:
```
ssh-keygen -t rsa -P ""
``` 
If everything went right, you can copy the content showed using the command below
```
cat ~/.ssh/id_rsa.pub
``` 
And, finally, paste the ssh public key content just copied into the datacenter dashboard of your choice.


### Installing docker remotely via SSH 
```
declare -a IPS=(163.172.144.44 163.172.114.31)
for IP in ${IPS[@]}; do  ssh -o StrictHostKeyChecking=no -t root@$IP "echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections; apt update; apt -y -q upgrade; apt -y -q autoremove; reboot;" ;  done
``` 

### Installing docker remotely via SSH 
``` 
declare -a IPS=(163.172.144.44 163.172.114.31)
for IP in ${IPS[@]}; do  ssh -o StrictHostKeyChecking=no -t root@$IP "echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections; curl https://releases.rancher.com/install-docker/18.06.sh | sh; apt-mark hold docker-ce; " ;  done

``` 


