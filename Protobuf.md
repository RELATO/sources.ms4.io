# Protobuf.md

https://github.com/golang/protobuf/releases

> latest-protobuf-ubuntu-18-04
```
sudo apt-get install autoconf automake libtool curl make g++ unzip -y
git clone https://github.com/google/protobuf.git
cd protobuf
git submodule update --init --recursive
./autogen.sh
./configure
make
make check
sudo make install
sudo ldconfig

```
