# Micronaut

https://micronaut.io/

## Tutorial

https://guides.micronaut.io/micronaut-creating-first-graal-app/guide/index.html

> Follow along
```
git clone https://github.com/micronaut-guides/micronaut-creating-first-graal-app.git
cd micronaut-creating-first-graal-app
cd complete
./gradlew assemble
```
> Test running yor app
```
java -jar build/libs/complete-0.1.jar
14:22:57.559 [main] INFO  io.micronaut.runtime.Micronaut - Startup completed in 1187ms. Server Running: http://localhost:8080
```


> Create a executable native image 
```
./build-native-image.sh
```
> Test running yor app nativelly 
```
./micronaut-graal-app
14:21:50.997 [main] INFO  io.micronaut.runtime.Micronaut - Startup completed in 23ms. Server Running: http://localhost:8080
```

## Understanding the advantage of having a native executable image
> Startup time is almost instantaneously 
```
Startup completed in 23ms
```
> and when running from traditional jar file 
```
Startup completed in 1187ms
```

# Fantastic, isn't it ? Thank you, GraalVM !

