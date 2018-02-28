FROM ubuntu:artful-20171019

MAINTAINER Jeremiah H. Savage <jeremiahsavage@gmail.com>

RUN apt-get update \
    && apt-get install -y \
       openjdk-9-jre-headless \
       r-base \
       wget \
    && apt-get clean \
    && wget https://github.com/broadinstitute/picard/releases/download/2.17.11/picard.jar \
    && mv picard.jar /usr/local/bin/ \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*