# Go 

## Installation commands

```
cd ~
wget https://golang.org/dl/go1.14.7.linux-amd64.tar.gz
cd /usr/local
sudo tar xfvz ~/go1.14.7.linux-amd64.tar.gz
```

## Add the following line to your ~/.profile file
```
export GOPATH=~/go
export GOROOT="/usr/local/go"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
```

## Test your go installation
- terminal/shell logout
- terminal/shell login again
- issue the command below

```
go version
``` 

> You should see

``` 
go version go1.11.9 linux/amd64
``` 

## Some interesting tutorials

https://medium.com/@evers.rivero/https-y-golang-2db1d2739e7e

https://github.com/dlsniper/gopherconuk

## Some interesting projects 

https://github.com/coding-latte/golang-docker-multistage-build-demo

https://github.com/appleboy?tab=repositories

https://github.com/hb-go/echo-web

https://github.com/kataras/iris

