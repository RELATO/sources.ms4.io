# Postgresql

https://www.postgresql.org/

## Running the containerized version ( for development purposes )

> We are defining the postgres (user ) password to "postgres" and creating a database called "test" on the exemple below
```
docker run -d -ePOSTGRES_USER=postgres -ePOSTGRES_PASSWORD=postgres -ePOSTGRES_DB=test -p5432:5432 --name postgres  postgres:10.4-alpine
```

> Testing
```
docker exec -it postgres bash
su - postgres
c585f5ed70df:~$ psql
psql (10.4)
Type "help" for help.

postgres=# \c test
You are now connected to database "test" as user "postgres".
test=#
test=# INSERT INTO distributors VALUES (101,'DESCRIPTION OF DID 1');
INSERT 0 1
test=# select * from distributors;
 did |         name
-----+----------------------
 101 | DESCRIPTION OF DID 1

```
