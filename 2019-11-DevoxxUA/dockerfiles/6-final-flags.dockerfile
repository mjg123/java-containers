FROM adoptopenjdk/openjdk11:alpine

# Run this and grep for "ergonomic"
# adjust the container capabilities with `docker run -m xxx`
# `docker run --cpus xxxx`

CMD ["java", "-XX:+PrintFlagsFinal", "-version"]
