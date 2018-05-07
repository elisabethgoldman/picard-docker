FROM ubuntu:bionic-20180426

MAINTAINER Jeremiah H. Savage <jeremiahsavage@gmail.com>

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y \
       openjdk-11-jre-headless \
       r-base \
       wget \
    && apt-get clean \
    && wget https://github.com/broadinstitute/picard/releases/download/2.18.4/picard.jar \
    && mv picard.jar /usr/local/bin/ \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*