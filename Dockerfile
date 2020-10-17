FROM jenkins/jenkins:lts
MAINTAINER Georgi Spasov <gspasov2@gmail.com>

# Update, install maven, Oracle Java8
USER root
RUN apt-get -y update && apt-get -y upgrade && \
    apt-get install -y maven && \
    apt-get install -y openjdk-8-jdk

# install manually all the missing libraries
RUN apt-get install -y gconf-service libasound2 libatk1.0-0 libcairo2 libcups2 libfontconfig1 libgdk-pixbuf2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libxss1 fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils

# install chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

ENV MAVEN_HOME /opt/maven
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
ENV CHROME_BIN='/usr/bin/chromium-browser'

