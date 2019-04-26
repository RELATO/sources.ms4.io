# Scaleway ( creating multiple servers )

## Export the required variables as the example below 
```
export TF_VAR_scaleway_private_key_path="~/.ssh/id_rsa"
export TF_VAR_scaleway_organization="f3s43ce-b8cd-411g-90ec-68342616ca56"
export TF_VAR_scaleway_token="63a78ebf-e9z6-4884-b72d-4ae809d3068b"
export TF_VAR_scaleway_region="par1"
export TF_VAR_scaleway_node_count=3
```

> Start terraform
```
terraform apply
```

> If you face the errors below
```
Error: Error applying plan:

3 error(s) occurred:

* null_resource.configure-node[2]: SSH agent requested but SSH_AUTH_SOCK not-specified
* null_resource.configure-node[1]: SSH agent requested but SSH_AUTH_SOCK not-specified
* null_resource.configure-node[0]: SSH agent requested but SSH_AUTH_SOCK not-specified
```

> You can solve the errors above issuing the following commands to start ssh agent 
```
eval `ssh-agent -s`
Agent pid 17479

ssh-add ~/.ssh/id_rsa
Identity added: /root/.ssh/id_rsa (/root/.ssh/id_rsa)
```

> Re-run 
```
terraform apply -auto-approve
```

> It is expected to see some output similar to this
```
Apply complete! Resources: 3 added, 0 changed, 3 destroyed.

Outputs:

node_id = [
    3808afc6-e3f6-4cb7-bde1-df7be803db04,
    966853f9-e59c-477f-aaa2-6cdf2dce216d,
    23ab8e81-f031-48db-808d-6a0b183a114c
]
node_private_ip = [
    10.64.26.165,
    10.64.64.143,
    10.64.82.93
]
node_public_ip = [
    51.158.122.55,
    163.172.143.140,
    51.158.100.2
]
```


