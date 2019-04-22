# kubernetes (also known as k8s) 

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
