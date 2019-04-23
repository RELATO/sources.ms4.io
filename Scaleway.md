# Scaleway

## Test 1

> I was able to get kubernetes cluster running using the approach below. 
I issue the commands from an Ubuntu 16.04 box
```
https://github.com/stefanprodan/k8s-scw-baremetal
```
> Before applying
- Ensure you added your public key on the credentials / add ssh key link of Scaleway control panel  
- Activate the ssh agent as described below

```
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa
``` 

> Tested with development vps types
```
terraform apply  -var region=par1  -var arch=x86_64  -var server_type=DEV1-L  -var nodes=6  -var server_type_node=DEV1-M  -var weave_passwd=Vitorias  -var docker_version=18.06 -var ubuntu_version="Ubuntu Bionic"

root@server3:~/projetos/clusters/k8s-scw-baremetal# kubectl get nodes
NAME               STATUS   ROLES    AGE    VERSION
general-master-1   Ready    master   109m   v1.14.1
general-node-1     Ready    <none>   105m   v1.14.1
general-node-2     Ready    <none>   105m   v1.14.1
general-node-3     Ready    <none>   104m   v1.14.1
general-node-4     Ready    <none>   105m   v1.14.1
general-node-5     Ready    <none>   105m   v1.14.1
general-node-6     Ready    <none>   105m   v1.14.1
```

