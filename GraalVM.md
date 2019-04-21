
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
```
