# kubernetes (also known as k8s) 

## Amazing guide
https://github.com/hobby-kube/guide

> Other documentations
https://joshrendek.com/2018/04/kubernetes-on-bare-metal/


## Install Kubernetes ( from scratch )
Some references: 

https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/?s_tact=C43401LW

https://vitux.com/install-and-deploy-kubernetes-on-ubuntu/

### Install prerequisites
> Issue the commands below in all masters and workers you want/have
```
apt-get update && apt-get -y upgrade
curl https://releases.rancher.com/install-docker/18.06.sh | sh
apt install -y -q sudo curl zip unzip screen 
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt-get install -y -q kubelet kubeadm kubectl
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
### About external storage
https://github.com/kubernetes-incubator/external-storage/tree/master/nfs#quickstart

### About load balancing
https://rancher.com/blog/2018/2018-09-13-load-balancing-options-2dot0/

## firewall ports  
Reference: https://stackoverflow.com/questions/39293441/needed-ports-for-kubernetes-cluster

```
accept  TCP 22  0.0.0.0/0 
accept  TCP 80  0.0.0.0/0 
accept  TCP 179 0.0.0.0/0 
accept  TCP 443 0.0.0.0/0 
accept  TCP 2379  0.0.0.0/0 
accept  TCP 2380  0.0.0.0/0 
accept  TCP 6443  0.0.0.0/0 
accept  TCP 8080  0.0.0.0/0 
accept  TCP 9080  0.0.0.0/0     istiodemo booking demo app
accept  TCP 9090  0.0.0.0/0 
accept  TCP 10250 0.0.0.0/0 
accept  TCP 10250 - 10255 0.0.0.0/0 
accept  TCP 10255 0.0.0.0/0 
accept  TCP 30000 - 32767 0.0.0.0/0 
drop  any 0 - 65535 0.0.0.0/0       
```
