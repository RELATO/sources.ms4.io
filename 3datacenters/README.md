# 3 datacenters

## Digitalocean
```
mkdir -p ~/.config/digital-ocean
echo "TOKEN" > ~/.config/digital-ocean/token



```

### Vultr terraform provider
```
wget https://github.com/squat/terraform-provider-vultr/releases/download/v0.1.9/terraform-provider-vultr_v0.1.9_linux_amd64.tar.gz

--2019-04-26 15:13:50--  https://github.com/squat/terraform-provider-vultr/releases/download/v0.1.9/terraform-provider-vultr_v0.1.9_linux_amd64.tar.gz
Resolving github.com (github.com)... 192.30.253.112, 192.30.253.113
Connecting to github.com (github.com)|192.30.253.112|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://github-production-release-asset-2e65be.s3.amazonaws.com/98864585/7698db80-eaa6-11e8-8aad-bed6f6443ea5?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20190426%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20190426T151351Z&X-Amz-Expires=300&X-Amz-Signature=dce3aab5f154abaf79160a23c9d100f54bc1fe186e2190a09afa52311dde481e&X-Amz-SignedHeaders=host&actor_id=0&response-content-disposition=attachment%3B%20filename%3Dterraform-provider-vultr_v0.1.9_linux_amd64.tar.gz&response-content-type=application%2Foctet-stream [following]
--2019-04-26 15:13:51--  https://github-production-release-asset-2e65be.s3.amazonaws.com/98864585/7698db80-eaa6-11e8-8aad-bed6f6443ea5?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20190426%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20190426T151351Z&X-Amz-Expires=300&X-Amz-Signature=dce3aab5f154abaf79160a23c9d100f54bc1fe186e2190a09afa52311dde481e&X-Amz-SignedHeaders=host&actor_id=0&response-content-disposition=attachment%3B%20filename%3Dterraform-provider-vultr_v0.1.9_linux_amd64.tar.gz&response-content-type=application%2Foctet-stream
Resolving github-production-release-asset-2e65be.s3.amazonaws.com (github-production-release-asset-2e65be.s3.amazonaws.com)... 52.216.84.48
Connecting to github-production-release-asset-2e65be.s3.amazonaws.com (github-production-release-asset-2e65be.s3.amazonaws.com)|52.216.84.48|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 7903237 (7.5M) [application/octet-stream]
Saving to: 'terraform-provider-vultr_v0.1.9_linux_amd64.tar.gz'

terraform-provider-vultr_v0. 100%[==============================================>]   7.54M   863KB/s    in 11s

2019-04-26 15:14:02 (696 KB/s) - 'terraform-provider-vultr_v0.1.9_linux_amd64.tar.gz' saved [7903237/7903237]

root@server3:~/.terraform.d/plugins/linux_amd64# tar xfvz terraform-provider-vultr_v0.1.9_linux_amd64.tar.gz
terraform-provider-vultr_v0.1.9
root@server3:~/.terraform.d/plugins/linux_amd64# ls
terraform-provider-rke_v0.11.1  terraform-provider-vultr_v0.1.9  terraform-provider-vultr_v0.1.9_linux_amd64.tar.gz
root@server3:~/.terraform.d/plugins/linux_amd64# rm terraform-provider-vultr_v0.1.9_linux_amd64.tar.gz
```

