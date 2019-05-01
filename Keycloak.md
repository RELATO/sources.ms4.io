# Keycloak

https://www.keycloak.org/

## Pre-requisites
> Install docker and docker-compose as described on link below

```
[docker](https://github.com/RELATO/sources.ms4.io/blob/master/Docker.md)
```

## Easy installation ( take less than five minutes )
```
git clone https://github.com/RELATO/docker-keycloak-letsencrypt.git
cd 
mv sample.env .env
vi .env

docker-compose up -d 
```


## Guide
- Choose a domain name to host your new keycloak server
- Config the DNS service that is hosting the domain above accordinly 
- Copy sample.env to .env and adjust the environment variables.
- Edit .env file 
- Replace example.com to the domain you chose
- Replace Passw0rd! to one of your choice
- Replace luke.skywalker@example.com to your e-mail

Then 
```
docker-compose up -d
docker ps
```

Note: ssl option in JDBC_PARAMS is set to false, as the nginx proxy will handle SSL.
```
DB_DATABASE=keycloak_db
DB_USER=keycloak_db_user
DB_PASSWORD=Passw0rd!
KEYCLOAK_HOSTNAME=example.com
KEYCLOAK_HTTP_PORT=8080
KEYCLOAK_USER=admin
KEYCLOAK_PASSWORD=Passw0rd!
JDBC_PARAMS="ssl=false" 
VIRTUAL_HOST=example.com
VIRTUAL_PORT=8080
PROXY_ADDRESS_FORWARDING=true
LETSENCRYPT_HOST=example.com
LETSENCRYPT_EMAIL=luke.skywalker@example.com
```

# Enjoy
