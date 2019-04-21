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
