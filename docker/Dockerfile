FROM ubuntu:xenial-20160809

MAINTAINER Jeremiah H. Savage <jeremiahsavage@gmail.com>

USER root

RUN apt-get update && apt-get install -y \
    openjdk-8-jre-headless \
    r-base \
    sudo \
    unzip \
    wget

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://github.com/broadinstitute/picard/releases/download/2.6.0/picard.jar \
    && mv picard.jar /usr/local/bin/