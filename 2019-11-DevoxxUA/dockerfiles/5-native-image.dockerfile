FROM scratch

# Download the latest graal
# native-image --static --no-fallback -jar sparkdemo-1.0-SNAPSHOT.jar

ADD sparkdemo-1.0-SNAPSHOT .
CMD ["./sparkdemo-1.0-SNAPSHOT"]
