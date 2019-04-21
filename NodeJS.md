# NodeJS

## You should install Node Version Manager at the first place
``` 
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
```
### Test
You must run the following lines before test
```
export NVM_DIR="/root/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```
and finally issue the following command to test
```
nvm list
``` 
> You should see something like this

```
            N/A
node -> stable (-> N/A) (default)
iojs -> N/A (default)
```
Now you are able to install NodeJS (recommended version)
```
nvm install node
``` 
> You shoud see something like this
```
Downloading and installing node v11.14.0...
Downloading https://nodejs.org/dist/v11.14.0/node-v11.14.0-linux-x64.tar.xz...
########################################################################################################### 100.0%
Computing checksum with sha256sum
Checksums matched!
Now using node v11.14.0 (npm v6.7.0)
Creating default alias: default -> node (-> v11.14.0)
```
> Testing your node installation 
```
root@development:~# node -v
v11.14.0
root@development:~# npm -v
6.7.0
```
