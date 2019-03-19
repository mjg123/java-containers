# Java in a world of containers demos

## Prereqs

  - docker
  - perf
  - gcc & zlib1g-dev
  - download JDK-11 and 11-aalpine from http://jdk.java.net/11/
  - download graal from https://github.com/oracle/graal/releases

_Based on Ubuntu 18.04_

Follow this guide: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
(ends with logging out and in again)

```shell
sudo apt install git gcc zlib1g-dev linux-tools-common linux-tools-generic linux-tools-$(uname -r)
git clone https://github.com/mjg123/java-containers.git

cd java-containers

wget https://download.java.net/java/early_access/jdk11/28/GPL/openjdk-11+28_linux-x64_bin.tar.gz
wget https://download.java.net/java/early_access/alpine/28/binaries/openjdk-11+28_linux-x64-musl_bin.tar.gz

cd ..

wget https://github.com/oracle/graal/releases/download/vm-1.0.0-rc4/graalvm-ce-1.0.0-rc4-linux-amd64.tar.gz

tar xvf java-containers/openjdk-11*
tar xvf graalvm*

export JAVA_HOME=~/jdk-10.0.2
export GRAAL_HOME=~/graalvm-ce-1.0.0-rc4

$JAVA_HOME/bin/java -version
$GRAAL_HOME/bin/java -version
```

NB version numbers embedded in filenames might have changed so check the Dockerfiles

## Demos

### Plain invocation

  - javac HelloContainer & run it
  - Introduce perf: sudo perf stat -e cpu-clock -r50 !!

Record the results in the source file

### CDS

  - java -Xshare:dump
  - java -Xshare:on HelloContainer CDS
  - sudo perf stat -e cpu-clock -r50 !!

Should be 30-60 ms faster

### AOT

  - jaotc --compile-commands touched.aotcfg --output touched.so --module java.base --info
  - java -Xshare:on -XX:AOTLibrary=./touched.so HelloContainer AOT
  - sudo perf stat -e cpu-clock -r50 !!

Should be _another_ 30-60 ms faster

### Graal Native Image

  - May need to recompile the class file w/ jdk8: $GRAAL_HOME/bin/javac HelloContainer.java
  - $GRAAL_HOME/bin/native-image --no-server --static HelloContainer
  - ./hellocontainer
  - sudo perf stat -e cpu-clock -r50 !!
