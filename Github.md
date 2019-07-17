# Github 

The command below will clone all repos from a particular user account. 

```
curl -s 'https://api.github.com/users/skaffolder/repos?page=12&per_page=100' | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone
``` 
