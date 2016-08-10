FROM ubuntu:xenial-20160713

MAINTAINER Jeremiah H. Savage <jeremiahsavage@gmail.com>

USER root

RUN apt-get update && apt-get install -y  \
    openjdk-8-jre-headless \
    r-base \
    sudo \
    unzip \
    wget

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://github.com/broadinstitute/picard/archive/2.6.0.tar.gz \
    && unzip picard-tools-2.6.0.zip \
    && mv picard-tools-2.6.0/*.jar /usr/local/bin \
    && rm -rf *.zip picard-tools-2.6.0