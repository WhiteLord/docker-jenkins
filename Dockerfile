FROM jenkins/jenkins:lts
MAINTAINER Georgi Spasov <gspasov2@gmail.com>

# Install maven, Oracle Java8
USER root
RUN apt-get -y update && apt-get -y upgrade && \
    apt-get install -y maven && \
    apt-get install -y openjdk-8-jdk

ENV MAVEN_HOME /opt/maven
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

