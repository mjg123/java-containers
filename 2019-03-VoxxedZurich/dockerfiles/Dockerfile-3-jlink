FROM ubuntu:18.04

# Generate myjdk by:
# 1/ jdeps --print-module-deps sparkdemo-1.0-SNAPSHOT.jar
# 2/ jlink --output myjdk \                              
#          --module-path $JAVA_HOME/jmods \
#          --add-modules java.base,java.desktop,java.instrument,java.management,java.naming,java.security.jgss,java.sql
#
# Saves another 200mb ish

ADD myjdk /opt/jdk
ADD sparkdemo-1.0-SNAPSHOT.jar 
CMD ["/opt/jdk/bin/java", "-jar", "sparkdemo-1.0-SNAPSHOT.jar"]
