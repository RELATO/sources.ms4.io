# MongoDB

https://www.mongodb.com/

## Running the containerized version ( for development purposes )

> -e AUTH=no is used to connect mongodb service without password
```
docker run -d -p 27017:27017 -p 28017:28017 -e AUTH=no tutum/mongodb
```

## Basic commands just to test installation

> Use golang_rest 
```
use golang_rest
switched to db golang_rest
```

> List the names of collections in golang_rest 
```
db.getCollectionNames()
[ "book", "system.indexes" ]
```

> List the records in book collection
```
> db.book.find();
{ "_id" : ObjectId("5cbdb5ce330f492268762859"), "isbn" : "080980980", "title" : "Power of now", "price" : 49, "status" : false, "author" : null }
```
