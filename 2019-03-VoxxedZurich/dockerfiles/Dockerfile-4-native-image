FROM scratch

# Download the latest graal from github
# native-image --static -jar sparkdemo-1.0-SNAPSHOT.jar

ADD sparkdemo-1.0-SNAPSHOT
CMD ["/opt/jdk/bin/java", "-jar", "sparkdemo-1.0-SNAPSHOT.jar"]
