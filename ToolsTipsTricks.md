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

## Nginx Load Balancer

> lb1.conf example configuration
```
server {
   listen 80;
   server_name  test.akomljen.com;
   location / {
      proxy_pass http://backend;
   }
   location /app1 {
        proxy_pass http://backend/app1;
        proxy_set_header                Host test.akomljen.com;
        proxy_pass_request_headers      on;
   }
   location /app2 {
        proxy_pass http://backend/app2;
        proxy_set_header                Host test.akomljen.com;
        proxy_pass_request_headers      on;
   }
}
```
> upstream.conf
```
upstream backend {
    server 104.225.221.142:30000;
    server 104.225.221.183:30000;
    server 104.225.221.33:30000;
}
```


## HAProxy Load Balancer

> Add the folowing lines at the end of the config file: haproxy.conf
```
frontend localnodes
    bind *:80
    mode http
    option http-server-close
    option forwardfor
    default_backend nodes

backend nodes
    mode http
    balance roundrobin
    option forwardfor
    http-request set-var(txn.host) hdr(Host)
    http-request set-header X-Host %[dst_host]
    #http-request set-header X-Forwarded-Port %[dst_port]
    #http-request add-header X-Forwarded-Proto https if { ssl_fc }
    #option httpchk HEAD / HTTP/1.1\r\nHost:localhost
    server node1 104.225.221.142:30000 check
    server node2 104.225.221.183:30000 check
    server node3 104.225.221.33:30000 check
``` 
