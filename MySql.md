# MySql

https://www.mysql.com/

## Running the containerized version ( for development purposes )

> We are defining the root password to "ChangeIt" on the exemple below
```
docker run --name mysqldev -e MYSQL_ROOT_PASSWORD=ChangeIt -d -p3306:3306 mysql:5.6
```

> Testing
```
docker exec -it mysqldev bash
mysql -uroot -p 
```
