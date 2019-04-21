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

### Send your public ssh key to the datacenter control panel 
Before running the commands remotely via ssh protocol you need to send your public ssh key to the datacenter of your choid (like one of those listed above / I.E. one you created your VPS)

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


### Update/upgrade/reboot remotely via SSH 
Replace the letters bellow (X.Y.Z.W) with the correct VPSs IP addresses separeted by spaces. Example: (163.172.144.44 173.172.114.31 68.31.97.53)
```
declare -a IPS=(X.Y.Z.W)
for IP in ${IPS[@]}; do  ssh -o StrictHostKeyChecking=no -t root@$IP "echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections; apt update; apt -y -q upgrade; apt -y -q autoremove; apt -y -q sudo curl zip unzip screen ; reboot;" ;  done
``` 

### Install docker remotely via SSH 
Replace the letters bellow (X.Y.Z.W) with the correct VPSs IP addresses separeted by spaces. Example: (163.172.144.44 173.172.114.31 68.31.97.53)
``` 
declare -a IPS=(X.Y.Z.W)
for IP in ${IPS[@]}; do  ssh -o StrictHostKeyChecking=no -t root@$IP "echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections; curl https://releases.rancher.com/install-docker/18.06.sh | sh; apt-mark hold docker-ce; " ;  done

``` 

## Install Kubernetes ( from scratch )
Some references: 

https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/?s_tact=C43401LW

https://vitux.com/install-and-deploy-kubernetes-on-ubuntu/

### Install prerequisites
> Issue the commands below in all masters and workers you want/have
```
apt-get update && apt-get -y upgrade
curl https://releases.rancher.com/install-docker/18.06.sh | sh
apt install -y sudo curl zip unzip screen 
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt-get install -y kubelet kubeadm kubectl
apt-mark hold docker-ce kubectl kubeadm kubelet
sudo swapoff -a
``` 
### Master installation
> Issue the commands below in the main master (using canal alternative. See more alternatives in documentation)
```
kubeadm init --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
kubectl get nodes
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/canal/rbac.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/canal/canal.yaml
```
> When finished you should be able to see something like this
```
To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 10.12.157.131:6443 --token f5m6i1.ruo75b91vd8s7cb5 \
    --discovery-token-ca-cert-hash sha256:ed0dfe1ec47374c819c14a8f9c11f961e4598537ef151d7d34183221b96d4255

```

###  Workers installation
> After that you need to apply the above command in all your workers replacing the numbers accordanly you see in your master. Copy the command as showed and past in your workers. For example:
```
kubeadm join 10.12.157.131:6443 --token f5m6i1.ruo75b91vd8s7cb5 \
    --discovery-token-ca-cert-hash sha256:ed0dfe1ec47374c819c14a8f9c11f961e4598537ef151d7d34183221b96d4255
```

> to verify 
```
kubectl get nodes
```

> to allow master to receive workloads
```
kubectl taint nodes --all node-role.kubernetes.io/master-
``` 
> to retrieve tokens ( run in master / token expires every 24 hours )
```
kubeadm token list

openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null |    openssl dgst -sha256 -hex | sed 's/^.* //'
```

## Screen (tool for devops help)

> Below are some most common commands for managing Linux Screen Windows:
```
Ctrl+a c Create a new window (with shell)
Ctrl+a " List all window
Ctrl+a 0 Switch to window 0 (by number )
Ctrl+a A Rename the current window
Ctrl+a S Split current region horizontally into two regions
Ctrl+a | Split current region vertically into two regions
Ctrl+a tab Switch the input focus to the next region
Ctrl+a Ctrl+a Toggle between the current and previous region
Ctrl+a Q Close all regions but the current one
Ctrl+a X Close the current region

Ctrl+a d You can detach from the screen session at any time by typing this
screen -r To resume your screen session
``` 

