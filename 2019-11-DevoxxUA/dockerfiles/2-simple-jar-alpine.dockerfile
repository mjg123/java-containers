FROM adoptopenjdk/openjdk11:alpine

ADD target/sparkdemo-1.0-SNAPSHOT.jar .

CMD ["java", "-jar", "sparkdemo-1.0-SNAPSHOT.jar"]
