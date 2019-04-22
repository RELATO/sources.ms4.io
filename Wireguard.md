# Wireguard

https://www.wireguard.com/

Reference: https://dnns.no/wireguard-vpn-on-ubuntu-18.04.html

## Setup firewalld example
```
$ sudo firewall-cmd --add-port=51820/udp --permanent
$ sudo firewall-cmd --reload
```
