FROM oraclelinux:7-slim
ADD openjdk-11+28_linux-x64_bin.tar.gz /opt/jdk
ENV PATH=$PATH:/opt/jdk/jdk-11/bin

RUN ["java", "-Xshare:dump"]
ADD HelloContainers.class /
CMD ["java", "-Xshare:on", "-showversion", "HelloContainers", "From Container"]
