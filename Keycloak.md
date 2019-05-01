# Keycloak

https://www.keycloak.org/

## Pre-requisites

> Install docker and docker-compose as described on link below

[docker](https://github.com/RELATO/sources.ms4.io/blob/master/Docker.md)

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

> The outpub of the keycloak test server on
https://kck.ms4.io/auth/realms/dev/.well-known/openid-configuration

```
{
"issuer": "https://kck.ms4.io/auth/realms/dev",
"authorization_endpoint": "https://kck.ms4.io/auth/realms/dev/protocol/openid-connect/auth",
"token_endpoint": "https://kck.ms4.io/auth/realms/dev/protocol/openid-connect/token",
"token_introspection_endpoint": "https://kck.ms4.io/auth/realms/dev/protocol/openid-connect/token/introspect",
"userinfo_endpoint": "https://kck.ms4.io/auth/realms/dev/protocol/openid-connect/userinfo",
"end_session_endpoint": "https://kck.ms4.io/auth/realms/dev/protocol/openid-connect/logout",
"jwks_uri": "https://kck.ms4.io/auth/realms/dev/protocol/openid-connect/certs",
"check_session_iframe": "https://kck.ms4.io/auth/realms/dev/protocol/openid-connect/login-status-iframe.html",
"grant_types_supported": [
"authorization_code",
"implicit",
"refresh_token",
"password",
"client_credentials"
],
"response_types_supported": [
"code",
"none",
"id_token",
"token",
"id_token token",
"code id_token",
"code token",
"code id_token token"
],
"subject_types_supported": [
"public",
"pairwise"
],
"id_token_signing_alg_values_supported": [
"PS384",
"ES384",
"RS384",
"HS256",
"HS512",
"ES256",
"RS256",
"HS384",
"ES512",
"PS256",
"PS512",
"RS512"
],
"userinfo_signing_alg_values_supported": [
"PS384",
"ES384",
"RS384",
"HS256",
"HS512",
"ES256",
"RS256",
"HS384",
"ES512",
"PS256",
"PS512",
"RS512",
"none"
],
"request_object_signing_alg_values_supported": [
"PS384",
"ES384",
"RS384",
"ES256",
"RS256",
"ES512",
"PS256",
"PS512",
"RS512",
"none"
],
"response_modes_supported": [
"query",
"fragment",
"form_post"
],
"registration_endpoint": "https://kck.ms4.io/auth/realms/dev/clients-registrations/openid-connect",
"token_endpoint_auth_methods_supported": [
"private_key_jwt",
"client_secret_basic",
"client_secret_post",
"client_secret_jwt"
],
"token_endpoint_auth_signing_alg_values_supported": [
"RS256"
],
"claims_supported": [
"aud",
"sub",
"iss",
"auth_time",
"name",
"given_name",
"family_name",
"preferred_username",
"email"
],
"claim_types_supported": [
"normal"
],
"claims_parameter_supported": false,
"scopes_supported": [
"openid",
"microprofile-jwt",
"web-origins",
"roles",
"phone",
"address",
"email",
"profile",
"offline_access"
],
"request_parameter_supported": true,
"request_uri_parameter_supported": true,
"code_challenge_methods_supported": [
"plain",
"S256"
],
"tls_client_certificate_bound_access_tokens": true,
"introspection_endpoint": "https://kck.ms4.io/auth/realms/dev/protocol/openid-connect/token/introspect"
}
```

## Good references

https://medium.com/@bcarunmail/securing-rest-api-using-keycloak-and-spring-oauth2-6ddf3a1efcc2

https://scalac.io/user-authentication-keycloak-2/

## Demos

```
git clone https://github.com/RELATO/spring-oauth2-keycloak-demo.git
cd spring-oauth2-keycloak-demo
mvn spring-boot:run
```

> Test using curl and postman

```
 home@Macintosh  ~/projetos/clusters/sources.ms4.io> curl \
  -d "client_id=employee-service" \
  -d "client_secret=796389fc-5621-4b0b-a58d-dd352e9fb85a" \
  -d "username=rachel" \
  -d "password=SupSec" \
  -d "grant_type=password" \
  "https://kck.ms4.io/auth/realms/dev/protocol/openid-connect/token" | jq
```

> The output should be something like this

```
{
  "access_token": "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJmbEM0ckUyRlNFYnYwSExtNkpkbWo4LTgzbGp6MkxGOUVBYlozaC1XMVY0In0.eyJqdGkiOiJlNGFmMDQ4Yi04NzBjLTQ3Y2QtOWJjZi0wM2ZjZGQ3ZmM1MjEiLCJleHAiOjE1NTY3MTkxMDEsIm5iZiI6MCwiaWF0IjoxNTU2NzE4ODAxLCJpc3MiOiJodHRwczovL2tjay5tczQuaW8vYXV0aC9yZWFsbXMvZGV2IiwiYXVkIjoiYWNjb3VudCIsInN1YiI6ImFjYTU0NDNjLTk4ODctNDU1MS1iYzFjLTlhODU3MTM3MmIxNiIsInR5cCI6IkJlYXJlciIsImF6cCI6ImVtcGxveWVlLXNlcnZpY2UiLCJhdXRoX3RpbWUiOjAsInNlc3Npb25fc3RhdGUiOiI1ZDRlNWJhZS1lZmJiLTQ3YjgtOWRkMS0zYWUwOTdiMzBiNjYiLCJhY3IiOiIxIiwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbIm9mZmxpbmVfYWNjZXNzIiwidW1hX2F1dGhvcml6YXRpb24iXX0sInJlc291cmNlX2FjY2VzcyI6eyJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX0sImVtcGxveWVlLXNlcnZpY2UiOnsicm9sZXMiOlsiVVNFUiJdfX0sInNjb3BlIjoicHJvZmlsZSBlbWFpbCIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwidXNlcl9uYW1lIjoicmFjaGVsIiwibmFtZSI6IlJhY2hlbCBXaGl0ZSIsInByZWZlcnJlZF91c2VybmFtZSI6InJhY2hlbCIsImdpdmVuX25hbWUiOiJSYWNoZWwiLCJmYW1pbHlfbmFtZSI6IldoaXRlIn0.dXBwKUwkwfwDrd6VgC4MUBfv95guDsvob09swA37RXdzXRYO2NPQQo0Qcqg1qwyBJzbWR0bmj4IHaUVoNEnXz8bqBxJ9nGcKenNwuaG5ibZsyMGYlyMVizkuus5QiF2enNKAQwxx_pKaHc9sY9y3cPIav4kVPyVyRKgMsn0kGl5ayQOb3VlKinldCB9vw73NbaGfi2UPeVRuwcmIriMYaznmntaGOs8hD2EIfL3M-kq7qvIMBcutQ-p3287olMEWVx6BqErQskQACIIR-SNYh8_2JV8Os8rRHiTA43A7DZ5umqY1VpfFUJY8UYsYgpADU558gvA8aRHQza3kGBiyOg",
  "expires_in": 300,
  "refresh_expires_in": 1800,
  "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJhNTdjMzI0ZC03MTNhLTQ5ZmUtOWI5Ny0wZTcyMDI5YzQ0ZTAifQ.eyJqdGkiOiJhODQxYTY1Ny03YTU4LTQxODgtYjJlNi04MzViNWZiNjg0NDUiLCJleHAiOjE1NTY3MjA2MDEsIm5iZiI6MCwiaWF0IjoxNTU2NzE4ODAxLCJpc3MiOiJodHRwczovL2tjay5tczQuaW8vYXV0aC9yZWFsbXMvZGV2IiwiYXVkIjoiaHR0cHM6Ly9rY2subXM0LmlvL2F1dGgvcmVhbG1zL2RldiIsInN1YiI6ImFjYTU0NDNjLTk4ODctNDU1MS1iYzFjLTlhODU3MTM3MmIxNiIsInR5cCI6IlJlZnJlc2giLCJhenAiOiJlbXBsb3llZS1zZXJ2aWNlIiwiYXV0aF90aW1lIjowLCJzZXNzaW9uX3N0YXRlIjoiNWQ0ZTViYWUtZWZiYi00N2I4LTlkZDEtM2FlMDk3YjMwYjY2IiwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbIm9mZmxpbmVfYWNjZXNzIiwidW1hX2F1dGhvcml6YXRpb24iXX0sInJlc291cmNlX2FjY2VzcyI6eyJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX0sImVtcGxveWVlLXNlcnZpY2UiOnsicm9sZXMiOlsiVVNFUiJdfX0sInNjb3BlIjoicHJvZmlsZSBlbWFpbCJ9.ioxCxXkMPhlkqyQaqKWaFx8Pju3qX8end-8dnT6wsiQ",
  "token_type": "bearer",
  "not-before-policy": 0,
  "session_state": "5d4e5bae-efbb-47b8-9dd1-3ae097b30b66",
  "scope": "profile email"
}
```

> Grab only the token

```
export mytoken="eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJmbEM0ckUyRlNFYnYwSExtNkpkbWo4LTgzbGp6MkxGOUVBYlozaC1XMVY0In0.eyJqdGkiOiJlNGFmMDQ4Yi04NzBjLTQ3Y2QtOWJjZi0wM2ZjZGQ3ZmM1MjEiLCJleHAiOjE1NTY3MTkxMDEsIm5iZiI6MCwiaWF0IjoxNTU2NzE4ODAxLCJpc3MiOiJodHRwczovL2tjay5tczQuaW8vYXV0aC9yZWFsbXMvZGV2IiwiYXVkIjoiYWNjb3VudCIsInN1YiI6ImFjYTU0NDNjLTk4ODctNDU1MS1iYzFjLTlhODU3MTM3MmIxNiIsInR5cCI6IkJlYXJlciIsImF6cCI6ImVtcGxveWVlLXNlcnZpY2UiLCJhdXRoX3RpbWUiOjAsInNlc3Npb25fc3RhdGUiOiI1ZDRlNWJhZS1lZmJiLTQ3YjgtOWRkMS0zYWUwOTdiMzBiNjYiLCJhY3IiOiIxIiwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbIm9mZmxpbmVfYWNjZXNzIiwidW1hX2F1dGhvcml6YXRpb24iXX0sInJlc291cmNlX2FjY2VzcyI6eyJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX0sImVtcGxveWVlLXNlcnZpY2UiOnsicm9sZXMiOlsiVVNFUiJdfX0sInNjb3BlIjoicHJvZmlsZSBlbWFpbCIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwidXNlcl9uYW1lIjoicmFjaGVsIiwibmFtZSI6IlJhY2hlbCBXaGl0ZSIsInByZWZlcnJlZF91c2VybmFtZSI6InJhY2hlbCIsImdpdmVuX25hbWUiOiJSYWNoZWwiLCJmYW1pbHlfbmFtZSI6IldoaXRlIn0.dXBwKUwkwfwDrd6VgC4MUBfv95guDsvob09swA37RXdzXRYO2NPQQo0Qcqg1qwyBJzbWR0bmj4IHaUVoNEnXz8bqBxJ9nGcKenNwuaG5ibZsyMGYlyMVizkuus5QiF2enNKAQwxx_pKaHc9sY9y3cPIav4kVPyVyRKgMsn0kGl5ayQOb3VlKinldCB9vw73NbaGfi2UPeVRuwcmIriMYaznmntaGOs8hD2EIfL3M-kq7qvIMBcutQ-p3287olMEWVx6BqErQskQACIIR-SNYh8_2JV8Os8rRHiTA43A7DZ5umqY1VpfFUJY8UYsYgpADU558gvA8aRHQza3kGBiyOg"
```

> Now you can access the api using mytoken variable

```
home@Macintosh ~/projetos/clusters/sources.ms4.io>  curl -H "Authorization: bearer $mytoken" http://localhost:8085/api/v1/employees/username
rachel%

home@Macintosh  ~/projetos/clusters/sources.ms4.io> curl -H "Authorization: bearer $mytoken" http://localhost:8085/api/v1/employees/roles | jq
[
  "ROLE_USER",
  "ROLE_manage-account",
  "ROLE_view-profile",
  "ROLE_manage-account-links"
]
```

# Enjoy
