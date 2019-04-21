# Go 

## Installation commands

```
cd ~
wget https://dl.google.com/go/go1.11.9.linux-amd64.tar.gz
cd /usr/local
tar xfvz ~/go1.11.9.linux-amd64.tar.gz
```

## Add the following line to your ~/.profile file
```
export PATH=$PATH:/usr/local/go/bin
```

## Test your go installation
- Logout
- Login again
- Issue the command below

```
go version
``` 

> You should see

>>> go version go1.11.9 linux/amd64
