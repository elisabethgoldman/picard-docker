FROM ubuntu:16.04

MAINTAINER Jeremiah H. Savage <jeremiahsavage@gmail.com>

ENV picard_docker 0.1

USER root

ENV DEBIAN_FRONTEND=noninteractive

RUN aptitude update \
    && aptitude dist-upgrade -y --force-yes

RUN aptitude update && aptitude install -y --force-yes \
    openjdk-8-jre-headless \
    r-base \
    sudo \
    time \
    unzip \
    wget

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://github.com/broadinstitute/picard/releases/download/2.5.0/picard-tools-2.5.0.zip \
    && unzip picard-tools-2.5.0.zip \
    && mv picard-tools-2.5.0/*.jar /usr/local/bin \
    && rm *.zip

RUN adduser --disabled-password --gecos '' ubuntu && adduser ubuntu sudo && echo "ubuntu	ALL=(ALL)	NOPASSWD:ALL" >> /etc/sudoers.d/ubuntu

ENV HOME /home/ubuntu

USER ubuntu

WORKDIR ${HOME}
