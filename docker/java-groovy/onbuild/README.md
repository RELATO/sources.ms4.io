# Dockerfile for groovy / java / springboot

This project contains Dockerfile that creates a base image to run Spring Boot applications.

## How to use this image

> Build and push to docker hub
```
docker build --no-cache -t relato/springboot:1.5.20-jdk-8-groovy-2.4.3 .
docker push relato/springboot:1.5.20-jdk-8-groovy-2.4.3
```

> Groovy Applications

Create a Dockerfile in your project directory:
```
FROM relato/springboot:1.5.20-jdk-8-groovy-2.4.3
ADD . $SRC_DIR
```

> Use the above Dockerfile You can then build and run the image:
```
docker build -t myapp .
docker run -ti myapp
```

You'll notice that everytime the container starts, it will resolve all the dependencies.
To avoid this, you can also pre-compile your Groovy application using the `onbuild` image.

In the Dockerfile, use:
```
FROM relato/springboot:1.5.20-jdk-8-groovy-2.4.3-onbuild
ADD . $SRC_DIR
```

You can then build and run the image just like the previous method:
```
docker build -t myapp
docker run -ti myapp
```


## Creating a demo microservice
> Create a new directory, and change into it: `mkdir hello-ms && cd hello-ms`
> Create `Helloworld.groovy`
```
@RestController
class Helloworld {
    @RequestMapping("/mul/{x}/{y}")
    def mul(@PathVariable int x, @PathVariable int y) {
    [ x: x, y: y, result: x * y ]
    }
}
```

- Run it: `spring run .`
- Build it: `spring jar ~/app.jar .`
- Run the jar: `java -jar ~/app.jar`

### Containerize the service
- Create a `Dockerfile`
- Build the container `docker build -t helloworld .`
- Run it: `docker run -ti --rm -p 8080:8080 helloworld`    
