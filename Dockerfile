FROM ubuntu:16.04

MAINTAINER Junavare <junavare@gmail.com>
# Based on the work of https://hub.docker.com/r/retrew/nukkitdocker

RUN apt-get update \
    && apt-get install -y \
      openjdk-8-jre-headless \ 
      wget \
&& apt-get clean \ && rm -rf /var/lib/apt/lists/*

RUN mkdir /nukkit /nukkit_bin
RUN wget http://ci.mengcraft.com:8080/job/nukkit/lastSuccessfulBuild/artifact/target/nukkit-1.0-SNAPSHOT.jar -O /nukkit_bin/nukkit-latest.jar
VOLUME /nukkit
WORKDIR /nukkit

EXPOSE 19132

CMD ["java", "-jar", "/nukkit_bin/nukkit-latest.jar"]

