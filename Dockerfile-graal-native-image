FROM panga/graalvm-ce AS build

ADD HelloContainers.java /app/
WORKDIR /app
RUN ["javac", "HelloContainers.java"]

RUN native-image \
    --no-server \
    --static \
    -cp . \
    HelloContainers



FROM scratch

COPY --from=build /app/hellocontainers /

CMD ["/hellocontainer", "From GraalVM native image"]
