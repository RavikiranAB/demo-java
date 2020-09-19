FROM ubuntu:latest
WORKDIR java
RUN     apt-get update && \
        apt-get -y install openjdk-8-jdk && \
        apt-get -y install wget && \
        apt-get install -y tzdata && \
        apt-get -y install git && \
        apt-get install -y maven  && \
        wget http://apachemirror.wuchna.com/tomcat/tomcat-9/v9.0.38/bin/apache-tomcat-9.0.38.tar.gz && \
        tar -xzvf apache-tomcat-9.0.38.tar.gz && \
        git clone https://github.com/RavikiranAB/demo-java.git && \
        cd demo-java  && \
        mvn package && \
        cp target/demo.war  /java/apache-tomcat-9.0.38/webapps/



CMD  /java/apache-tomcat-9.0.38/bin/catalina.sh run

EXPOSE 8080
