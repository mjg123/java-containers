# Java in a world of containers demos

## Prereqs

  - docker
  - perf
  - download 10.0.1 and 11-ea-alpine

  - download graal
  - apt install gcc zlib1g-dev
  
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
