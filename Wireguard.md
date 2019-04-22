# Wireguard

https://www.wireguard.com/

Reference: https://dnns.no/wireguard-vpn-on-ubuntu-18.04.html

## Example of configuration
```
# /etc/wireguard/wg0.conf
[Interface]
Address = 10.0.1.1
PrivateKey = <PRIVATE_KEY_NODE1>
ListenPort = 51820

[Peer]
PublicKey = <PUBLIC_KEY_NODE2>
AllowedIps = 10.0.1.2/32
Endpoint = 104.225.221.142:51820

[Peer]
PublicKey = <PUBLIC_KEY_NODE3>
AllowedIps = 10.0.1.3/32
Endpoint = 104.225.221.143:51820
```

## Setup firewalld example
```
$ sudo firewall-cmd --add-port=51820/udp --permanent
$ sudo firewall-cmd --reload
```
