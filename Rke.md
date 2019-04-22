# Rke



## Some rke scripts

>>> execute in each of nodes
curl https://releases.rancher.com/install-docker/17.03.sh | sh
useradd -m -G docker rke
su - rke
mkdir $HOME/.ssh
chmod 700 $HOME/.ssh
touch $HOME/.ssh/authorized_keys
chmod 700 $HOME/.ssh

>>> transfering public key cert to rke user in each node
cat $HOME/.ssh/id_rsa.pub | ssh $NODEIP "sudo tee -a /home/rke/.ssh/authorized_keys"

>>> activate the ssh agent
eval $(ssh-agent)
ssh-add $HOME/.ssh/id_rsa

>>> testing if each key inside each node is working
ssh -i $HOME/.ssh/id_rsa rke@$NODEIP docker version

> Executing
``` 
rke up
```

## Some useful references
https://github.com/hetznercloud/csi-driver
https://forums.rancher.com/t/hetzner-cloud-csi-driver-activation-on-rancher-2-2/13882/4
https://github.com/kubernetes/dashboard/wiki/Installation
