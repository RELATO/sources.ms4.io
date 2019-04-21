
# GraalVM 

## Sdk manager recommended
You should install [sdkman](https://sdkman.io/) as described on [Java](https://github.com/RELATO/sources.ms4.io/blob/master/Java.md)

## References
https://e.printstacktrace.blog/installing-graalvm-ee-1-0-0-rc14-with-sdkman/

## Download and install GraalVM

Download graalvm-ee-1.0.0-rc16-linux-amd64.tar.gz file from oracle
After that you are able to issue these commands:
```
mv graalvm-ee-1.0.0-rc16-linux-amd64.tar.gz graalvm-ee.tar.gz
tar xfvz graalvm-ee.tar.gz
mv graalvm-ee-1.0.0-rc16/ graalvm-ee
sdk install java graalvm-ee graalvm-ee
sdk use java graalvm-ee
sdk default java graalvm-ee
```
> Test your graalvm installation
```
root@development:~# java -version
java version "1.8.0_202"
Java(TM) SE Runtime Environment (build 1.8.0_202-b08)
Java HotSpot(TM) GraalVM EE 1.0.0-rc16 (build 25.202-b08-jvmci-0.59, mixed mode)
```
## Enabling static compile capabilities
Issue the following command in your terminal
> Ubuntu
```
apt install -y build-essential zlib1g-dev
```
> Centos 7
```
yum -y groupinstall "Development Tools"
yum -y install glibc-static glibc-devel zlib-devel libstdc++-static
``` 
## Running a demo app

### Reference
https://javalin.io/2018/09/27/javalin-graalvm-example.html

> Clone the demo project
```
git clone https://github.com/tipsy/graal-javalin.git
cd graal-javalin/
./gradlew build fatJar
```
> Running the demo graal-javalin app
```
root@development:~/graal-javalin# java -jar build/libs/graal-javalin-all-1.0-SNAPSHOT.jar
[main] INFO org.eclipse.jetty.util.log - Logging initialized @397ms to org.eclipse.jetty.util.log.Slf4jLog
[main] INFO io.javalin.Javalin -
 _________________________________________
|        _                  _ _           |
|       | | __ ___   ____ _| (_)_ __      |
|    _  | |/ _` \ \ / / _` | | | '_ \     |
|   | |_| | (_| |\ V / (_| | | | | | |    |
|    \___/ \__,_| \_/ \__,_|_|_|_| |_|    |
|_________________________________________|
|                                         |
|    https://javalin.io/documentation     |
|_________________________________________|
[main] INFO io.javalin.Javalin - Starting Javalin ...
[main] INFO org.eclipse.jetty.server.Server - jetty-9.4.z-SNAPSHOT; built: 2018-08-30T13:59:14.071Z; git: 27208684755d94a92186989f695db2d7b21ebc51; jvm 1.8.0_202-b08
[main] INFO org.eclipse.jetty.server.session - DefaultSessionIdManager workerName=node0
[main] INFO org.eclipse.jetty.server.session - No SessionScavenger set, using defaults
[main] INFO org.eclipse.jetty.server.session - node0 Scavenging every 600000ms
[main] INFO org.eclipse.jetty.server.handler.ContextHandler - Started i.j.c.u.initialize$httpHandler$1@29ee9faa{/,null,AVAILABLE}
[main] INFO org.eclipse.jetty.server.handler.ContextHandler - Started o.e.j.s.ServletContextHandler@1e127982{/,null,AVAILABLE}
[main] INFO org.eclipse.jetty.server.AbstractConnector - Started ServerConnector@520a3426{HTTP/1.1,[http/1.1]}{0.0.0.0:7000}
[main] INFO org.eclipse.jetty.server.Server - Started @1549ms
[main] INFO io.javalin.Javalin - Jetty is listening on: [http://localhost:7000]
[main] INFO io.javalin.Javalin - Javalin has started \o/
```
> Now you can use curl to test this http server demo
```
root@development:~/graal-javalin# curl localhost:7000
{"someValue":"Hello World!"}root@development:~/graal-javalin#
```

## Creating a native static image from the jar file just created
Issue the following command to create a native executable file
```
native-image -jar /tmp/build/build/libs/graal-javalin-all-1.0-SNAPSHOT.jar -H:ReflectionConfigurationFiles=reflection.json -H:+JNI \
  -H:Name=graal-javalin --static
```
> If everything went successfully processed you should see
```
Build on Server(pid: 12665, port: 37411)*
[graal-javalin:12665]    classlist:  16,110.28 ms
[graal-javalin:12665]        (cap):   3,790.90 ms
[graal-javalin:12665]        setup:   9,370.68 ms
[ForkJoinPool-2-worker-0] INFO org.eclipse.jetty.util.log - Logging initialized @31844ms to org.eclipse.jetty.util.log.Slf4jLog
[graal-javalin:12665]   (typeflow):  60,372.94 ms
[graal-javalin:12665]    (objects):  30,566.64 ms
[graal-javalin:12665]   (features):   1,470.75 ms
[graal-javalin:12665]     analysis:  94,797.43 ms
[graal-javalin:12665]     universe:   2,434.01 ms
[graal-javalin:12665]      (parse):   9,487.51 ms
[graal-javalin:12665]     (inline):  14,371.24 ms
[graal-javalin:12665]    (compile): 103,450.76 ms
[graal-javalin:12665]      compile: 131,444.60 ms
[graal-javalin:12665]        image:   6,497.17 ms
[graal-javalin:12665]        write:   1,502.72 ms
[graal-javalin:12665]      [total]: 262,903.58 ms
root@development:~/graal-javalin#
```
## Running a native executable just create from above commands
```
root@development:~/graal-javalin# ./graal-javalin
[main] INFO io.javalin.Javalin -
 _________________________________________
|        _                  _ _           |
|       | | __ ___   ____ _| (_)_ __      |
|    _  | |/ _` \ \ / / _` | | | '_ \     |
|   | |_| | (_| |\ V / (_| | | | | | |    |
|    \___/ \__,_| \_/ \__,_|_|_|_| |_|    |
|_________________________________________|
|                                         |
|    https://javalin.io/documentation     |
|_________________________________________|
[main] INFO io.javalin.Javalin - Starting Javalin ...
[main] INFO org.eclipse.jetty.server.Server - jetty-9.4.z-SNAPSHOT; built: 2018-08-30T13:59:14.071Z; git: 27208684755d94a92186989f695db2d7b21ebc51; jvm 1.8.0_202
[main] INFO org.eclipse.jetty.server.session - DefaultSessionIdManager workerName=node0
[main] INFO org.eclipse.jetty.server.session - No SessionScavenger set, using defaults
[main] INFO org.eclipse.jetty.server.session - node0 Scavenging every 600000ms
[main] INFO org.eclipse.jetty.server.handler.ContextHandler - Started i.j.c.u.initialize$httpHandler$1@4de0c85e{/,null,AVAILABLE}
[main] INFO org.eclipse.jetty.server.handler.ContextHandler - Started o.e.j.s.ServletContextHandler@21e56525{/,null,AVAILABLE}
[main] INFO org.eclipse.jetty.server.AbstractConnector - Started ServerConnector@cc2210e{HTTP/1.1,[http/1.1]}{0.0.0.0:7000}
[main] INFO org.eclipse.jetty.server.Server - Started @12ms
[main] INFO io.javalin.Javalin - Jetty is listening on: [http://localhost:7000]
[main] INFO io.javalin.Javalin - Javalin has started \o/
```
## Understanding the advantage of having a native executable image
> Startup time is almost instantaneously 
```
Started @12ms
```
> and when running from traditional jar file 
```
Started @1549ms
```

# Fantastic, isn't it ? Thank you, GraalVM !
