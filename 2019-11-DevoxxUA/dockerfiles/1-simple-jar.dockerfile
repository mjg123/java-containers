FROM adoptopenjdk/openjdk11

ADD target/sparkdemo-1.0-SNAPSHOT.jar .

CMD ["java", "-jar", "sparkdemo-1.0-SNAPSHOT.jar"]
