FROM alpine:latest as build
ADD openjdk-11+28_linux-x64-musl_bin.tar.gz /opt/jdk
ENV PATH=$PATH:/opt/jdk/jdk-11/bin
RUN ["jlink", "--compress=2", \
     "--module-path", "/opt/jdk/jdk-11/jmods", \
     "--add-modules", "java.base", \
     "--output", "/linked"]


FROM alpine:latest
COPY --from=build /linked /opt/jdk/
ENV PATH=$PATH:/opt/jdk/bin
ADD HelloContainers.class /
CMD ["java", "-showversion", "HelloContainers", "From", "Alpine"]
