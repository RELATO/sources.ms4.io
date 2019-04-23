# Scaleway

## Test 1

> I was able to get kubernetes cluster running using the approach below 
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


